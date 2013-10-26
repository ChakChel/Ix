/**
 * @file    gpio.h
 * @brief    Header des fonctions associées au GPIO
 * IDE MPLAB X vs Beta 7.02
 * Compilateur XC32 vs 2.0
 * @author  Ixchel Intelligent Systems
 * @version 1.0
 * @date    23/10/13
 */
#ifndef _GPIO_
#define	_GPIO_

/* INCLUDES DEPENDENCIES ***************/
#include <plib.h>
#include "hardware.h"


/* MACROS ***************/
#define SYS_FREQ    (80000000L) // Fréquence du CPU

/* GLOBAL VARIABLES ***************/

char charge;    // Indicateur de charge de sortie = V0

/* PROTOTYPES ***************/

/**
 * @fn      void gpioInit( void );
 * @brief   Configuration des GPIO
 */
void gpioInit( void );

/**
 * @fn      char gpioLed( void );
 * @brief   Mise en place du clignotement de la led sans charge utile connectée
 */
char gpioLed( void );


#endif	/* _UART_ */

