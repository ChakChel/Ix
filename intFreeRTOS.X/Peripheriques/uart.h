/**
 * @file    uart.h
 * @brief   Header des fonctions associées à l'UART
 * IDE MPLAB X vs Beta 7.02
 * Compilateur XC32 vs 2.0
 * @author  Ixchel Intelligent Systems
 * @version 1.0
 * @date    25/10/13
 */

#ifndef _UART_
#define	_UART_

/* INCLUDES DEPENDENCIES ***************/
#include <plib.h>


/* MACROS ***************/
#define UART_FREQ   (40000000L)     // Fréquence UART
#define BAUDRATE    115200          // Baudrate


/* FUNCTION PROTOTYPES ***************/

/**
 * @fn      void uartInit( void )
 * @brief   Configuration de l'UART1
 */
void uartInit( void );

/**
 * @fn      void uartInit( void )
 * @brief   Configuration des interruptions de l'UART1
 */
void uartIntConfig( void );

/**
 * @fn      char uartGetChar( void )
 * @brief   Réception d'un caractère par l'UART
 * @return  Caractère reçu, ou '\0' si aucun caractère n'a été reçu
 */
char uartGetChar( void );

/**
 * @fn      void uartPutChar( char c )
 * @brief   Envoi d'un caractère par l'UART
 * @param   c   Caractère à envoyer
 */
void uartPutChar( char c );

/**
 * @fn      void uartPutString( char* s )
 * @brief   Envoi d'un string par l'UART suivi d'un retour à la ligne
 * @param   s   Chaîne de caractères à envoyer
 */
void uartPutString( char* s );


#endif	/* _UART_ */