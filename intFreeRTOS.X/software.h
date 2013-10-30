/**
 * @file    software.h
 * @brief   Configuration software du projet
 * IDE MPLAB X vs Beta 7.02
 * Compilateur XC32 vs 2.0
 * @author  Ixchel Intelligent Systems
 * @version 1.0
 * @date    25/10/13
 */

#ifndef _SOFTWARE_
#define	_SOFTWARE_

/* MACROS ***************/
#define TAILLE_TABLEAU  64
#define TAILLE_MESURE   TAILLE_TABLEAU
#define TAILLE_COMMANDE TAILLE_TABLEAU


/* GLOBAL VARIABLES ***************/
#pragma idata

// Valeurs
unsigned int consigne = 0;
unsigned int mesure[3][TAILLE_MESURE];
unsigned int commande[TAILLE_COMMANDE];

// Buffer
char aux;

// Pointeurs
unsigned int pMesure = 0;
unsigned int pCommande = 0;

// Flags
unsigned int flagTraitementT3 = 0;
unsigned int flagReception = 0;
unsigned int flagAuto = 1;

// Handle du canal SPI
signed int spiChannel = 1;

// Sémaphore de réception UART
void * semUART;

// Sémaphore de réception CAN
void * semCAN;

// Queue de traitement
void * queueTraitement;

int pwm=0;

#endif	/* _SOFTWARE_ */