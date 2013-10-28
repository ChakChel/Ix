/**
 * @file    main.h
 * @brief   Programme principal
 * IDE MPLAB X vs Beta 7.02
 * Compilateur XC32 vs 2.0
 * @author  Ixchel Intelligent Systems
 * @version 1.0
 * @date    24/10/13
 */

#include "main.h"

/* GLOBAL VARIABLES *********/
char aux;
int i;

/* INTERRUPTS ***************/

/**
 * @fn      void __ISR( _UART2_VECTOR, IPL2SOFT ) intUart3AHandler( void )
 * @brief   Vecteur d'interruption de l'UART1A
 */
void __ISR(_UART1_VECTOR, IPL2SOFT ) IntUart1Handler(void) {

//     Si on a reçu une donnée
    if (mU1ARXGetIntFlag()) {
            aux = uartGetChar();
//			 Notification de réception
            flagReception = 1;
//        On baisse le flag
        mU1ARXClearIntFlag();
    }

//   On ignore les interruptions sur TX
  if (mU1ATXGetIntFlag());
  mU1ATXClearIntFlag();
      
}

/**
 * @fn      void __ISR( _TIMER_3_VECTOR, IPL2SOFT ) Timer3Handler( void )
 * @brief   Vecteur d'interruption du timer 3
 */
void __ISR( _TIMER_3_VECTOR, IPL2SOFT ) Timer3Handler(void){

    // On baisse le flag
    mT3ClearIntFlag();
    // Début de traitement
    flagTraitement = 1;
}


/* FUNCTIONS ***************/

/**
 * @fn      void init( void );
 * @brief   Configuration des périphériques
 */
void init(void){

//    gpioInit();
    uartInit();
    timerInit();
    pwmInit();
    spiChannel = ads7885Pic32Open( CHN_SPI, 40 );
}

/**
 * @fn      void intConfig( void );
 * @brief   Configuration des interruptions
 */
void intConfig(void){

    uartIntConfig();
    timerIntConfig();
    INTEnableSystemMultiVectoredInt();
}

/**
 * @fn      void close( void );
 * @brief   Fermeture des périphériques
 */
void close(void){

    pwmClose();
    ads7885Pic32Close( CHN_SPI );
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
unsigned int fTransfert(unsigned int consigne, unsigned int* mesure, unsigned int* commande){

    return mesure[pMesure]/100;
}

/**
 * @fn      int main( void );
 * @brief   Point d'entrée du programme
 * @return
 */
int main(void){

    char ordre[50];
    char cons[10];
    int ref=18;
    int pwm=0;
    int fil=0;
    char BUF_RX[50];
    char BUF_TX[1000];
    int aux1;
    char *data_IL, *data_VO, *data_VI;

    //Optimisation du fonctionnement du CPU
    SYSTEMConfig(SYS_FREQ, SYS_CFG_WAIT_STATES | SYS_CFG_PCACHE);

    init();
    intConfig();







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

    while (1) {;

        if (flagTraitement) {
            flagTraitement = 0;
            // Acquisition
            ads7885Pic32Read( CHN_SPI, data_IL, data_VO, data_VI );
            mesure[0][pMesure]=atoi(data_IL);
            mesure[1][pMesure]=atoi(data_VO);
            mesure[2][pMesure]=atoi(data_VI);

            pMesure++;
            if (pMesure >= TAILLE_MESURE)
                pMesure = 0;
          gpioLed();
            // Calcul
            commande[pCommande] = fTransfert(consigne, mesure[0], commande);
//
//            // Commande
//            pwmSet(commande[pCommande]);
//            pCommande++;
//            if (pCommande >= TAILLE_COMMANDE)
//                pCommande = 0;*/
            if (flagAuto == 0){
                pwmSet(pwm);
            }
        }

        if (flagReception) {

            uartPutChar(aux);

            if(aux=='\b'){
                if(i>0) i--;
            }
            else if(aux!='\r'){
                BUF_RX[i]=aux;
                i++;
            }
            else
            {
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
                int j=0;
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
                }
                else if(strcmp(ordre, "manual")==0){
                    strcpy(BUF_TX,"pwm mode is running\n\rchange duty cycle value with pwm command\n\r");
                    flagAuto = 0;
                    pwm=0;
                }
                else if(strcmp(ordre, "ref")==0){

                    sscanf(cons,"%i",&aux1);

                    if((aux1!=18)&&(aux1!=24)&&(aux1!=30)&&(aux1!=36)){
                        strcpy(BUF_TX,"error: failed value\n\r");
                    }
                    else {
                        ref=aux1;
                        sprintf(BUF_TX,"output voltage value is updated to %d\n\r",ref);
                    }
                }
                else if(strcmp(ordre, "pwm")==0){

                    sscanf(cons,"%i",&aux1);

                    if((aux1>=0)&&(aux1<=100)&&(strcmp(cons, "")!=0)){
                        sprintf(BUF_TX,"the duty cycle value is updated to %d%\n\r",aux1);
                        pwm= (aux1*T3_TICK)/100;
                    }
                    else {
                        strcpy(BUF_TX,"error: failed value\n\r");
                    }
                }
                else if(strcmp(ordre, "means")==0);//{
                    //                break;
                //            }
                else if(strcmp(ordre, "can")==0){
                    uartPutString("can controller configuration :\n\r");
                    sprintf(BUF_TX,"bus speed 250000 bps\n\r");
                    uartPutString(BUF_TX);
                    sprintf(BUF_TX,"data length 8 bytes\n\r");
                    uartPutString(BUF_TX);
                    sprintf(BUF_TX,"filter 0x%03X\n\r",fil);
                    uartPutString(BUF_TX);
                    strcpy(BUF_TX,"filter mask 0xFFF\n\r");
                }
                else if(strcmp(ordre, "filter")==0){
                    if(strlen(cons)==3){
                        sscanf(cons,"%X",&fil);
                        sprintf(BUF_TX,"can filter value is updated to 0x%03X\n\r",fil);
                    }
                    else {
                        sprintf(BUF_TX,"error: failed value size= %d\n\r",strlen(cons));
                    }
                }
                else if(strcmp(ordre, "help")==0){
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
                else if(strcmp(ordre, "")==0){
                    strcpy(BUF_TX,"\r\n");
                }
                else{
                    strcpy(BUF_TX,"error: enter help to know the supported commands\n\r");
                }
                uartPutString(BUF_TX);
                strcpy(BUF_TX,"boost:~# \0");
                uartPutString(BUF_TX);
            }

            flagReception = 0;

            if (consigne < 0)
            consigne = 0;
            else if (consigne > 262143)
            consigne = 262143;
        }
    }

    close();
}