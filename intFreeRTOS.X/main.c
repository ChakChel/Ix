/**
 * @file    main.c
 * @brief   Programme principal
 * IDE MPLAB X vs Beta 7.02
 * Compilateur XC32 vs 2.0
 * @author  Ixchel Intelligent Systems
 * @version 1.0
 * @date    24/10/13
 */

/* INCLUDE FILES ***************/
#include "main.h"


/* INTERRUPTS ***************/

/**
 * @fn      void __ISR( _UART2_VECTOR, IPL2SOFT ) intUart3AHandler( void )
 * @brief   Vecteur d'interruption de l'UART1A
 */
void __ISR(_UART1_VECTOR, IPL2SOFT ) IntUart1Handler(void) {

    // Si on a reçu une donnée
    if (mU1ARXGetIntFlag()) {
        // Réception de l'ordre
        aux = uartGetChar();

	// Notification de réception
        xTaskResumeFromISR(xDialogueUARTHandle);

        // On baisse le flag
        mU1ARXClearIntFlag();
    }
    // On ignore les interruptions sur TX
    mU1ATXClearIntFlag();
}

/* FUNCTIONS ***************/

/**
 * @fn      void userInit( void );
 * @brief   Configuration des périphériques
 */
void userInit( void ) {

    unsigned int    periphBusClk;

    // Config Système
    // Cache (wait states) et bus périphériques
    // retourne la vitesse de travail du bus périphérque (non utilisée)
    periphBusClk = SYSTEMConfig(SYS_FREQ, SYS_CFG_WAIT_STATES | SYS_CFG_PCACHE);
    // Désactivation du JTAG pour accéder aux LEDs
    mJTAGPortEnable( DEBUG_JTAGPORT_OFF );

    // Config UART
    uartInit();
//    uartPutString("UART configured\r\n");

    //Config GPIO
    gpioInit();
//    uartPutString("GPIO configured\r\n");

    // Config PWM
    timerInit();
    pwmInit();
//    uartPutString("PWM configured\r\n");

    // Config SPI
    spiChannel  = ads7885Pic32Open( CHN_SPI, 20 );
//    uartPutString("SPI configured\r\n");

    // Init du l'algorithme de commande
    mesure[2][pMesure]=ads7885Pic32Read( CHN_SPI,3);//data_VO;
    init_stockage(mesure[2][pMesure],pwm,ref);

    // Config CAN1
    CAN1Init();
//    uartPutString("CAN configured\r\n");
}

/**
 * @fn      void intConfig( void );
 * @brief   Configuration des interruptions
 */
void intConfig( void ){

    // Config Interruptions
    // Mode "multi-vectored". Vecteurs d'interruption multiples
    INTEnableSystemMultiVectoredInt();
    // Validation globale des interruptions
    INTEnableInterrupts();
//    uartPutString("Interrupts configured\r\n");
}

/**
 * @fn      void rtosInit( void );
 * @brief   Configuration des taches
 */
void rtosInit( void ) {
    
    // Tâches
    xTaskCreate(traitementMesures,
                "Traitement",
                configMINIMAL_STACK_SIZE,
                NULL,
                2,
                &xTraitementMesuresHandle);
    xTaskCreate(dialogueUART,
                "dialogue UART",
                configMINIMAL_STACK_SIZE,
                NULL,
                1,
                &xDialogueUARTHandle);
    xTaskCreate(dialogueCAN,
                "dialogue CAN",
                configMINIMAL_STACK_SIZE,
                NULL,
                1,
                &xDialogueCANHandle);
//   uartPutString("Tasks configured\r\n");
}

/**
 * @fn      void close( void );
 * @brief   Fermeture des périphériques
 */
void close( void ){

    pwmClose();
    ads7885Pic32Close( CHN_SPI );
}

/**
 * @fn      void traitementMesures(void* pvParameters)
 * @brief   Traite les données reçues par le SPI
 * @brief   Se réveille à chaque tick (réglé à 2kHz dans FreeRTOSConfig.h) (A MODIFIER)
 * @param   pvParameters  Pointeur sur un paramètre passé à la tâche
 */
void traitementMesures( void* pvParameters ) {

    unsigned int compteurGPIO = 0;
    portTickType xLastWakeTime;
    const portTickType xFrequency = 640;

    // boucle d'excecution
    for(;;) {
        
        xLastWakeTime = xTaskGetTickCount();
        mesure[0][pMesure] = ads7885Pic32Read( CHN_SPI,1);    //data_IL;
        mesure[1][pMesure] = ads7885Pic32Read( CHN_SPI,2);    //data_VI;
        mesure[2][pMesure] = ads7885Pic32Read( CHN_SPI,3);    //data_VO;

        // Commande
        if (flagAuto != 0) {
       		// Calcul
        	commande[pCommande] = execute_rst( ref, mesure[2][pMesure] );
            pwmSet(commande[pCommande]);
        } else {
            pwmSet(pwm);
        }

        // Incrémentation
        pMesure++;
        if (pMesure >= TAILLE_MESURE)
            pMesure = 0;

        //Prise en charge de la DEL
        compteurGPIO++;
        if (compteurGPIO >= 1200) {
            gpioLed(mesure[2][pMesure]);
            compteurGPIO = 0;
        }

        pCommande++;
        if (pCommande >= TAILLE_COMMANDE)
            pCommande = 0;

        vTaskDelayUntil( &xLastWakeTime, xFrequency );
    }
    close();
}

/**
 * @fn      void dialogueUART( void *pvParameters )
 * @brief   Reçoit des ordres depuis le port série
 * @brief   Se réveille lors de l'arrivée de données sur l'UART
 * @param   pvParameters  Pointeur sur un paramètre passé à la tâche
 */
void dialogueUART( void *pvParameters ) {

    int i = 0;              // compteurs de boucle
    int j;                  // compteurs de boucle
    char BUF_RX[50];        // buffer de reception via l'uart
    char BUF_TX[100];      // buffer de transmission via l'uart
    int aux1;               // variable tampon pour vérifier la validité avant de mettre dans pwm
    char ordre[50];         // variable tampon pour récupérer l'ordre envoyé par l'uart
    char cons[10];          // variable tampon pour récupérer la consigne suivant l'ordre

    // boucle d'excecution
    for(;;) {

        vTaskSuspend(xDialogueUARTHandle);

        if (aux == 0x1B && i == 0) {
            i = strlen(ordre)+ 1 + strlen(cons) + 1;
            sprintf (BUF_TX,"%s %s\r\n", ordre, cons);
            uartPutString(BUF_RX);
        } else {
            uartPutChar(aux);         // renvoie d'aquittement

            // prise en compte de correction
            if (aux == '\b') {
                if(i > 0) {
                    i--;
                    uartPutChar(' ');
                    uartPutChar('\b');
                }

            //recupération de l'ordre caractere par caractere tant qu'il n'y a pas de retour chariot
            } else if (aux != '\r') {
                BUF_RX[i] = aux;
                i++;
            } else {    // si aux = \r
                BUF_RX[i] = '\0';
                uartPutChar('\r');
                uartPutChar('\n');
                i = 0;

                // Séparation ordre-consigne
                while ((BUF_RX[i] != ' ')&&(BUF_RX[i] != '\0')) {
                    ordre[i] = BUF_RX[i];
                    i++;
                }
                ordre[i] = '\0';      // transformation de ordre en string
                j = 0;
                while (BUF_RX[i] != '\0') {
                    cons[j] = BUF_RX[i];
                    i++;
                    j++;
                }
                cons[j] = '\0';       // transformation de ordre en string
                i = 0;

                if(strcmp(ordre, "auto") == 0){
                    strcpy(BUF_TX,"automatic mode is running\n\rchange voltage reference value with ref command\n\r");
                    flagAuto = TRUE;
                    ref = 180;

                } else if (strcmp(ordre, "manual") == 0) {
                    strcpy(BUF_TX,"pwm mode is running\n\rchange duty cycle value with pwm command\n\r");
                    flagAuto = FALSE;
                    pwm = 0;

                } else if (strcmp(ordre, "ref") == 0) {
                    sscanf(cons,"%i",&aux1);
					if (flagAuto == FALSE)
                    	sprintf(BUF_TX,"manual mode is running, write manual before sending a new value for ref\n\r");
                    else if ((aux1 != 18)&&(aux1 != 24)&&(aux1 != 30)&&(aux1 != 36))
                        strcpy(BUF_TX,"error: failed value\n\r");
                    else {
                        ref = aux1*10;
                        sprintf(BUF_TX,"output voltage value is updated to %d\n\r",ref);
                    }

                } else if (strcmp(ordre, "pwm") == 0){
                    sscanf(cons,"%i",&aux1);
                    if (flagAuto == TRUE)
                        sprintf(BUF_TX,"automatic mode is running, write manual before sending a new value for pwm\n\r");
                    else if ((aux1 >= 0) && (aux1 <= 100) && (strcmp(cons, "") != 0)) {
                        sprintf(BUF_TX,"the duty cycle value is updated to %d%\n\r",aux1);
                        pwm = aux1;
                    } else
                        strcpy(BUF_TX,"error: failed value\n\r");

                } else if (strcmp(ordre, "meas") == 0) {
                    sprintf(BUF_TX,"Courant d'entree : IL = %d A\n\r",mesure[0][pMesure]);
                    uartPutString(BUF_TX);
                    sprintf(BUF_TX,"Tension d'entree : VI = %d V\n\r",mesure[2][pMesure]);
                    uartPutString(BUF_TX);
                    sprintf(BUF_TX,"Tension de sortie : VO = %d V\n\r",mesure[1][pMesure]);
//                    uartPutString(BUF_TX);

                } else if(strcmp(ordre, "can") == 0) {
                    uartPutString("can controller configuration :\n\r");
                    sprintf(BUF_TX,"bus speed 250000 bps\n\r");
                    uartPutString(BUF_TX);
                    sprintf(BUF_TX,"data length 8 bytes\n\r");
                    uartPutString(BUF_TX);
                    sprintf(BUF_TX,"filter 0x%03X\n\r",fil);
                    uartPutString(BUF_TX);
                    strcpy(BUF_TX,"filter mask 0x7FF\n\r");

                } else if (strcmp(ordre, "filter") == 0) {
                    if(strlen(cons) == 3) {
                        sscanf(cons,"%X",&fil);
                        sprintf(BUF_TX,"can filter value is updated to \
                        0x%03X\n\r",fil);
                    } else
                        sprintf(BUF_TX,"error: failed value size= %d\n\r",strlen(cons));

                } else if (strcmp(ordre, "help") == 0) {
                    uartPutString("auto         start automatic mode and stop manual mode\r\n");
                    uartPutString("             update voltage reference value with ref command\r\n");
                    uartPutString("manual       start manual mode and stop automatic mode\r\n");
                    uartPutString("             update duty cycle value with pwm command\r\n");
                    uartPutString("ref          update output voltage reference value\r\n");
                    uartPutString("pwm          update duty cycle value\r\n");
                    uartPutString("meas         print currents analog values\r\n");
                    uartPutString("can          print can controller configuration\r\n");
                    uartPutString("filter       update can filter\r\n");
                    sprintf(BUF_TX,"help        print supported commands\r\n");
                }

                else if (strcmp(ordre, "") == 0)
                    strcpy(BUF_TX,"\r\n");

                else
                    strcpy(BUF_TX,"error: enter help to know the supported \
                    commands\n\r");

                uartPutString(BUF_TX);
                strcpy(BUF_TX,"boost:~# \0");
                uartPutString(BUF_TX);
            }
        }
    }
}

/**
 * @fn  void dialogueCAN( void *pvParameters )
 * @brief   Reçoit des ordres depuis le bus CAN
 * @briefSe réveille lors de l'arrivée de données sur le CAN
 * @param   pvParameters  Pointeur sur un paramètre passé à la tâche
 */
void dialogueCAN( void *pvParameters ) {
	// Initialiser l'ID du module.
    CAN_RX_MSG_SID msgID;       // identifiant du message
    msgID.SID = 0x00;//0x7FF;
    msgID.FILHIT = 0x00;
    msgID.CMSGTS = 0x0000;
  	// Flag pour savoir le type de frame recu
    BOOL flagACK = FALSE; // remote frame
    BOOL flagSend = FALSE; // data frame

    // Initialisation du tableau de reception
    BYTE dataReceive[8];
    int Indice = 0;
    for (Indice = 0; Indice < 8; Indice++) {
        dataReceive[Indice] = 0;
    }

    // Initialisation du tableau de transmission
    BYTE dataTransmit[8];
    for (Indice = 0; Indice < 8; Indice++) {
       dataTransmit[Indice] = 1;
    }

//    while (msgID.SID == 0x7FF) {
//        // Reception du message et sauvegarde de la nouvelle ID
//        CAN1RxMsgProcess(dataReceive,&msgID);
//        msgID.SID = 0x000;//dataReceive[0];
//    }
//    // Reinitialisation du CAN avec la nouvelle ID
//    INTDisableInterrupts();
//    CAN1Reinit(&msgID);
//    INTEnableInterrupts();
//    msgID.SID;

    fil = msgID.SID;

    while (1) {

        vTaskSuspend(xDialogueCANHandle);

        if (msgID.SID != fil) {
            msgID.SID = fil;
            CAN1Reinit(&msgID);
        }

        dataTransmit[0] = ref;
        dataTransmit[1] = mesure[1][pMesure];
        dataTransmit[2] = mesure[2][pMesure];
        dataTransmit[3] = mesure[0][pMesure];

        // Reponse du can 1 (module boost) suivant le type
        // de tram recu : data ou remote
        if (flagACK == TRUE) {
            flagACK = FALSE;
            CAN1TxACK(dataReceive, &msgID);
            ref = dataReceive[0];
        }

        if (flagSend == TRUE) {
            flagSend = FALSE;
            CAN1TxRequest(dataTransmit, &msgID);
        }

        CAN1TxRequest(dataTransmit, &msgID);

//        CAN1TxSendLEDMsg(dataReceive,&msgID);     // Function is defined in CANFunctions.c*/

//        CAN1RxMsgProcess2(dataReceive,&msgID);
        CAN1RxMsgProcess(dataReceive, &msgID, &flagSend, &flagACK);
    }
}

/**
 * @fn      int main( void );
 * @brief   Point d'entrée du programme
 * @return
 */
int main( void ) {
    
    // Initialisations utilisateur (configurations périphériques)
    userInit();

    // Initialisations des interruptions
    intConfig();

    // Initialisations RTOS - Real Time Operating System
    rtosInit();

    // Démarrage de l'ordonnanceur
//    uartPutString("Starting scheduler");
    //Affichage d'accueil
    uartPutString(" ****** * * ******* ******     ***    ******    **    ****** ***   ***\r\n");
    uartPutString("*  **** * * *** *** * *** *   *   *  *  ****   *  *   * **** *  *  * *\r\n");
    uartPutString("* *     * *   * *   * *** *  *  *  * * *      * ** *  * *    * * * * *\r\n");
    uartPutString("* *     * *   * *   * ** *   * *** * * *     * **** * * ***  * ** ** *\r\n");
    uartPutString("* *     * *   * *   * * * *  *  *  * * *     * *  * * * *    * * * * *\r\n");
    uartPutString("*  **** * *   * *   * *  * *  *   *  *  **** * *  * * * **** * *  *  *\r\n");
    uartPutString(" ****** * *   * *   * *   * *  ***    ****** * *  * * ****** * *   * *\r\n");
    uartPutString("citroen corp. with Ixchel Intelligent Systems patnership\r\n");
    uartPutString("boost converter module interface. Enter help to know the supported commands\r\nboost:~# \0");

    // Activation des interruptions propres à l'UART
    uartIntConfig();
    // Activation des interruptions propres au Timer
    timerIntConfig();

    vTaskStartScheduler();
}