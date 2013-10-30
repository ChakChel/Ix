/**
 * @file    pwm.h
 * @brief   Header des fonctions associées à la génération du signal PWM
 * IDE MPLAB X vs Beta 7.02
 * Compilateur XC32 vs 2.0
 * @author  Ixchel Intelligent Systems
 * @version 1.0
 * @date    25/10/13
 */

#ifndef _PWM_
#define	_PWM_

/* INCLUDES DEPENDENCIES ***************/
#include <plib.h>
#include "hardware.h"
#include "timer.h"


/* PROTOTYPES ***************/

/**
 * @fn      void  pwmInit( void );
 * @brief   Configuration de l'Output Compare 1
 */
void pwmInit( void );

/**
 * @fn      void pwmSet( int val );
 * @brief   Envoie du rapport cyclique au PWM
 * @param   val valeur du rapport cyclique entre 1 et T3_tick
 */
void pwmSet( int val );

/**
 * @fn      void pwmClose( void );
 * @brief   Fermeture de l'Output Compare 1
 */
void pwmClose( void );


#endif	/* _PWM_ */