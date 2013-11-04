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

/* INCLUDES DEPENDENCIES ***************/
#include "main.h"


/* MACROS ***************/
// Taille
#define TAILLE_TABLEAU          64
#define TAILLE_MESURE           TAILLE_TABLEAU
#define TAILLE_COMMANDE         TAILLE_TABLEAU

// SYSTEMConfig Flags
#define SYS_CFG_WAIT_STATES     0x00000001 //SYSTEMConfig wait states
#define SYS_CFG_PB_BUS          0x00000002 //SYSTEMConfig pb bus
#define SYS_CFG_PCACHE          0x00000004 //SYSTEMConfig cache
#define SYS_CFG_ALL             0xFFFFFFFF //SYSTEMConfig All


/* GLOBAL VARIABLES ***************/
// Valeurs
int pwm = 0;        // stock le rapport cyclique à envoyer au pwm
int ref = 180;      // stock la référence à envoyer à l'algorithme de commande
int fil = 0;        // stock la valeur du filtre pour le can
unsigned short mesure[3][TAILLE_MESURE];
unsigned int commande[TAILLE_COMMANDE];
char aux;           // stock les caractères envoyés par l'uart avant d'être traité.

// Pointeurs
unsigned int pMesure = 0;
unsigned int pCommande = 0;

// Flags
BOOL flagAuto = TRUE;

// Handle du canal SPI
signed int spiChannel = 3;


#endif	/* _SOFTWARE_ */