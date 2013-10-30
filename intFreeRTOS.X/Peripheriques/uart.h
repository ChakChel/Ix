/**
 * @file    uart.h
 * @brief   Header des fonctions associ�es � l'UART
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
#define UART_FREQ   (40000000L)     // Fr�quence UART
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
 * @brief   R�ception d'un caract�re par l'UART
 * @return  Caract�re re�u, ou '\0' si aucun caract�re n'a �t� re�u
 */
char uartGetChar( void );

/**
 * @fn      void uartPutChar( char c )
 * @brief   Envoi d'un caract�re par l'UART
 * @param   c   Caract�re � envoyer
 */
void uartPutChar( char c );

/**
 * @fn      void uartPutString( char* s )
 * @brief   Envoi d'un string par l'UART suivi d'un retour � la ligne
 * @param   s   Cha�ne de caract�res � envoyer
 */
void uartPutString( char* s );


#endif	/* _UART_ */