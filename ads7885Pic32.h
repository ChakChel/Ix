/**
 * @file    ads7885Pic32.h
 * @brief   Header de la bibliothèque ads7885Pic32
 * IDE MPLAB X vs Beta 7.02
 * Compilateur XC32 vs 2.0
 * @author  Ixchel Intelligent Systems
 * @version 1.0
 * @date    24/10/13
 */

#ifndef _ADS7885PIC32_
#define	_ADS7885PIC32_

/* INCLUDES DEPENDENCIES ***************/
#include <plib.h>


/* MACROS ***************/
#define IL_slave_select_active()       LATDbits.LATD9 = 0
#define IL_slave_select_desactive()    LATDbits.LATD9 = 1

#define VO_slave_select_active()       LATAbits.LATA14 = 0
#define VO_slave_select_desactive()    LATAbits.LATA14 = 1

#define VI_slave_select_active()       LATAbits.LATA15 = 0
#define VI_slave_select_desactive()    LATAbits.LATA15 = 1


/* FUNCTION PROTOTYPES ***************/

/**
 * @fn      SpiChannel ads7885Pic32Open( SpiChannel chn, unsigned int srcClkDiv\
 *           );
 * @brief   Configuration ads7885 via liaison SPI
 * @param   chn       Canal à ouvrir
 * @param   srcClkDiv Diviseur de fréquence d'horloge
 * @return  chn si la configuration est réussi, -1 sinon
 */
SpiChannel ads7885Pic32Open( SpiChannel chn, unsigned int srcClkDiv );

/**
 * @fn      void ads7885Pic32Read( SpiChannel chn, int* data );
 * @brief   Lit les donnée envoyées par l'ADC
 * @param   chn   Canal à lire
 * @param   data  Pointeur vers l'emplacement de stockage de la donnée
 */
void ads7885Pic32Read( SpiChannel chn, int* data );

/**
 * @fn      void aads7885Pic32Close( SpiChannel chn );
 * @brief   Ferme le canal
 * @param   chn   Canal à fermer
 */
void ads7885Pic32Close( SpiChannel chn );


#endif	/* _ADS7885PIC32_ */