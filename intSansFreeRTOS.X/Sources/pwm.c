/**
 * @file    pwm.c
 * @brief   Fonctions associées au pwm
 * IDE MPLAB X vs Beta 7.02
 * Compilateur XC32 vs 2.0
 * @author  Ixchel Intelligent Systems
 * @version 1.0
 * @date    23/10/13
 */


/* INCLUDES DEPENDENCIES ***************/
#include "pwm.h"

/* FUNCTIONS ***************/

/**
 * @fn      void pwmInit( void )
 * @brief   Configuration de l'Output Compare 1
 */
void pwmInit( void ){
    OpenOC1( OC_ON | OC_TIMER3_SRC | OC_PWM_FAULT_PIN_DISABLE, 0, 0);
}

/**
 * @fn      void pwmSet( int val );
 * @brief   Envoie du rapport cyclique au PWM
 * @param   val valeur du rapport cyclique entre 1 et T3_tick
 */
void pwmSet( int val ) {

    SetDCOC1PWM( val );
}

/**
 * @fn      void pwmClose( void );
 * @brief   Fermeture de l'Output Compare 1
 */
void pwmClose( void ) {
    
    CloseOC1();
}