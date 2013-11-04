/**
 * @file    ads7885Pic32.h
 * @brief   Header de la biblioth�que ads7885Pic32
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
#define IL_slave_select_active()       LATGbits.LATG14 = 0
#define IL_slave_select_desactive()    LATGbits.LATG14 = 1

#define VO_slave_select_active()       LATAbits.LATA2 = 0
#define VO_slave_select_desactive()    LATAbits.LATA2 = 1

#define VI_slave_select_active()       LATAbits.LATA3 = 0
#define VI_slave_select_desactive()    LATAbits.LATA3 = 1


/* FUNCTION PROTOTYPES ***************/

/**
 * @fn      SpiChannel ads7885Pic32Open( SpiChannel chn, unsigned int srcClkDiv\
 *           );
 * @brief   Configuration ads7885 via liaison SPI
 * @param   chn       Canal � ouvrir
 * @param   srcClkDiv Diviseur de fr�quence d'horloge
 * @return  chn si la configuration est r�ussi, -1 sinon
 */
SpiChannel ads7885Pic32Open( SpiChannel chn, unsigned int srcClkDiv );

/**
 * @fn      void ads7885Pic32Read( SpiChannel chn, char* data_IL, char* \
 *          data_VO, Char* data_VI )
 * @brief   Lit les donn�e envoy�es par l'ADC
 * @param   chn     Canal � lire
 * @param   periph  Choix de l'ADC
 * @return  valeur re�u de l'ADC
 */
unsigned short ads7885Pic32Read( SpiChannel chn, int periph );

/**
 * @fn      void aads7885Pic32Close( SpiChannel chn );
 * @brief   Ferme le canal
 * @param   chn   Canal � fermer
 */
void ads7885Pic32Close( SpiChannel chn );


#endif	/* _ADS7885PIC32_ */