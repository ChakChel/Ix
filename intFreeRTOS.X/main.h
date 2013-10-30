/**
 * @file    main.h
 * @brief   Header principal
 * IDE MPLAB X vs Beta 7.02
 * Compilateur XC32 vs 2.0
 * @author  Ixchel Intelligent Systems
 * @version 1.0
 * @date    24/10/13
 */

#ifndef _MAIN_
#define	_MAIN_

/* INCLUDES DEPENDENCIES ***************/
// Librairie standarde du C
#include <stdlib.h>

// Configuration matérielle
#include "hardware.h"

// Configuration logicielle
#include "software.h"

// Application
#include <p32xxxx.h>    // PIC32
#include <plib.h>       // Périphériques

// RTOS
#include "FreeRTOS.h"
#include "croutine.h"
#include "timers.h"
#include "task.h"
#include "queue.h"
#include "semphr.h"
#include "FreeRTOSConfig.h"

// Périphériques
#include "ads7885Pic32.h"
#include "gpio.h"
#include "pwm.h"
#include "timer.h"
#include "uart.h"

/* CONFIG ***************/
#pragma config FWDTEN=OFF
#pragma config CP=OFF

// POSCMOD = XT (externe 3,5MHz-10MHz) ou HS (externe 10MHz-40MHz)
#pragma config POSCMOD=XT

// PLL si FNOSC = PRIPLL
#pragma config FNOSC=PRIPLL

// CPUfreq = 8MHz   (ext. christal explorer 16) / FPLIDIV .
//                  doit être compris entre 4MHz < ? < 5MHz (datasheet)
// CPUfreq = ( (8MHz (ext. explorer 16) / FPLLIDIV) x FPLLMUL ) / FPLLODIV
#pragma config FPLLIDIV=DIV_2
#pragma config FPLLMUL=MUL_20
#pragma config FPLLODIV=DIV_1

// FPBDIV = DIV_2 pré-config de la freq du bus periph.
#pragma config FPBDIV=DIV_2


/* PROTOTYPES ***************/

/**
 * @fn      void init( void );
 * @brief   Configuration des périphériques
 */
void userInit( void );

/**
 * @fn      void intConfig( void );
 * @brief   Configuration des interruptions
 */
void intConfig( void );

/**
 * @fn      void rtosInit( void )
 * @brief   Initialise le noyau avant de le lancer
 */
void rtosInit( void );

/**
 * @fn      void close( void );
 * @brief   Fermeture des périphériques
 */
void close( void );

/**
 * @fn  unsigned int fTransfert( unsigned int consigne, unsigned int* mesure, \
        unsigned int* commande )
 * @brief   Fonction de transfert
 * @param   consigne    Valeur de la consigne
 * @param   mesure      Tableau des valeurs passées de la mesure
 * @param   commande    Tableau des valeurs passées de la commande
 * @return  Commande à l'instant t
 */
unsigned int fTransfert( unsigned int consigne, unsigned int* mesure,\
unsigned int* commande );

/**
 * @fn  void traitementMesures(void* pvParameters)
 * @brief   Traite les donnÃ©es reÃ§ues par le SPI
 * @brief	Se rÃ©veille Ã  chaque tick (rÃ©glÃ© Ã  2kHz dans FreeRTOSConfig.h) (A MODIFIER)
 * @param   pvParameters  Pointeur sur un paramÃ¨tre passÃ© Ã  la tÃ¢che
 */
void traitementMesures(void* pvParameters);

/**
 * @fn  void dialogueUART( void *pvParameters )
 * @brief   ReÃ§oit des ordres depuis le port sÃ©rie
 * @briefSe rÃ©veille lors de l'arrivÃ©e de donnÃ©es sur l'UART
 * @param   pvParameters  Pointeur sur un paramÃ¨tre passÃ© Ã  la tÃ¢che
 */
void dialogueUART( void *pvParameters );

/**
 * @fn  void dialogueCAN( void *pvParameters )
 * @brief   ReÃ§oit des ordres depuis le bus CAN
 * @briefSe rÃ©veille lors de l'arrivÃ©e de donnÃ©es sur le CAN
 * @param   pvParameters  Pointeur sur un paramÃ¨tre passÃ© Ã  la tÃ¢che
 */
void dialogueCAN( void *pvParameters );

/**
 * @fn      int main( void );
 * @brief   Point d'entrée du programme
 * @return
 */
int main( void );


#endif	/* _MAIN_ */