/**
 * @file    timer.c
 * @brief   Fonctions associées au timer
 * IDE MPLAB X vs Beta 7.02
 * Compilateur XC32 vs 2.0
 * @author  Ixchel Intelligent Systems
 * @version 1.0
 * @date    25/10/13
 */

/* INCLUDES DEPENDENCIES ***************/
#include "timer.h"

/* FUNCTIONS ***************/

/**
 * @fn      void timerInit( void )
 * @brief   Configuration du timer 3
 */
void timerInit( void ) {
    
    OpenTimer3( T3_ON | T3_SOURCE_INT | T3_PS_1_1, T3_TICK );
}

/**
 * @fn      void timerIntConfig( void )
 * @brief   Configuration des interruptions du timer 3
 */
void timerIntConfig( void ) {

    // L'interruption pour le  SPI a une priorité de 2,
    // car il est vital qu'il soit traité immédiatement
//    ConfigIntTimer3( T3_INT_ON | T3_INT_PRIOR_1 );
}