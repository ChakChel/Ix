/**
 * @file    gpio.c
 * @brief   Fonctions associ�es au GPIO
 * IDE MPLAB X vs Beta 7.02
 * Compilateur XC32 vs 2.0
 * @author  Ixchel Intelligent Systems
 * @version 1.0
 * @date    23/10/13
 */


/* INCLUDES DEPENDENCIES ***************/
#include "gpio.h"


/* FUNCTIONS ***************/

/**
 * @fn      void gpioInit( void );
 * @brief   Configuration des GPIO
 */
void gpioInit( void ) {
    
    // D�sactivation du JTAG pour acc�der aux LEDs
    mJTAGPortEnable( DEBUG_JTAGPORT_OFF );

    // RD1 en sortie
    PORTSetPinsDigitalOut( IOPORT_D, BIT_1 );

    // Initialisation de RD1 au niveau bas
    mPORTDClearBits( BIT_1 );
}

/**
 * @fn      char gpioLed( char charge );
 * @brief   Mise en place du clignotement de la led sans charge utile connect�e
 */
char gpioLed( char charge ) {

    if (charge == 0)
        PORTToggleBits( IOPORT_D, BIT_1 );
}