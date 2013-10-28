/**
 * @file    uart.c
 * @brief   Fonctions associées à l'UART
 * IDE MPLAB X vs Beta 7.02
 * Compilateur XC32 vs 2.0
 * @author  Ixchel Intelligent Systems
 * @version 1.0
 * @date    25/10/13
 */

/* INCLUDES DEPENDENCIES ***************/
#include <plib.h>
#include "hardware.h"
#include "uart.h"

/* FUNCTIONS ***************/

/**
 * @fn      void uartInit( void )
 * @brief   Configuration de l'UART1A
 */
void uartInit( void ) {

    // Mode de base
    UARTConfigure( UART1, UART_ENABLE_PINS_TX_RX_ONLY );

    // Configuration des interruptions
    UARTSetFifoMode( UART1, UART_INTERRUPT_ON_TX_NOT_FULL |
    UART_INTERRUPT_ON_RX_NOT_EMPTY );

    // 8 bits de donnée, pas de parité, 1 bit de stop
    UARTSetLineControl( UART1, UART_DATA_SIZE_8_BITS | UART_PARITY_NONE |
    UART_STOP_BITS_1 );

    // Configuration baudrate
    UARTSetDataRate( UART1, UART_FREQ, BAUDRATE );

    // Activation UART en transmission et réception
    UARTEnable( UART1, UART_ENABLE_FLAGS(UART_PERIPHERAL | UART_RX | UART_TX) );
}

/**
 * @fn      void uartInit( void )
 * @brief   Configuration des interruptions
 */
void uartIntConfig( void ) {

    // Configuration de l'interruption sur RX de l'UART3A
    INTEnable( INT_SOURCE_UART_RX(UART1), INT_ENABLED );
    INTSetVectorPriority( INT_VECTOR_UART(UART1), INT_PRIORITY_LEVEL_2 );
    INTSetVectorSubPriority( INT_VECTOR_UART(UART1), INT_SUB_PRIORITY_LEVEL_0 );

    // Mode multi-vecteurs
    INTConfigureSystem( INT_SYSTEM_CONFIG_MULT_VECTOR );

    // Activation des interruptions
    INTEnableInterrupts();
}


/**
 * @fn      char uartGetChar( void )
 * @brief   Réception d'un caractère par l'UART
 * @return  Caractère reçu, ou '\0' si aucun caractère n'a été reçu
 */
char uartGetChar( void ) {
    
    return UARTGetDataByte( UART1 );
}

/**
 * @fn      void uartPutChar( char c )
 * @brief   Envoi d'un caractère par l'UART
 * @param   c   Caractère à envoyer
 */
void uartPutChar( char c ) {
    
    while (!UARTTransmitterIsReady( UART1 ));
    UARTSendDataByte( UART1, c );
    while (!UARTTransmissionHasCompleted( UART1 ));
}

/**
 * @fn      void uartPutString( char* s )
 * @brief   Envoi d'un string par l'UART suivi d'un retour à la ligne
 * @param   s   Chaîne de caractères à envoyer
 */
void uartPutString( char* s ) {

    int i;

    for (i = 0; s[i] != '\0'; i++)
        uartPutChar(s[i]);

    // Retour à la ligne
    //    uartPutChar('\r');
    //    uartPutChar('\n');
}