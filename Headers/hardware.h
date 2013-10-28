/**
 * @file    hardware.h
 * @brief   Configuration hardware du projet
 * IDE MPLAB X vs Beta 7.02
 * Compilateur XC32 vs 2.0
 * @author  Ixchel Intelligent Systems
 * @version 1.0
 * @date    25/10/13
 */

#ifndef _HARDWARE_
#define	_HARDWARE_

/* MACROS ***************/
#define SYS_FREQ        (80000000L)
#define PB_DIV          2
#define PERIPH_FREQ     (SYS_FREQ/PB_DIV)
#define CHN_SPI             SPI_CHANNEL1


#endif	/* _HARDWARE_ */

