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
    // SDI1 = RC4
    // SDO1 = RD0
    // /SS_IL = RD9
    // /SS_VO = RB0
    // /SS_VI = RB1
    // SCK1 = RD10

    // Config des ports entrée/sortie, régle le débit binaire à 20MHz.
    SpiChnOpen( chn, config, srcClkDiv );

    // Configuration des GPIOs pour les /CS
    PORTSetPinsDigitalOut( IOPORT_D, BIT_9 );
    PORTSetBits( IOPORT_D, BIT_9 );

    PORTSetPinsDigitalOut( IOPORT_B, BIT_0 );
    PORTSetBits( IOPORT_B, BIT_0 );

    PORTSetPinsDigitalOut( IOPORT_B, BIT_1 );
    PORTSetBits( IOPORT_B, BIT_1 );
    
    return chn;
}

/**
 * @fn      void ads7885Pic32Read( SpiChannel chn, char* data_IL, char* \
 *          data_VO, Char* data_VI )
 * @brief   Lit les donnée envoyées par l'ADC
 * @param   chn   Canal à lire
 * @param   data  Pointeur vers l'emplacement de stockage de la donnée
 */
void ads7885Pic32Read( SpiChannel chn, char* data_IL, char* data_VI, \
char* data_VO ) {

    // /CS = 0
    IL_slave_select_active();
    // Reception des caractere SDOUT
    // on reçoit 2 bit à 0 et 8 bit. PIC32 little endian=>bit de poid failbe à \
    gauche, on décale donc dans le bon sens de 2 bits
    *data_IL = SpiChnGetC( chn ) << 2;

    // /CS = 1
    IL_slave_select_desactive();

    // /CS = 0
    VI_slave_select_active();
    // Reception des caractere SDOUT
    // on reçoit 2 bit à 0 et 8 bit. PIC32 little endian=>bit de poid failbe à \
    gauche, on décale donc dans le bon sens de 2 bits
    *data_VI = SpiChnGetC( chn ) << 2;

    // /CS = 1
    VI_slave_select_desactive();

    // /CS = 0
    VO_slave_select_active();
    // Reception des caractere SDOUT
    // on reçoit 2 bit à 0 et 8 bit. PIC32 little endian=>bit de poid failbe à \
    gauche, on décale donc dans le bon sens de 2 bits
    *data_VO = SpiChnGetC( chn ) << 2;
    // /CS = 1
    VO_slave_select_desactive();
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
    PORTSetPinsDigitalIn( IOPORT_D, BIT_9 );
    PORTSetPinsDigitalIn( IOPORT_B, BIT_0 );
    PORTSetPinsDigitalIn( IOPORT_B, BIT_1 );
}