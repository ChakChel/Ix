/***************************************************************************//**
 * @file    main.c
 * @author  Ixchell
 * @version 0.1
 * @date    24/10/13
 *
 * Programme 
 ******************************************************************************/

/*** INCLUDES *****************************************************************/

#include "main.h"

/*** INTERRUPTS ***************************************************************/

/***************************************************************************//**
 * Vecteur d'interruption de l'UART3A
 ******************************************************************************/
void __ISR(_UART2_VECTOR, IPL2SOFT) intUart3AHandler(void) {

    // Si on a reçu une donnée
    if (mU3ARXGetIntFlag()) {

        // Notification de réception
        flagReception = 1;

        // On baisse le flag
        mU3ARXClearIntFlag();
    }

  // On ignore les interruptions sur TX
  if (mU3ATXGetIntFlag())
      mU3ATXClearIntFlag();
}

/***************************************************************************//**
 * Vecteur d'interruption du timer 3
 ******************************************************************************/
void __ISR(_TIMER_3_VECTOR, IPL2SOFT) Timer3Handler(void) {

    // On baisse le flag
    mT3ClearIntFlag();

    // Début de traitement
    flagTraitement = 1;
}


/*** FUNCTIONS ****************************************************************/

/***************************************************************************//**
 * Configuration des périphériques
 ******************************************************************************/
void init(void) {
    uartInit();
    timerInit();
	pwmInit();
    //spiChannel = ad7634Pic32Open(SPI_CHANNEL1, 40);
}

/***************************************************************************//**
 * Configuration des interruptions
 ******************************************************************************/
void intConfig(void) {

    uartIntConfig();
    timerIntConfig();

    INTEnableSystemMultiVectoredInt();
}

/***************************************************************************//**
 * Fermeture des peripheriques
 ******************************************************************************/
void close(void) {
    pwmClose();
    //ad7634Pic32Close(spiChannel);
}

/***************************************************************************//**
 * Fonction de transfert
 *
 * @param consigne  Valeur de la consigne
 * @param mesure    Tableau des valeurs passées de la mesure
 * @param commande  Tableau des valeurs passées de la commande
 *
 * @return  Commande à l'instant t
 ******************************************************************************/
unsigned int fTransfert(unsigned int consigne,
                        unsigned int* mesure,
                        unsigned int* commande) {
    return mesure[pMesure]/100;
}


/*** MAIN *********************************************************************/

/***************************************************************************//**
 * Point d'entrée du programme
 ******************************************************************************/
int main(void) {

    char ordre[50] ;

    init();
    intConfig();

    while (1) {

        if (flagTraitement) {

            flagTraitement = 0;
            /*
            // Acquisition
            ad7634Pic32Read(spiChannel, &(mesure[pMesure]));
            pMesure++;
            if (pMesure >= TAILLE_MESURE)
                pMesure = 0;

            // Calcul
            commande[pCommande] = fTransfert(consigne, mesure, commande);

            // Commande
            pwmSet(commande[pCommande]);
            pCommande++;
            if (pCommande >= TAILLE_COMMANDE)
                pCommande = 0;*/
        }

        if (flagReception) {

            flagReception = 0;

            // On reçoit l'ordre
            ordre = BUF_RX;

            // On le traite
            switch (ordre) {
            if(ordre == 'auto')'auto':
					break;
				case 'manual':
				
					break;
				case 'ref':
					break;
				case 'pwm':
					break;
				case 'meas':
					break;
				case 'can':
					break;
				case 'filter':
					break;
				case 'help':
				
					break;
            }

            if (consigne < 0)
                consigne = 0;
            else if (consigne > 262143)
                consigne = 262143;
        }
    }

    close();
}