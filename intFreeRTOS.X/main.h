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

// Configuration mat�rielle
#include "hardware.h"

// Configuration logicielle
#include "software.h"

// Application
#include <p32xxxx.h>    // PIC32
#include <plib.h>       // P�riph�riques

// RTOS
#include "FreeRTOS.h"
#include "croutine.h"
#include "timers.h"
#include "task.h"
#include "queue.h"
#include "semphr.h"
#include "FreeRTOSConfig.h"

// P�riph�riques
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
//                  doit �tre compris entre 4MHz < ? < 5MHz (datasheet)
// CPUfreq = ( (8MHz (ext. explorer 16) / FPLLIDIV) x FPLLMUL ) / FPLLODIV
#pragma config FPLLIDIV=DIV_2
#pragma config FPLLMUL=MUL_20
#pragma config FPLLODIV=DIV_1

// FPBDIV = DIV_2 pr�-config de la freq du bus periph.
#pragma config FPBDIV=DIV_2


/* PROTOTYPES ***************/

/**
 * @fn      void init( void );
 * @brief   Configuration des p�riph�riques
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
 * @brief   Fermeture des p�riph�riques
 */
void close( void );

/**
 * @fn  unsigned int fTransfert( unsigned int consigne, unsigned int* mesure, \
        unsigned int* commande )
 * @brief   Fonction de transfert
 * @param   consigne    Valeur de la consigne
 * @param   mesure      Tableau des valeurs pass�es de la mesure
 * @param   commande    Tableau des valeurs pass�es de la commande
 * @return  Commande � l'instant t
 */
unsigned int fTransfert( unsigned int consigne, unsigned int* mesure,\
unsigned int* commande );

/**
 * @fn  void traitementMesures(void* pvParameters)
 * @brief   Traite les données reçues par le SPI
 * @brief	Se réveille à chaque tick (réglé à 2kHz dans FreeRTOSConfig.h) (A MODIFIER)
 * @param   pvParameters  Pointeur sur un paramètre passé à la tâche
 */
void traitementMesures(void* pvParameters);

/**
 * @fn  void dialogueUART( void *pvParameters )
 * @brief   Reçoit des ordres depuis le port série
 * @briefSe réveille lors de l'arrivée de données sur l'UART
 * @param   pvParameters  Pointeur sur un paramètre passé à la tâche
 */
void dialogueUART( void *pvParameters );

/**
 * @fn  void dialogueCAN( void *pvParameters )
 * @brief   Reçoit des ordres depuis le bus CAN
 * @briefSe réveille lors de l'arrivée de données sur le CAN
 * @param   pvParameters  Pointeur sur un paramètre passé à la tâche
 */
void dialogueCAN( void *pvParameters );

/**
 * @fn      int main( void );
 * @brief   Point d'entr�e du programme
 * @return
 */
int main( void );


#endif	/* _MAIN_ */