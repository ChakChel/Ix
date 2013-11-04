/**
 * @file    can.c
 * @brief   fonctions associées au CAN
 * IDE MPLAB X vs Beta 7.02
 * Compilateur XC32 vs 2.0
 * @author  Ixchel Intelligent Systems
 * @version 1.0
 * @date    02/11/13
 */

/* INCLUDE FILES ***************/
#include "can.h"

/* FUNCTIONS ***************/

/**
 * @fn      void CAN1Init(void)
 * @brief   This function initializes CAN1 module. It sets up speed, FIFOs, fil-
 *          ters and interrupts. Its ID filter is 0x7FF to receive invite trams.
 */
void CAN1Init(void) {

    // 2 (Channels) * 8 (Messages Buffers) * 16 (bytes/per message buffer) bytes
    BYTE CAN1MessageFifoArea[2 * 8 * 16];

    CAN_BIT_CONFIG canBitConfig;

    // Step 1: Switch the CAN module ON and switch it to Configuration mode.
    // Wait till the switch is complete
    CANEnableModule(CAN1, TRUE);
    CANSetOperatingMode(CAN1, CAN_CONFIGURATION);

    while (CANGetOperatingMode(CAN1) != CAN_CONFIGURATION);

    // Step 2: Configure the CAN Module Clock. The CAN_BIT_CONFIG data structure
    // is used for this purpose. The propagation segment, phase segment 1 and
    // phase segment 2 are configured to have 3TQ. The CANSetSpeed function sets
    // the baud.
    canBitConfig.phaseSeg2Tq            = CAN_BIT_3TQ;
    canBitConfig.phaseSeg1Tq            = CAN_BIT_3TQ;
    canBitConfig.propagationSegTq       = CAN_BIT_3TQ;
    canBitConfig.phaseSeg2TimeSelect    = TRUE;
    canBitConfig.sample3Time            = TRUE;
    canBitConfig.syncJumpWidth          = CAN_BIT_2TQ;

    CANSetSpeed(CAN1, &canBitConfig, SYS_FREQ, CAN_BUS_SPEED);

    // Step 3: Assign the buffer area to the CAN module.
    CANAssignMemoryBuffer(CAN1, CAN1MessageFifoArea, (2 * 8 * 16));

    // Step 4: Configure channel 0 for TX and size of 8 message buffers with RTR
    // enabled and low medium priority. Configure channel 1 for RX and size of
    // 8 message buffers and receive the full message.
    CANConfigureChannelForTx(CAN1, CAN_CHANNEL0, 8, CAN_TX_RTR_ENABLED, CAN_LOW_MEDIUM_PRIORITY);
    CANConfigureChannelForRx(CAN1, CAN_CHANNEL1, 8, CAN_RX_FULL_RECEIVE);

    // Step 5: Configure filters and mask. Configure filter 0 to accept SID
    // messages with ID 0x7FF. Configure filter mask 0 to compare all the ID
    // bits and to filter by the ID type specified in the filter configuration.
    // Messages accepted by filter 0 should be stored in channel 1.

    CANConfigureFilter(CAN1, CAN_FILTER0, 0x000, CAN_SID);	// 0x7FF, CAN_SID);
    CANConfigureFilterMask(CAN1, CAN_FILTER_MASK0, 0x7FF, CAN_SID, CAN_FILTER_MASK_IDE_TYPE);
    CANLinkFilterToChannel(CAN1, CAN_FILTER0, CAN_FILTER_MASK0, CAN_CHANNEL1);
    CANEnableFilter(CAN1, CAN_FILTER0, TRUE);
	while (CANIsFilterDisabled(CAN1, CAN_FILTER0) == FALSE);

    // Step 6: Enable interrupt and events. Enable the receive channel not empty
    // event (channel event) and the receive channel event (module event). The
    // interrrupt peripheral library is used to enable the CAN interrupt to the CPU.
    CANEnableChannelEvent(CAN1, CAN_CHANNEL1, CAN_RX_CHANNEL_NOT_EMPTY, TRUE);
    CANEnableModuleEvent(CAN1, CAN_RX_EVENT, TRUE);

    // These functions are from interrupt peripheral library.
    INTSetVectorPriority(INT_CAN_1_VECTOR, INT_PRIORITY_LEVEL_4);
    INTSetVectorSubPriority(INT_CAN_1_VECTOR, INT_SUB_PRIORITY_LEVEL_0);
    INTEnable(INT_CAN1, INT_ENABLED);

    // Step 7: Switch the CAN mode to normal mode.
    CANSetOperatingMode(CAN1, CAN_NORMAL_OPERATION);
    while (CANGetOperatingMode(CAN1) != CAN_NORMAL_OPERATION);
}

/**
 * @fn      void CAN1Reinit(CAN_RX_MSG_SID *msgID)
 * @brief   Reconfiguration CAN1 après avoir reçu un ID, Filter = msgID
 * @param   *msgID
 */
void CAN1Reinit(CAN_RX_MSG_SID *msgID) {
    BYTE CAN1MessageFifoArea[2 * 8 * 16];
    CAN_BIT_CONFIG canBitConfig;

    // Reset of CAN1 channels
    CANResetChannel(CAN1,CAN_CHANNEL0);
    while(CANIsChannelReset(CAN1,CAN_CHANNEL0) != TRUE);
    CANResetChannel(CAN1,CAN_CHANNEL1);
    while(CANIsChannelReset(CAN1,CAN_CHANNEL1) != TRUE);

    // Step 1: Switch the CAN module ON and switch it to Configuration mode.
    // Wait till the switch is complete.
    CANEnableModule(CAN1, TRUE);

    CANSetOperatingMode(CAN1, CAN_CONFIGURATION);
    while (CANGetOperatingMode(CAN1) != CAN_CONFIGURATION);

    // Step 2: Configure the CAN Module Clock. The CAN_BIT_CONFIG data structure
    // is used for this purpose. The propagation segment, phase segment 1 and
    // phase segment 2 are configured to have 3TQ. The CANSetSpeed function sets
    // the baud.
    canBitConfig.phaseSeg2Tq            = CAN_BIT_3TQ;
    canBitConfig.phaseSeg1Tq            = CAN_BIT_3TQ;
    canBitConfig.propagationSegTq       = CAN_BIT_3TQ;
    canBitConfig.phaseSeg2TimeSelect    = TRUE;
    canBitConfig.sample3Time            = TRUE;
    canBitConfig.syncJumpWidth          = CAN_BIT_2TQ;

    CANSetSpeed(CAN1, &canBitConfig, SYS_FREQ , CAN_BUS_SPEED);

    // Step 3: Assign the buffer area to the CAN module.
    CANAssignMemoryBuffer(CAN1, CAN1MessageFifoArea, (2 * 8 * 16));

    // Step 4: Configure channel 0 for TX and size of 8 message buffers with RTR
    // enabled and low medium priority. Configure channel 1 for RX and size of
    // 8 message buffers and receive the full message.
    CANConfigureChannelForTx(CAN1, CAN_CHANNEL0, 8, CAN_TX_RTR_ENABLED, CAN_LOW_MEDIUM_PRIORITY);
    CANConfigureChannelForRx(CAN1, CAN_CHANNEL1, 8, CAN_RX_FULL_RECEIVE);
    CANConfigureChannelForRx(CAN1, CAN_CHANNEL2, 8, CAN_RX_FULL_RECEIVE);

    // Step 5: Configure filters and mask. Configure filter 0 to accept SID
    // messages with ID msgID->SID. Configure filter mask 0 to compare all the ID
    // bits and to filter by the ID type specified in the filter configuration.
    // Messages accepted by filter 0 should be stored in channel 1.
    CANConfigureFilter      (CAN1, CAN_FILTER0, 0x000, CAN_SID);//msgID->SID, CAN_SID);
    CANConfigureFilterMask  (CAN1, CAN_FILTER_MASK1, 0x7FF, CAN_SID, CAN_FILTER_MASK_IDE_TYPE);
    CANLinkFilterToChannel  (CAN1, CAN_FILTER0, CAN_FILTER_MASK1, CAN_CHANNEL1);
    CANEnableFilter         (CAN1, CAN_FILTER0, TRUE);
    while(CANIsFilterDisabled(CAN1, CAN_FILTER0) == FALSE);

    // Step 6: Enable interrupt and events. Enable the receive channel not empty
    // event (channel event) and the receive channel event (module event). The
    // interrrupt peripheral library is used to enable the CAN interrupt to the CPU.
    CANEnableChannelEvent(CAN1, CAN_CHANNEL1, CAN_RX_CHANNEL_NOT_EMPTY, TRUE);
    CANEnableModuleEvent(CAN1, CAN_RX_EVENT, TRUE);

    // Set interrupt
    INTSetVectorPriority(INT_CAN_1_VECTOR, INT_PRIORITY_LEVEL_4);
    INTSetVectorSubPriority(INT_CAN_1_VECTOR, INT_SUB_PRIORITY_LEVEL_0);
    INTEnable(INT_CAN1, INT_ENABLED);

    // Step 7: Switch the CAN mode to normal mode.
    CANSetOperatingMode(CAN1, CAN_NORMAL_OPERATION);
    while (CANGetOperatingMode(CAN1) != CAN_NORMAL_OPERATION);
}

/**
 * @fn      void CAN1RxMsgProcess(BYTE *dataReceive,CAN_RX_MSG_SID *msgID,BOOL
 *          flagSend, BOOL *flagAck)
 * @brief   Receive a tram and save data in datareceive.
 *          This function will check if a CAN message is available in CAN1 chan1
 * @param   *dataReceive
 * @param   *msgID
 * @param   flagSend
 * @param   flagAck
 */
void CAN1RxMsgProcess(BYTE *dataReceive, CAN_RX_MSG_SID *msgID, BOOL *flagSend, BOOL *flagAck) {

    CANRxMessageBuffer * message;

    if (isCAN1MsgReceived == FALSE) {
        // CAN1 did not receive any message so exit the function. Note that the
        // isCAN1MsgReceived flag is updated by the CAN1 ISR.
        return;
    }

    // Message was received. Reset message received flag to catch the next
    // message and read the message. Note that you could also check the
    // CANGetRxMessage function return value for null to check if a message has
    // been received.
    isCAN1MsgReceived = FALSE;

    message = (CANRxMessageBuffer *) CANGetRxMessage(CAN1, CAN_CHANNEL1);


    // Save data in dataReceive
    int Indice = 0;
    for (Indice = 0; Indice < 8; Indice++) {
        dataReceive[Indice] = message->data[Indice];
    }

    *msgID = message->msgSID;

    // Check byte RTR to know the type of frame.
    if (message->msgEID.RTR == 1) {
        // If it is a data frame.
        *flagSend = TRUE;
    }
    if (message->msgEID.RTR == 0) {
        // If it is a remote frame.
        *flagAck = TRUE;
    }

    // Call the CANUpdateChannel() function to let CAN 1 module know that the
    // message processing is done. Enable the receive channale not empty event
    // so that the CAN module generates an interrupt when the event occurs the
    // next time.
    CANUpdateChannel(CAN1, CAN_CHANNEL1);
    CANEnableChannelEvent(CAN1, CAN_CHANNEL1, CAN_RX_CHANNEL_NOT_EMPTY, TRUE);
}

/**
 * @fn      void CAN1RxMsgProcess(BYTE *dataReceive,CAN_RX_MSG_SID *msgID)
 * @brief   Receive a tram and save data in datareceive.
 * @param   *dataReceive
 * @param   *msgID
 */
void CAN1RxMsgProcess2(BYTE *dataReceive, CAN_RX_MSG_SID *msgID) {

    CANRxMessageBuffer * message;

    if (isCAN1MsgReceived == FALSE) {
        // CAN1 did not receive any message so exit the function. Note that the
        // isCAN1MsgReceived flag is updated by the CAN1 ISR.
        return;
    }

    // Message was received. Reset message received flag to catch the next
    // message and read the message. Note that you could also check the
    // CANGetRxMessage function return value for null to check if a message has
    // been received.
    isCAN1MsgReceived = FALSE;

    message = (CANRxMessageBuffer *) CANGetRxMessage(CAN1, CAN_CHANNEL1);


    // Check byte 0 of the data payload.
    int Indice = 0;
    for (Indice = 0; Indice < 8; Indice++) {
        dataReceive[Indice] = message->data[Indice];
    }
    *msgID = message->msgSID;

    // Call the CANUpdateChannel() function to let CAN 1 module know that the
    // message processing is done. Enable the receive channale not empty event
    // so that the CAN module generates an interrupt when the event occurs the
    // next time.
    CANUpdateChannel(CAN1, CAN_CHANNEL1);
    CANEnableChannelEvent(CAN1, CAN_CHANNEL1, CAN_RX_CHANNEL_NOT_EMPTY, TRUE);
}

/**
 * @fn      void CAN1TxSendLEDMsg(BYTE dataReceive[8],CAN_RX_MSG_SID *msgID)
 * @brief   Envoie un message place en argument avec l'ID place en argument.
 * @param   dataReceive[8]
 * @param   *msgID
 */
void CAN1TxSendLEDMsg(BYTE dataReceive[8], CAN_RX_MSG_SID *msgID) {

    // This function will send a message AAAAAAAA to CAN2 with SID 000.
    CANTxMessageBuffer * message;

    // Get a pointer to the next buffer in the channel check if the returned
    // value is null.
    message = CANGetTxMessageBuffer(CAN1, CAN_CHANNEL0);

    if (message != NULL) {
        // Form a Standard ID CAN message.
        // Start by clearing the buffer.
        // Send message to CAN2.
        // IDE = 0 means Standard ID message.
        // Send data.

        message->messageWord[0] = 0;
        message->messageWord[1] = 0;
        message->messageWord[2] = 0;
        message->messageWord[3] = 0;

        message->msgSID.SID 	= 0x000;//msgID->SID;
        message->msgEID.IDE 	= 0;
        message->msgEID.DLC 	= 8;

        message->data[1]    	= 'A';
        message->data[2]    	= 'A';
        message->data[3]    	= 'A';
        message->data[4]    	= 'A';
        message->data[5]    	= 'A';
        message->data[6]    	= 'A';
        message->data[7]    	= 'A';
        message->data[8]    	= 'A';

        // This function lets the CAN module know that the message processing is
        // done and message is ready to be processed.
        CANUpdateChannel(CAN1, CAN_CHANNEL0);

        // Direct the CAN module to flush the TX channel. This will send any
        // pending message in the TX channel.
        CANFlushTxChannel(CAN1, CAN_CHANNEL0);
    }
}

/**
 * @fn      void CAN1TxACK(BYTE dataReceive[8],CAN_RX_MSG_SID *msgID)
 * @brief   Envoie un message d'acquittement.
 *              Num  :  ID module qu'il vient de recevoir par trame d'invite
 *              Requ :  dominant
 *              Data :  aucune
 * @param   dataReceive[8]
 * @param   *msgID
 */
void CAN1TxACK(BYTE dataReceive[8], CAN_RX_MSG_SID *msgID) {

    CANTxMessageBuffer * message;

    // Get a pointer to the next buffer in the channel check if the returned
    // value is null.
    message = CANGetTxMessageBuffer(CAN1, CAN_CHANNEL0);

    if (message != NULL) {
        // Form a Standard ID CAN message.
        // Start by clearing the buffer.
        // Send message to CAN2.
        // IDE = 0 means Standard ID message.
        // Send one byte of data.
        message->messageWord[0] = 0;
        message->messageWord[1] = 0;
        message->messageWord[2] = 0;
        message->messageWord[3] = 0;

        message->msgSID.SID 	= msgID->SID;
        message->msgEID.IDE 	= 0;
        message->msgEID.RTR 	= 0; //dominant
        message->msgEID.DLC 	= 8;

        message->data[0]    	= 0b00000000;
        message->data[1]    	= 0b00000000;
        message->data[2]    	= 0b00000000;
        message->data[3]    	= 0b00000000;
        message->data[4]    	= 0b00000000;
        message->data[5]    	= 0b00000000;
        message->data[6]    	= 0b00000000;
        message->data[7]    	= 0b00000000;

        // This function lets the CAN module know that the message processing is
        // done and message is ready to be processed.
        CANUpdateChannel(CAN1, CAN_CHANNEL0);

        // Direct the CAN module to flush the TX channel. This will send any
        // pending message in the TX channel.
        CANFlushTxChannel(CAN1, CAN_CHANNEL0);
    }
}

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
void CAN1TxRequest(BYTE dataTransmit[8], CAN_RX_MSG_SID *msgID) {

    CANTxMessageBuffer * message;

    // Get a pointer to the next buffer in the channel check if the returned
    // value is null.
    message = CANGetTxMessageBuffer(CAN1, CAN_CHANNEL0);

    if (message != NULL) {
        // Form a Standard ID CAN message.
        // Start by clearing the buffer.
        // Send message to CAN2.
        // IDE = 0 means Standard ID message.
        // Send  data.

        message->messageWord[0] = 0;
        message->messageWord[1] = 0;
        message->messageWord[2] = 0;
        message->messageWord[3] = 0;

        message->msgSID.SID 	= msgID->SID;
        message->msgEID.IDE 	= 0;
        message->msgEID.RTR 	= 1;//recessif
        message->msgEID.DLC 	= 8;

        message->data[0]    	= dataTransmit[0]; // Consigne Vo*
        message->data[1]    	= dataTransmit[1]; // Sortie Vo
        message->data[2]    	= dataTransmit[2]; // Vi
        message->data[3]    	= dataTransmit[3]; // Vil

        // This function lets the CAN module know that the message processing is
        // done and message is ready to be processed.
        CANUpdateChannel(CAN1, CAN_CHANNEL0);

        // Direct the CAN module to flush the TX channel. This will send any
        // pending message in the TX channel.
        CANFlushTxChannel(CAN1, CAN_CHANNEL0);
    }
}

/**
 * @fn      void __attribute__((vector(46), interrupt(ipl4), nomips16))
 *          CAN1InterruptHandler( void )
 * @brief   This is the CAN1 Interrupt Handler.
 *          Note that there are many source events in the CAN1 module for this
 *          interrupt. These events are enabled by the CANEnableModuleEvent()
 *          function. In this example, only the RX_EVENT is enabled
 */
//void __ISR (_CAN_1_VECTOR, ipl4) CAN1Interrupt(void)
void __attribute__((vector(46), interrupt(ipl4), nomips16)) CAN1InterruptHandler(void) {

    // Check if the source of the interrupt is RX_EVENT. This is redundant since
    // only this event is enabled in this example but this shows one scheme for
    // handling events
    if ((CANGetModuleEvent(CAN1) & CAN_RX_EVENT) != 0) {

        // Within this, you can check which channel caused the event by using
        // the CANGetModuleEvent() function which returns a code representing
        // the highest priority pending event.
        if (CANGetPendingEventCode(CAN1) == CAN_CHANNEL1_EVENT) {

            // This means that channel 1 caused the event.
            // The CAN_RX_CHANNEL_NOT_EMPTY event is persistent. You could either
            // read the channel in the ISR to clear the event condition or as done
            // here, disable the event source, and set an application flag to
            // indicate that a message has been received. The event can be
            // enabled by the application when it has processed one message.
            // Note that leaving the event enabled would cause the CPU to keep
            // executing the ISR since the CAN_RX_CHANNEL_NOT_EMPTY event is
            // persistent (unless the not empty condition is cleared.)
            CANEnableChannelEvent(CAN1, CAN_CHANNEL1, CAN_RX_CHANNEL_NOT_EMPTY, FALSE);
            isCAN1MsgReceived = TRUE;
//            xTaskResumeFromISR(xDialogueCANHandle);
        }
    }

    // The CAN1 Interrupt flag is  cleared at the end of the interrupt routine.
    // This is because the event source that could have caused this interrupt to
    // occur (CAN_RX_CHANNEL_NOT_EMPTY) is disabled. Attempting to clear the
    // CAN1 interrupt flag when the the CAN_RX_CHANNEL_NOT_EMPTY interrupt is
    // enabled will not have any effect because the base event is still present.
    INTClearFlag(INT_CAN1);

}