/**
 * @file    timer.h
 * @brief   Header des fonctions associées au timer
 * IDE MPLAB X vs Beta 7.02
 * Compilateur XC32 vs 2.0
 * @author  Ixchel Intelligent Systems
 * @version 1.0
 * @date    25/10/13
 */

#ifndef _TIMER_
#define	_TIMER_

/* INCLUDES DEPENDENCIES ***************/
#include <plib.h>
#include "hardware.h"


/* MACROS ***************/
#define PRESCALE3       64
#define FREQ_TIMER      500000
#define T3_TICK       	(PERIPH_FREQ/PRESCALE3/FREQ_TIMER)
#define T4_TICK       	65535


/* FUNCTION PROTOTYPES ***************/

/**
 * @fn      void timerInit( void )
 * @brief   Configuration du timer 3
 */
void timerInit( void );

/**
 * @fn      void timerIntConfig( void )
 * @brief   Configuration des interruptions
 */
void timerIntConfig( void );

#endif	/* _TIMER_ */