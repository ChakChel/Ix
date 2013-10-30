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

    static signed portBASE_TYPE xHigherPriorityTaskWoken;	//???

    // Si on a reçu une donnée
    if (mU1ARXGetIntFlag()) {
        // Réception de l'ordre
        aux = uartGetChar();

	// Notification de réception
	xSemaphoreGiveFromISR(semUART, &xHigherPriorityTaskWoken);
        flagReception = 1;

        // On baisse le flag
        mU1ARXClearIntFlag();
    }
    // On ignore les interruptions sur TX
    mU1ATXClearIntFlag();
}

/**
 * @fn      void __ISR( _TIMER_3_VECTOR, IPL2SOFT ) Timer3Handler( void )
 * @brief   Vecteur d'interruption du timer 3
 */
void __ISR( _TIMER_3_VECTOR, IPL2SOFT ) Timer3Handler(void){

    static signed portBASE_TYPE xHigherPriorityTaskWoken = pdFALSE;	//???

    char data_IL, data_VI, data_VO;

    // Acquisition
    ads7885Pic32Read( spiChannel, &data_IL, &data_VO, &data_VI );

    // Envoie des données via Queue
    xQueueSendFromISR(  queueTraitement,
                        &data_IL,
                        &xHigherPriorityTaskWoken);
    xQueueSendFromISR(  queueTraitement,
                        &data_VI,
                        &xHigherPriorityTaskWoken);
    xQueueSendFromISR(  queueTraitement,
                        &data_VO,
                        &xHigherPriorityTaskWoken);
    // On baisse le flag
    mT3ClearIntFlag();
    // Début de traitement
    flagTraitementT3 = 1;
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
//    uartPutString("UART configured");

    //Config GPIO
    gpioInit();
//    uartPutString("GPIO configured");

    // Config PWM
    timerInit();
    pwmInit();
//    uartPutString("PWM configured");

    // Config SPI
    spiChannel  = ads7885Pic32Open( spiChannel, 40 );
//    uartPutString("SPI configured");
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
//    uartPutString("Interrupts configured");
}

/**
 * @fn      void rtosInit( void );
 * @brief   Configuration des interruptions
 */
void rtosInit( void ) {

    xTaskHandle xTraitementHandle, xReceptionHandle;

    // Sémaphores
    vSemaphoreCreateBinary(semUART)
    vSemaphoreCreateBinary(semCAN)
//    uartPutString("Semaphores configured");

    // Queues
    queueTraitement = xQueueCreate(10, sizeof(unsigned int));
//    uartPutString("Queues configured");

    // Tâches
    xTaskCreate(traitementMesures,
                "Traitement",
                configMINIMAL_STACK_SIZE,
                NULL,
                2,
                &xTraitementHandle);
    xTaskCreate(dialogueUART,
                "dialogue UART",
                configMINIMAL_STACK_SIZE,
                NULL,
                1,
                &xReceptionHandle);
    xTaskCreate(dialogueCAN,
                "dialogue CAN",
                configMINIMAL_STACK_SIZE,
                NULL,
                1,
                &xReceptionHandle);
//   uartPutString("Tasks configured");
}

/**
 * @fn      void close( void );
 * @brief   Fermeture des périphériques
 */
void close( void ){

    pwmClose();
    ads7885Pic32Close( spiChannel );
}

/**
 * @fn  unsigned int fTransfert( unsigned int consigne, unsigned int* mesure, \
        unsigned int* commande )
 * @brief   Fonction de transfert
 * @param   consigne    Valeur de la consigne
 * @param   mesure      Tableau des valeurs passées de la mesure
 * @param   commande    Tableau des valeurs passées de la commande
 * @return  Commande à l'instant t
 */
unsigned int fTransfert( unsigned int consigne, unsigned int* mesure,
unsigned int* commande){

    return mesure[pMesure]/100;
}

/**
 * @fn      void traitementMesures(void* pvParameters)
 * @brief   Traite les données reçues par le SPI
 * @brief   Se réveille à chaque tick (réglé à 2kHz dans FreeRTOSConfig.h) (A MODIFIER)
 * @param   pvParameters  Pointeur sur un paramètre passé à la tâche
 */
void traitementMesures( void* pvParameters ) {

    unsigned int compteurInt;

    // Activation des interruptions propres au Timer
    timerIntConfig();

    for(;;) {
        if (flagTraitementT3
            && xQueueReceive(   queueTraitement,
                                &(mesure[0][pMesure]),
                                portMAX_DELAY) == pdTRUE
            && xQueueReceive(   queueTraitement,
                     		&(mesure[1][pMesure]),
                                portMAX_DELAY) == pdTRUE
            && xQueueReceive(   queueTraitement,
                                &(mesure[2][pMesure]),
                                portMAX_DELAY) == pdTRUE ) {
            flagTraitementT3 = 0;

            pMesure++;
            if (pMesure >= TAILLE_MESURE)
                pMesure = 0;

            compteurInt++;
            if (compteurInt >= 35000) {
                gpioLed(mesure[2][pMesure]);
                compteurInt = 0;
            }

            // Calcul
            commande[pCommande] = fTransfert(consigne, mesure[0], commande);

            // Commande
            if (flagAuto != 0)
                pwmSet(commande[pCommande]);
            else
                pwmSet(pwm);

            // Incrément
            pMesure++;
            if (pMesure >= TAILLE_MESURE)
                pMesure = 0;

            pCommande++;
            if (pCommande >= TAILLE_COMMANDE)
                pCommande = 0;
        }
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

    int i, j;
    char BUF_RX[50];
    char BUF_TX[1000];
    int aux1;
    char ordre[50];
    char cons[10];
    int ref = 18;
    int fil = 0;
    
    // Activation des interruptions propres à l'UART
    uartIntConfig();

    for(;;) {

        if (flagReception && xSemaphoreTake(semUART, portMAX_DELAY) == pdTRUE) {

            uartPutChar(aux);

            if(aux=='\b'){              // ????
                if(i>0) i--;            // ????
            } else if(aux!='\r'){       // ????
                BUF_RX[i]=aux;          // ????
                i++;                    // ????
            } else {
                BUF_RX[i]='\0';
                uartPutChar('\r');
                uartPutChar('\n');
                i=0;
                // On reçoit l'ordre
                while(BUF_RX[i]!=' '){
                    ordre[i]=BUF_RX[i];
                    i++;
                }
                ordre[i]='\0';
                i++;
                j = 0;
                while(BUF_RX[i]!='\0'){
                    cons[j]=BUF_RX[i];
                    i++;
                    j++;
                }
                cons[j]='\0';

                i=0;

                if(strcmp(ordre, "auto")==0){
                    strcpy(BUF_TX,"automatic mode is running\n\rchange voltage reference value with ref command\n\r");
                    flagAuto = 1;
                    ref=18;

                } else if(strcmp(ordre, "manual")==0){
                    strcpy(BUF_TX,"pwm mode is running\n\rchange duty cycle value with pwm command\n\r");
                    flagAuto = 0;
                    pwm = 0;

                } else if(strcmp(ordre, "ref")==0){
                    sscanf(cons,"%i",&aux1);
                    if((aux1!=18)&&(aux1!=24)&&(aux1!=30)&&(aux1!=36)){
                        strcpy(BUF_TX,"error: failed value\n\r");
                    } else {
                        ref=aux1;
                        sprintf(BUF_TX,"output voltage value is updated to %d\n\r",ref);
                    }

                } else if(strcmp(ordre, "pwm")==0){
                    sscanf(cons,"%i",&aux1);
                    if((aux1>=0)&&(aux1<=100)&&(strcmp(cons, "")!=0)){
                        sprintf(BUF_TX,"the duty cycle value is updated to %d%\n\r",aux1);
                        pwm= (aux1*T3_TICK)/100;
                    } else
                        strcpy(BUF_TX,"error: failed value\n\r");

                } else if(strcmp(ordre, "meas")==0) {
                    


                } else if(strcmp(ordre, "can")==0){
                    uartPutString("can controller configuration :\n\r");
                    sprintf(BUF_TX,"bus speed 250000 bps\n\r");
                    uartPutString(BUF_TX);
                    sprintf(BUF_TX,"data length 8 bytes\n\r");
                    uartPutString(BUF_TX);
                    sprintf(BUF_TX,"filter 0x%03X\n\r",fil);
                    uartPutString(BUF_TX);
                    strcpy(BUF_TX,"filter mask 0xFFF\n\r");

                } else if(strcmp(ordre, "filter")==0){
                    if(strlen(cons)==3){
                        sscanf(cons,"%X",&fil);
                        sprintf(BUF_TX,"can filter value is updated to 0x%03X\n\r",fil);
                    } else
                        sprintf(BUF_TX,"error: failed value size= %d\n\r",strlen(cons));

                } else if(strcmp(ordre, "help")==0){
                    uartPutString("auto         start automatic mode and stop manual mode\r\n");
                    uartPutString("             update voltage reference value with ref command\r\n");
                    uartPutString("manual       start manual mode and stop automatic mode\r\n");
                    uartPutString("             update duty cycle value with pwm command\r\n");
                    uartPutString("ref          update output voltage reference value\r\n");
                    uartPutString("pwm          update duty cycle value\r\n");
                    uartPutString("means        print currents analog values\r\n");
                    uartPutString("can          print can controller configuration\r\n");
                    uartPutString("filter       update can filter\r\n");
                    sprintf(BUF_TX,"help         print supported commands\r\n");
                }

                else if(strcmp(ordre, "")==0)
                    strcpy(BUF_TX,"\r\n");

                else
                    strcpy(BUF_TX,"error: enter help to know the supported commands\n\r");

                uartPutString(BUF_TX);
                strcpy(BUF_TX,"boost:~# \0");
                uartPutString(BUF_TX);
            }

            flagReception = 0;

            if (consigne < 0)                   // ????
                consigne = 0;
            else if (consigne > 262143)
                consigne = 262143;
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
    
}

/**
 * @fn      int main( void );
 * @brief   Point d'entrée du programme
 * @return
 */
int main( void ) {

    char BUF_TX[1000];

    // Initialisations utilisateur (configurations périphériques)
    userInit();

    // Initialisations des interruptions
    intConfig();

    // Initialisations RTOS - Real Time Operating System
    rtosInit();

    // Démarrage de l'ordonnanceur
    uartPutString("Starting scheduler");
    vTaskStartScheduler();

    uartPutString(" ****** * * ******* ******     ***    ******    **    ****** ***   ***\r\n");
    uartPutString("*  **** * * *** *** * *** *   *   *  *  ****   *  *   * **** *  *  * *\r\n");
    uartPutString("* *     * *   * *   * *** *  *  *  * * *      * ** *  * *    * * * * *\r\n");
    uartPutString("* *     * *   * *   * ** *   * *** * * *     * **** * * ***  * ** ** *\r\n");
    uartPutString("* *     * *   * *   * * * *  *  *  * * *     * *  * * * *    * * * * *\r\n");
    uartPutString("*  **** * *   * *   * *  * *  *   *  *  **** * *  * * * **** * *  *  *\r\n");
    uartPutString(" ****** * *   * *   * *   * *  ***    ****** * *  * * ****** * *   * *\r\n");
    uartPutString("citroen corp. with Ixchel Intelligent Systems patnership\r\n");
    strcpy(BUF_TX,"boost converter module interface. Enter help to know the supported commands\r\nboost:~# \0");
    uartPutString(BUF_TX);
}