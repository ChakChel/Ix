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
 * @brief   Configuration du timer 3 et 4
 */
void timerInit( void ) {
    
    OpenTimer3( T3_ON | T3_SOURCE_INT | T3_PS_1_64, T3_TICK );
    OpenTimer4( T4_ON | T4_SOURCE_INT | T4_PS_1_256, T4_TICK );
}

/**
 * @fn      void timerIntConfig( void )
 * @brief   Configuration des interruptions
 */
void timerIntConfig( void ) {

    // L'UART a une priorité de 2,
    // car il est vital qu'il soit traité immédiatement
    ConfigIntTimer3( T3_INT_ON | T3_INT_PRIOR_2 );
    ConfigIntTimer4( T4_INT_ON | T4_INT_PRIOR_1 );
}