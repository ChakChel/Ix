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


/* PROTOTYPES ***************/

/**
 * @fn      void gpioInit( void );
 * @brief   Configuration des GPIO
 */
void gpioInit( void );

/**
 * @fn      char gpioLed( char charge );
 * @brief   Mise en place du clignotement de la led sans charge utile connectée
 * @param   charge  Indicateur de charge de sortie = V0
 */
char gpioLed( char charge );


#endif	/* _UART_ */