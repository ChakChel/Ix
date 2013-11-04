/**
 * @file    spi.c
 * @brief   Fonctions associées au SPI
 * IDE MPLAB X vs Beta 7.02
 * Compilateur XC32 vs 2.0
 * @author  Ixchel Intelligent Systems
 * @version 1.0
 * @date    24/10/13
 */

/* INCLUDES DEPENDENCIES ***************/
#include "ads7885Pic32.h"


/**
 * @fn      SpiChannel ads7885Pic32Open( SpiChannel chn, unsigned int srcClkDiv\
 *           );
 * @brief   Configuration ads7885 via liaison SPI
 * @param   chn       Canal à ouvrir
 * @param   srcClkDiv Diviseur de fréquence d'horloge
 * @return  chn si la configuration est réussi, -1 sinon
 */
SpiChannel ads7885Pic32Open( SpiChannel chn, unsigned int srcClkDiv ) {

    unsigned int config;        //Config SPI

    if (chn > 4 || srcClkDiv > 1024 || srcClkDiv < 2)
        return -1;

    config = SPI_OPEN_MODE16;   // SPI configuration PIC32
    config |= SPI_OPEN_DISSDO;  // disable the usage of the SDO pin by the SPI
    config |= SPI_OPEN_ON;      // SPI périphérique est activé
    config |= SPI_OPEN_MSTEN;   // Agit comme un maître de bus

    // brochage module SPI1 :
    // SDI3A = RF4
    // SDO3A - desactivé
    // /SS_IL = RG14
    // /SS_VO = RA2
    // /SS_VI = RA3
    // SCK1 = RF13

    // Config des ports entrée/sortie, régle le débit binaire à 20MHz.
    SpiChnOpen( chn, config, srcClkDiv );

    // Configuration des GPIOs pour les /CS
    PORTSetPinsDigitalOut( IOPORT_G, BIT_14 );
    PORTSetBits( IOPORT_G, BIT_14 );

    PORTSetPinsDigitalOut( IOPORT_A, BIT_2 );
    PORTSetBits( IOPORT_A, BIT_2 );

    PORTSetPinsDigitalOut( IOPORT_A, BIT_3 );
    PORTSetBits( IOPORT_A, BIT_3 );
    
    return chn;
}

/**
 * @fn      void ads7885Pic32Read( SpiChannel chn, char* data_IL, char* \
 *          data_VO, Char* data_VI )
 * @brief   Lit les donnée envoyées par l'ADC
 * @param   chn   	Canal à lire
 * @param   periph	choix de l'ADC
 * @return  valeur reçu de l'ADC
 */
unsigned short ads7885Pic32Read( SpiChannel chn, int periph ) {

	unsigned short data = 0;

    char c[3];
    c[0]='a';
    c[1]='x';
    c[2]=0;

    // /CS = 0
    switch (periph) {
    case 1:
        IL_slave_select_active();
        break;
    case 2:
        VI_slave_select_active();
        break;
    case 3:
        VO_slave_select_active();
        break;
    }

    SpiChnPutS(chn, c,2);

    while(!SpiChnTxBuffEmpty(chn));
    while(!SpiChnRxBuffFull(chn));
    // Reception des caractere SDOUT
    // on reçoit 2 bit à 0 et 8 bit. PIC32 little endian=>bit de poid failbe à
    // gauche, on décale donc dans le bon sens de 2 bits
      SpiChnGetS(chn, &data, 2);
      data = data >> 5;

    // /CS = 1
    switch (periph){
    case 1:
        IL_slave_select_desactive();
        break;
    case 2:
        VI_slave_select_desactive();
        break;
    case 3:
        VO_slave_select_desactive();
        break;
    }
    
    return data;
}

/**
 * @fn      void aads7885Pic32Close( SpiChannel chn );
 * @brief   Ferme le canal
 * @param   chn   Canal à fermer
 */
void ads7885Pic32Close( SpiChannel chn ) {

    // Fermeture du canal SPI
    SpiChnClose( chn );

    // Libération des broches
    // /CS en entrée pour le liberer
    PORTSetPinsDigitalIn( IOPORT_G, BIT_14 );
    PORTSetPinsDigitalIn( IOPORT_A, BIT_2 );
    PORTSetPinsDigitalIn( IOPORT_A, BIT_3 );
}