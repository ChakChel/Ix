/**
 * @file    can.h
 * @brief   Header des fonctions associées au CAN
 * IDE MPLAB X vs Beta 7.02
 * Compilateur XC32 vs 2.0
 * @author  Ixchel Intelligent Systems
 * @version 1.0
 * @date    02/11/13
 */

#ifndef _CAN_
#define _CAN_

/* INCLUDES DEPENDENCIES ***************/
#include <GenericTypeDefs.h>
#include <sys/kmem.h>
#include <plib.h>
#include "hardware.h"


/* MACROS ***************/

// Vitesse du bus 250k
#define CAN_BUS_SPEED 250000
// CAN speed select - 0x7 for 500kbps, 0xF for 250Kbps, 0x3 for 1Mbps
#define CAN1_BRPVAL	0x7


/* GLOBAL VARIABLES ***************/
// isCAN1MsgReceived is true if CAN1 channel 1 received a message.
// This flag is updated in the CAN1 ISR.
static volatile BOOL isCAN1MsgReceived = FALSE;


/* FUNCTION PROTOTYPES ***************/

/**
 * @fn      void CAN1Init(void)
 * @brief   This function initializes CAN1 module. It sets up speed, FIFOs, fil-
 *          ters and interrupts. Its ID filter is 0x7FF to receive invite trams.
 */
void CAN1Init(void);

/**
 * @fn      void CAN1Reinit(CAN_RX_MSG_SID *msgID)
 * @brief   This function reinitializes CAN1 module with a new ID.
 *          It sets up speed, FIFOs, filters and interrupts.
 * @param   *msgID
 */
void CAN1Reinit(CAN_RX_MSG_SID *msgID);

/**
 * @fn      void CAN1TxSendLEDMsg(BYTE dataReceive[8],CAN_RX_MSG_SID *msgID)
 * @brief   Envoie un message place en argument avec l'ID place en argument.
 * @param   dataReceive[8]
 * @param   *msgID
 */
void CAN1TxSendLEDMsg(BYTE dataReceive[8],CAN_RX_MSG_SID *msgID);

/**
 * @fn      void CAN1TxACK(BYTE dataReceive[8],CAN_RX_MSG_SID *msgID)
 * @brief   Envoie un message d'acquittement.
 *              Num  :  ID module qu'il vient de recevoir par trame d'invite
 *              Requ :  dominant
 *              Data :  aucune
 * @param   dataReceive[8]
 * @param   *msgID
 */
void CAN1TxACK(BYTE dataReceive[8],CAN_RX_MSG_SID *msgID);

/**
 * @fn      void CAN1TxRequest(BYTE dataReceive[8],CAN_RX_MSG_SID *msgID)
 * @brief   Envoie un message d'acquittement.
 *              Num  :  ID  du module module boost concerné
 *              Requ :  récessif
 *              Data :  1 octet pour la valeur de la consigne, c'est-à-dire Vo*
 *                    + 1 octet pour la valeur réelle de sortie, c?est-à-dire Vo
 *                    + 1 octet pour Vi
 *                    + 1 octet pour Vil
 * @param   dataReceive[8]
 * @param   *msgID
 */
void CAN1TxRequest(BYTE dataReceive[8],CAN_RX_MSG_SID *msgID);

/**
 * @fn      void CAN1RxMsgProcess2(BYTE *dataReceive,CAN_RX_MSG_SID *msgID)
 * @brief   Receive a tram and save data in datareceive.
 * @param   *dataReceive
 * @param   *msgID
 */
void CAN1RxMsgProcess2(BYTE *dataReceive,CAN_RX_MSG_SID *msgID);

/**
 * @fn      void CAN1RxMsgProcess(BYTE *dataReceive,CAN_RX_MSG_SID *msgID,BOOL 
 *          flagSend, BOOL *flagAck)
 * @brief   Receive a tram and save data in datareceive.
 * @param   *dataReceive
 * @param   *msgID
 * @param   flagSend
 * @param   flagAck
 */
void CAN1RxMsgProcess(BYTE *dataReceive,CAN_RX_MSG_SID *msgID,BOOL *flagSend, BOOL *flagAck);


#endif  // _CAN_