#
# Generated Makefile - do not edit!
#
# Edit the Makefile in the project folder instead (../Makefile). Each target
# has a -pre and a -post target defined where you can add customized code.
#
# This makefile implements configuration specific macros and targets.


# Include project Makefile
ifeq "${IGNORE_LOCAL}" "TRUE"
# do not include local makefile. User is passing all local related variables already
else
include Makefile
# Include makefile containing local settings
ifeq "$(wildcard nbproject/Makefile-local-default.mk)" "nbproject/Makefile-local-default.mk"
include nbproject/Makefile-local-default.mk
endif
endif

# Environment
MKDIR=gnumkdir -p
RM=rm -f 
MV=mv 
CP=cp 

# Macros
CND_CONF=default
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
IMAGE_TYPE=debug
OUTPUT_SUFFIX=elf
DEBUGGABLE_SUFFIX=elf
FINAL_IMAGE=dist/${CND_CONF}/${IMAGE_TYPE}/intFreeRTOS.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}
else
IMAGE_TYPE=production
OUTPUT_SUFFIX=hex
DEBUGGABLE_SUFFIX=elf
FINAL_IMAGE=dist/${CND_CONF}/${IMAGE_TYPE}/intFreeRTOS.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}
endif

# Object Directory
OBJECTDIR=build/${CND_CONF}/${IMAGE_TYPE}

# Distribution Directory
DISTDIR=dist/${CND_CONF}/${IMAGE_TYPE}

# Object Files Quoted if spaced
OBJECTFILES_QUOTED_IF_SPACED=${OBJECTDIR}/_ext/971107649/port.o ${OBJECTDIR}/_ext/971107649/port_asm.o ${OBJECTDIR}/_ext/167578668/heap_1.o ${OBJECTDIR}/_ext/381897321/croutine.o ${OBJECTDIR}/_ext/381897321/list.o ${OBJECTDIR}/_ext/381897321/queue.o ${OBJECTDIR}/_ext/381897321/tasks.o ${OBJECTDIR}/_ext/381897321/timers.o ${OBJECTDIR}/Peripheriques/gpio.o ${OBJECTDIR}/Peripheriques/pwm.o ${OBJECTDIR}/Peripheriques/spi.o ${OBJECTDIR}/Peripheriques/timer.o ${OBJECTDIR}/Peripheriques/uart.o ${OBJECTDIR}/ft.o ${OBJECTDIR}/Peripheriques/can.o ${OBJECTDIR}/main.o
POSSIBLE_DEPFILES=${OBJECTDIR}/_ext/971107649/port.o.d ${OBJECTDIR}/_ext/971107649/port_asm.o.d ${OBJECTDIR}/_ext/167578668/heap_1.o.d ${OBJECTDIR}/_ext/381897321/croutine.o.d ${OBJECTDIR}/_ext/381897321/list.o.d ${OBJECTDIR}/_ext/381897321/queue.o.d ${OBJECTDIR}/_ext/381897321/tasks.o.d ${OBJECTDIR}/_ext/381897321/timers.o.d ${OBJECTDIR}/Peripheriques/gpio.o.d ${OBJECTDIR}/Peripheriques/pwm.o.d ${OBJECTDIR}/Peripheriques/spi.o.d ${OBJECTDIR}/Peripheriques/timer.o.d ${OBJECTDIR}/Peripheriques/uart.o.d ${OBJECTDIR}/ft.o.d ${OBJECTDIR}/Peripheriques/can.o.d ${OBJECTDIR}/main.o.d

# Object Files
OBJECTFILES=${OBJECTDIR}/_ext/971107649/port.o ${OBJECTDIR}/_ext/971107649/port_asm.o ${OBJECTDIR}/_ext/167578668/heap_1.o ${OBJECTDIR}/_ext/381897321/croutine.o ${OBJECTDIR}/_ext/381897321/list.o ${OBJECTDIR}/_ext/381897321/queue.o ${OBJECTDIR}/_ext/381897321/tasks.o ${OBJECTDIR}/_ext/381897321/timers.o ${OBJECTDIR}/Peripheriques/gpio.o ${OBJECTDIR}/Peripheriques/pwm.o ${OBJECTDIR}/Peripheriques/spi.o ${OBJECTDIR}/Peripheriques/timer.o ${OBJECTDIR}/Peripheriques/uart.o ${OBJECTDIR}/ft.o ${OBJECTDIR}/Peripheriques/can.o ${OBJECTDIR}/main.o


CFLAGS=
ASFLAGS=
LDLIBSOPTIONS=

############# Tool locations ##########################################
# If you copy a project from one host to another, the path where the  #
# compiler is installed may be different.                             #
# If you open this project with MPLAB X in the new host, this         #
# makefile will be regenerated and the paths will be corrected.       #
#######################################################################
# fixDeps replaces a bunch of sed/cat/printf statements that slow down the build
FIXDEPS=fixDeps

.build-conf:  ${BUILD_SUBPROJECTS}
	${MAKE} ${MAKE_OPTIONS} -f nbproject/Makefile-default.mk dist/${CND_CONF}/${IMAGE_TYPE}/intFreeRTOS.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}

MP_PROCESSOR_OPTION=32MX795F512L
MP_LINKER_FILE_OPTION=
# ------------------------------------------------------------------------------------
# Rules for buildStep: assemble
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
else
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: assembleWithPreprocess
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
${OBJECTDIR}/_ext/971107649/port_asm.o: ../FreeRTOS/Source/portable/MPLAB/PIC32MX/port_asm.S  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/971107649 
	@${RM} ${OBJECTDIR}/_ext/971107649/port_asm.o.d 
	@${RM} ${OBJECTDIR}/_ext/971107649/port_asm.o.ok ${OBJECTDIR}/_ext/971107649/port_asm.o.err 
	@${FIXDEPS} "${OBJECTDIR}/_ext/971107649/port_asm.o.d" "${OBJECTDIR}/_ext/971107649/port_asm.o.asm.d" -t $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC} $(MP_EXTRA_AS_PRE)  -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1 -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"C:/intFreeRTOS.X" -I"C:/Projet/FreeRTOS/Source/include" -I"C:/Projet/FreeRTOS/Source/portable/MPLAB/PIC32MX" -I"." -I".." -MMD -MF "${OBJECTDIR}/_ext/971107649/port_asm.o.d"  -o ${OBJECTDIR}/_ext/971107649/port_asm.o ../FreeRTOS/Source/portable/MPLAB/PIC32MX/port_asm.S  -Wa,--defsym=__MPLAB_BUILD=1$(MP_EXTRA_AS_POST),-MD="${OBJECTDIR}/_ext/971107649/port_asm.o.asm.d",--defsym=__ICD2RAM=1,--defsym=__MPLAB_DEBUG=1,--gdwarf-2,--defsym=__DEBUG=1,--defsym=__MPLAB_DEBUGGER_ICD3=1,-I"C:/Projet/FreeRTOS/Source/portable/MPLAB/PIC32MX"
	
else
${OBJECTDIR}/_ext/971107649/port_asm.o: ../FreeRTOS/Source/portable/MPLAB/PIC32MX/port_asm.S  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/971107649 
	@${RM} ${OBJECTDIR}/_ext/971107649/port_asm.o.d 
	@${RM} ${OBJECTDIR}/_ext/971107649/port_asm.o.ok ${OBJECTDIR}/_ext/971107649/port_asm.o.err 
	@${FIXDEPS} "${OBJECTDIR}/_ext/971107649/port_asm.o.d" "${OBJECTDIR}/_ext/971107649/port_asm.o.asm.d" -t $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC} $(MP_EXTRA_AS_PRE)  -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"C:/intFreeRTOS.X" -I"C:/Projet/FreeRTOS/Source/include" -I"C:/Projet/FreeRTOS/Source/portable/MPLAB/PIC32MX" -I"." -I".." -MMD -MF "${OBJECTDIR}/_ext/971107649/port_asm.o.d"  -o ${OBJECTDIR}/_ext/971107649/port_asm.o ../FreeRTOS/Source/portable/MPLAB/PIC32MX/port_asm.S  -Wa,--defsym=__MPLAB_BUILD=1$(MP_EXTRA_AS_POST),-MD="${OBJECTDIR}/_ext/971107649/port_asm.o.asm.d",--gdwarf-2,-I"C:/Projet/FreeRTOS/Source/portable/MPLAB/PIC32MX"
	
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: compile
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
${OBJECTDIR}/_ext/971107649/port.o: ../FreeRTOS/Source/portable/MPLAB/PIC32MX/port.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/971107649 
	@${RM} ${OBJECTDIR}/_ext/971107649/port.o.d 
	@${FIXDEPS} "${OBJECTDIR}/_ext/971107649/port.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1 -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"C:/Projet/FreeRTOS/Source/include" -I"C:/Projet/FreeRTOS/Source/portable/MPLAB/PIC32MX" -I"." -I"C:/intFreeRTOS.X" -I"C:/intFreeRTOS.X/Systeme" -I"C:/Projet/intFreeRTOS.X/Peripheriques" -I"." -I".." -MMD -MF "${OBJECTDIR}/_ext/971107649/port.o.d" -o ${OBJECTDIR}/_ext/971107649/port.o ../FreeRTOS/Source/portable/MPLAB/PIC32MX/port.c   
	
${OBJECTDIR}/_ext/167578668/heap_1.o: ../FreeRTOS/Source/portable/MemMang/heap_1.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/167578668 
	@${RM} ${OBJECTDIR}/_ext/167578668/heap_1.o.d 
	@${FIXDEPS} "${OBJECTDIR}/_ext/167578668/heap_1.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1 -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"C:/Projet/FreeRTOS/Source/include" -I"C:/Projet/FreeRTOS/Source/portable/MPLAB/PIC32MX" -I"." -I"C:/intFreeRTOS.X" -I"C:/intFreeRTOS.X/Systeme" -I"C:/Projet/intFreeRTOS.X/Peripheriques" -I"." -I".." -MMD -MF "${OBJECTDIR}/_ext/167578668/heap_1.o.d" -o ${OBJECTDIR}/_ext/167578668/heap_1.o ../FreeRTOS/Source/portable/MemMang/heap_1.c   
	
${OBJECTDIR}/_ext/381897321/croutine.o: ../FreeRTOS/Source/croutine.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/381897321 
	@${RM} ${OBJECTDIR}/_ext/381897321/croutine.o.d 
	@${FIXDEPS} "${OBJECTDIR}/_ext/381897321/croutine.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1 -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"C:/Projet/FreeRTOS/Source/include" -I"C:/Projet/FreeRTOS/Source/portable/MPLAB/PIC32MX" -I"." -I"C:/intFreeRTOS.X" -I"C:/intFreeRTOS.X/Systeme" -I"C:/Projet/intFreeRTOS.X/Peripheriques" -I"." -I".." -MMD -MF "${OBJECTDIR}/_ext/381897321/croutine.o.d" -o ${OBJECTDIR}/_ext/381897321/croutine.o ../FreeRTOS/Source/croutine.c   
	
${OBJECTDIR}/_ext/381897321/list.o: ../FreeRTOS/Source/list.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/381897321 
	@${RM} ${OBJECTDIR}/_ext/381897321/list.o.d 
	@${FIXDEPS} "${OBJECTDIR}/_ext/381897321/list.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1 -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"C:/Projet/FreeRTOS/Source/include" -I"C:/Projet/FreeRTOS/Source/portable/MPLAB/PIC32MX" -I"." -I"C:/intFreeRTOS.X" -I"C:/intFreeRTOS.X/Systeme" -I"C:/Projet/intFreeRTOS.X/Peripheriques" -I"." -I".." -MMD -MF "${OBJECTDIR}/_ext/381897321/list.o.d" -o ${OBJECTDIR}/_ext/381897321/list.o ../FreeRTOS/Source/list.c   
	
${OBJECTDIR}/_ext/381897321/queue.o: ../FreeRTOS/Source/queue.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/381897321 
	@${RM} ${OBJECTDIR}/_ext/381897321/queue.o.d 
	@${FIXDEPS} "${OBJECTDIR}/_ext/381897321/queue.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1 -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"C:/Projet/FreeRTOS/Source/include" -I"C:/Projet/FreeRTOS/Source/portable/MPLAB/PIC32MX" -I"." -I"C:/intFreeRTOS.X" -I"C:/intFreeRTOS.X/Systeme" -I"C:/Projet/intFreeRTOS.X/Peripheriques" -I"." -I".." -MMD -MF "${OBJECTDIR}/_ext/381897321/queue.o.d" -o ${OBJECTDIR}/_ext/381897321/queue.o ../FreeRTOS/Source/queue.c   
	
${OBJECTDIR}/_ext/381897321/tasks.o: ../FreeRTOS/Source/tasks.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/381897321 
	@${RM} ${OBJECTDIR}/_ext/381897321/tasks.o.d 
	@${FIXDEPS} "${OBJECTDIR}/_ext/381897321/tasks.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1 -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"C:/Projet/FreeRTOS/Source/include" -I"C:/Projet/FreeRTOS/Source/portable/MPLAB/PIC32MX" -I"." -I"C:/intFreeRTOS.X" -I"C:/intFreeRTOS.X/Systeme" -I"C:/Projet/intFreeRTOS.X/Peripheriques" -I"." -I".." -MMD -MF "${OBJECTDIR}/_ext/381897321/tasks.o.d" -o ${OBJECTDIR}/_ext/381897321/tasks.o ../FreeRTOS/Source/tasks.c   
	
${OBJECTDIR}/_ext/381897321/timers.o: ../FreeRTOS/Source/timers.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/381897321 
	@${RM} ${OBJECTDIR}/_ext/381897321/timers.o.d 
	@${FIXDEPS} "${OBJECTDIR}/_ext/381897321/timers.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1 -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"C:/Projet/FreeRTOS/Source/include" -I"C:/Projet/FreeRTOS/Source/portable/MPLAB/PIC32MX" -I"." -I"C:/intFreeRTOS.X" -I"C:/intFreeRTOS.X/Systeme" -I"C:/Projet/intFreeRTOS.X/Peripheriques" -I"." -I".." -MMD -MF "${OBJECTDIR}/_ext/381897321/timers.o.d" -o ${OBJECTDIR}/_ext/381897321/timers.o ../FreeRTOS/Source/timers.c   
	
${OBJECTDIR}/Peripheriques/gpio.o: Peripheriques/gpio.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/Peripheriques 
	@${RM} ${OBJECTDIR}/Peripheriques/gpio.o.d 
	@${FIXDEPS} "${OBJECTDIR}/Peripheriques/gpio.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1 -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"C:/Projet/FreeRTOS/Source/include" -I"C:/Projet/FreeRTOS/Source/portable/MPLAB/PIC32MX" -I"." -I"C:/intFreeRTOS.X" -I"C:/intFreeRTOS.X/Systeme" -I"C:/Projet/intFreeRTOS.X/Peripheriques" -I"." -I".." -MMD -MF "${OBJECTDIR}/Peripheriques/gpio.o.d" -o ${OBJECTDIR}/Peripheriques/gpio.o Peripheriques/gpio.c   
	
${OBJECTDIR}/Peripheriques/pwm.o: Peripheriques/pwm.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/Peripheriques 
	@${RM} ${OBJECTDIR}/Peripheriques/pwm.o.d 
	@${FIXDEPS} "${OBJECTDIR}/Peripheriques/pwm.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1 -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"C:/Projet/FreeRTOS/Source/include" -I"C:/Projet/FreeRTOS/Source/portable/MPLAB/PIC32MX" -I"." -I"C:/intFreeRTOS.X" -I"C:/intFreeRTOS.X/Systeme" -I"C:/Projet/intFreeRTOS.X/Peripheriques" -I"." -I".." -MMD -MF "${OBJECTDIR}/Peripheriques/pwm.o.d" -o ${OBJECTDIR}/Peripheriques/pwm.o Peripheriques/pwm.c   
	
${OBJECTDIR}/Peripheriques/spi.o: Peripheriques/spi.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/Peripheriques 
	@${RM} ${OBJECTDIR}/Peripheriques/spi.o.d 
	@${FIXDEPS} "${OBJECTDIR}/Peripheriques/spi.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1 -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"C:/Projet/FreeRTOS/Source/include" -I"C:/Projet/FreeRTOS/Source/portable/MPLAB/PIC32MX" -I"." -I"C:/intFreeRTOS.X" -I"C:/intFreeRTOS.X/Systeme" -I"C:/Projet/intFreeRTOS.X/Peripheriques" -I"." -I".." -MMD -MF "${OBJECTDIR}/Peripheriques/spi.o.d" -o ${OBJECTDIR}/Peripheriques/spi.o Peripheriques/spi.c   
	
${OBJECTDIR}/Peripheriques/timer.o: Peripheriques/timer.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/Peripheriques 
	@${RM} ${OBJECTDIR}/Peripheriques/timer.o.d 
	@${FIXDEPS} "${OBJECTDIR}/Peripheriques/timer.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1 -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"C:/Projet/FreeRTOS/Source/include" -I"C:/Projet/FreeRTOS/Source/portable/MPLAB/PIC32MX" -I"." -I"C:/intFreeRTOS.X" -I"C:/intFreeRTOS.X/Systeme" -I"C:/Projet/intFreeRTOS.X/Peripheriques" -I"." -I".." -MMD -MF "${OBJECTDIR}/Peripheriques/timer.o.d" -o ${OBJECTDIR}/Peripheriques/timer.o Peripheriques/timer.c   
	
${OBJECTDIR}/Peripheriques/uart.o: Peripheriques/uart.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/Peripheriques 
	@${RM} ${OBJECTDIR}/Peripheriques/uart.o.d 
	@${FIXDEPS} "${OBJECTDIR}/Peripheriques/uart.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1 -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"C:/Projet/FreeRTOS/Source/include" -I"C:/Projet/FreeRTOS/Source/portable/MPLAB/PIC32MX" -I"." -I"C:/intFreeRTOS.X" -I"C:/intFreeRTOS.X/Systeme" -I"C:/Projet/intFreeRTOS.X/Peripheriques" -I"." -I".." -MMD -MF "${OBJECTDIR}/Peripheriques/uart.o.d" -o ${OBJECTDIR}/Peripheriques/uart.o Peripheriques/uart.c   
	
${OBJECTDIR}/ft.o: ft.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR} 
	@${RM} ${OBJECTDIR}/ft.o.d 
	@${FIXDEPS} "${OBJECTDIR}/ft.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1 -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"C:/Projet/FreeRTOS/Source/include" -I"C:/Projet/FreeRTOS/Source/portable/MPLAB/PIC32MX" -I"." -I"C:/intFreeRTOS.X" -I"C:/intFreeRTOS.X/Systeme" -I"C:/Projet/intFreeRTOS.X/Peripheriques" -I"." -I".." -MMD -MF "${OBJECTDIR}/ft.o.d" -o ${OBJECTDIR}/ft.o ft.c   
	
${OBJECTDIR}/Peripheriques/can.o: Peripheriques/can.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/Peripheriques 
	@${RM} ${OBJECTDIR}/Peripheriques/can.o.d 
	@${FIXDEPS} "${OBJECTDIR}/Peripheriques/can.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1 -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"C:/Projet/FreeRTOS/Source/include" -I"C:/Projet/FreeRTOS/Source/portable/MPLAB/PIC32MX" -I"." -I"C:/intFreeRTOS.X" -I"C:/intFreeRTOS.X/Systeme" -I"C:/Projet/intFreeRTOS.X/Peripheriques" -I"." -I".." -MMD -MF "${OBJECTDIR}/Peripheriques/can.o.d" -o ${OBJECTDIR}/Peripheriques/can.o Peripheriques/can.c   
	
${OBJECTDIR}/main.o: main.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR} 
	@${RM} ${OBJECTDIR}/main.o.d 
	@${FIXDEPS} "${OBJECTDIR}/main.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1 -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"C:/Projet/FreeRTOS/Source/include" -I"C:/Projet/FreeRTOS/Source/portable/MPLAB/PIC32MX" -I"." -I"C:/intFreeRTOS.X" -I"C:/intFreeRTOS.X/Systeme" -I"C:/Projet/intFreeRTOS.X/Peripheriques" -I"." -I".." -MMD -MF "${OBJECTDIR}/main.o.d" -o ${OBJECTDIR}/main.o main.c   
	
else
${OBJECTDIR}/_ext/971107649/port.o: ../FreeRTOS/Source/portable/MPLAB/PIC32MX/port.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/971107649 
	@${RM} ${OBJECTDIR}/_ext/971107649/port.o.d 
	@${FIXDEPS} "${OBJECTDIR}/_ext/971107649/port.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"C:/Projet/FreeRTOS/Source/include" -I"C:/Projet/FreeRTOS/Source/portable/MPLAB/PIC32MX" -I"." -I"C:/intFreeRTOS.X" -I"C:/intFreeRTOS.X/Systeme" -I"C:/Projet/intFreeRTOS.X/Peripheriques" -I"." -I".." -MMD -MF "${OBJECTDIR}/_ext/971107649/port.o.d" -o ${OBJECTDIR}/_ext/971107649/port.o ../FreeRTOS/Source/portable/MPLAB/PIC32MX/port.c   
	
${OBJECTDIR}/_ext/167578668/heap_1.o: ../FreeRTOS/Source/portable/MemMang/heap_1.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/167578668 
	@${RM} ${OBJECTDIR}/_ext/167578668/heap_1.o.d 
	@${FIXDEPS} "${OBJECTDIR}/_ext/167578668/heap_1.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"C:/Projet/FreeRTOS/Source/include" -I"C:/Projet/FreeRTOS/Source/portable/MPLAB/PIC32MX" -I"." -I"C:/intFreeRTOS.X" -I"C:/intFreeRTOS.X/Systeme" -I"C:/Projet/intFreeRTOS.X/Peripheriques" -I"." -I".." -MMD -MF "${OBJECTDIR}/_ext/167578668/heap_1.o.d" -o ${OBJECTDIR}/_ext/167578668/heap_1.o ../FreeRTOS/Source/portable/MemMang/heap_1.c   
	
${OBJECTDIR}/_ext/381897321/croutine.o: ../FreeRTOS/Source/croutine.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/381897321 
	@${RM} ${OBJECTDIR}/_ext/381897321/croutine.o.d 
	@${FIXDEPS} "${OBJECTDIR}/_ext/381897321/croutine.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"C:/Projet/FreeRTOS/Source/include" -I"C:/Projet/FreeRTOS/Source/portable/MPLAB/PIC32MX" -I"." -I"C:/intFreeRTOS.X" -I"C:/intFreeRTOS.X/Systeme" -I"C:/Projet/intFreeRTOS.X/Peripheriques" -I"." -I".." -MMD -MF "${OBJECTDIR}/_ext/381897321/croutine.o.d" -o ${OBJECTDIR}/_ext/381897321/croutine.o ../FreeRTOS/Source/croutine.c   
	
${OBJECTDIR}/_ext/381897321/list.o: ../FreeRTOS/Source/list.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/381897321 
	@${RM} ${OBJECTDIR}/_ext/381897321/list.o.d 
	@${FIXDEPS} "${OBJECTDIR}/_ext/381897321/list.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"C:/Projet/FreeRTOS/Source/include" -I"C:/Projet/FreeRTOS/Source/portable/MPLAB/PIC32MX" -I"." -I"C:/intFreeRTOS.X" -I"C:/intFreeRTOS.X/Systeme" -I"C:/Projet/intFreeRTOS.X/Peripheriques" -I"." -I".." -MMD -MF "${OBJECTDIR}/_ext/381897321/list.o.d" -o ${OBJECTDIR}/_ext/381897321/list.o ../FreeRTOS/Source/list.c   
	
${OBJECTDIR}/_ext/381897321/queue.o: ../FreeRTOS/Source/queue.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/381897321 
	@${RM} ${OBJECTDIR}/_ext/381897321/queue.o.d 
	@${FIXDEPS} "${OBJECTDIR}/_ext/381897321/queue.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"C:/Projet/FreeRTOS/Source/include" -I"C:/Projet/FreeRTOS/Source/portable/MPLAB/PIC32MX" -I"." -I"C:/intFreeRTOS.X" -I"C:/intFreeRTOS.X/Systeme" -I"C:/Projet/intFreeRTOS.X/Peripheriques" -I"." -I".." -MMD -MF "${OBJECTDIR}/_ext/381897321/queue.o.d" -o ${OBJECTDIR}/_ext/381897321/queue.o ../FreeRTOS/Source/queue.c   
	
${OBJECTDIR}/_ext/381897321/tasks.o: ../FreeRTOS/Source/tasks.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/381897321 
	@${RM} ${OBJECTDIR}/_ext/381897321/tasks.o.d 
	@${FIXDEPS} "${OBJECTDIR}/_ext/381897321/tasks.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"C:/Projet/FreeRTOS/Source/include" -I"C:/Projet/FreeRTOS/Source/portable/MPLAB/PIC32MX" -I"." -I"C:/intFreeRTOS.X" -I"C:/intFreeRTOS.X/Systeme" -I"C:/Projet/intFreeRTOS.X/Peripheriques" -I"." -I".." -MMD -MF "${OBJECTDIR}/_ext/381897321/tasks.o.d" -o ${OBJECTDIR}/_ext/381897321/tasks.o ../FreeRTOS/Source/tasks.c   
	
${OBJECTDIR}/_ext/381897321/timers.o: ../FreeRTOS/Source/timers.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/381897321 
	@${RM} ${OBJECTDIR}/_ext/381897321/timers.o.d 
	@${FIXDEPS} "${OBJECTDIR}/_ext/381897321/timers.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"C:/Projet/FreeRTOS/Source/include" -I"C:/Projet/FreeRTOS/Source/portable/MPLAB/PIC32MX" -I"." -I"C:/intFreeRTOS.X" -I"C:/intFreeRTOS.X/Systeme" -I"C:/Projet/intFreeRTOS.X/Peripheriques" -I"." -I".." -MMD -MF "${OBJECTDIR}/_ext/381897321/timers.o.d" -o ${OBJECTDIR}/_ext/381897321/timers.o ../FreeRTOS/Source/timers.c   
	
${OBJECTDIR}/Peripheriques/gpio.o: Peripheriques/gpio.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/Peripheriques 
	@${RM} ${OBJECTDIR}/Peripheriques/gpio.o.d 
	@${FIXDEPS} "${OBJECTDIR}/Peripheriques/gpio.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"C:/Projet/FreeRTOS/Source/include" -I"C:/Projet/FreeRTOS/Source/portable/MPLAB/PIC32MX" -I"." -I"C:/intFreeRTOS.X" -I"C:/intFreeRTOS.X/Systeme" -I"C:/Projet/intFreeRTOS.X/Peripheriques" -I"." -I".." -MMD -MF "${OBJECTDIR}/Peripheriques/gpio.o.d" -o ${OBJECTDIR}/Peripheriques/gpio.o Peripheriques/gpio.c   
	
${OBJECTDIR}/Peripheriques/pwm.o: Peripheriques/pwm.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/Peripheriques 
	@${RM} ${OBJECTDIR}/Peripheriques/pwm.o.d 
	@${FIXDEPS} "${OBJECTDIR}/Peripheriques/pwm.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"C:/Projet/FreeRTOS/Source/include" -I"C:/Projet/FreeRTOS/Source/portable/MPLAB/PIC32MX" -I"." -I"C:/intFreeRTOS.X" -I"C:/intFreeRTOS.X/Systeme" -I"C:/Projet/intFreeRTOS.X/Peripheriques" -I"." -I".." -MMD -MF "${OBJECTDIR}/Peripheriques/pwm.o.d" -o ${OBJECTDIR}/Peripheriques/pwm.o Peripheriques/pwm.c   
	
${OBJECTDIR}/Peripheriques/spi.o: Peripheriques/spi.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/Peripheriques 
	@${RM} ${OBJECTDIR}/Peripheriques/spi.o.d 
	@${FIXDEPS} "${OBJECTDIR}/Peripheriques/spi.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"C:/Projet/FreeRTOS/Source/include" -I"C:/Projet/FreeRTOS/Source/portable/MPLAB/PIC32MX" -I"." -I"C:/intFreeRTOS.X" -I"C:/intFreeRTOS.X/Systeme" -I"C:/Projet/intFreeRTOS.X/Peripheriques" -I"." -I".." -MMD -MF "${OBJECTDIR}/Peripheriques/spi.o.d" -o ${OBJECTDIR}/Peripheriques/spi.o Peripheriques/spi.c   
	
${OBJECTDIR}/Peripheriques/timer.o: Peripheriques/timer.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/Peripheriques 
	@${RM} ${OBJECTDIR}/Peripheriques/timer.o.d 
	@${FIXDEPS} "${OBJECTDIR}/Peripheriques/timer.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"C:/Projet/FreeRTOS/Source/include" -I"C:/Projet/FreeRTOS/Source/portable/MPLAB/PIC32MX" -I"." -I"C:/intFreeRTOS.X" -I"C:/intFreeRTOS.X/Systeme" -I"C:/Projet/intFreeRTOS.X/Peripheriques" -I"." -I".." -MMD -MF "${OBJECTDIR}/Peripheriques/timer.o.d" -o ${OBJECTDIR}/Peripheriques/timer.o Peripheriques/timer.c   
	
${OBJECTDIR}/Peripheriques/uart.o: Peripheriques/uart.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/Peripheriques 
	@${RM} ${OBJECTDIR}/Peripheriques/uart.o.d 
	@${FIXDEPS} "${OBJECTDIR}/Peripheriques/uart.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"C:/Projet/FreeRTOS/Source/include" -I"C:/Projet/FreeRTOS/Source/portable/MPLAB/PIC32MX" -I"." -I"C:/intFreeRTOS.X" -I"C:/intFreeRTOS.X/Systeme" -I"C:/Projet/intFreeRTOS.X/Peripheriques" -I"." -I".." -MMD -MF "${OBJECTDIR}/Peripheriques/uart.o.d" -o ${OBJECTDIR}/Peripheriques/uart.o Peripheriques/uart.c   
	
${OBJECTDIR}/ft.o: ft.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR} 
	@${RM} ${OBJECTDIR}/ft.o.d 
	@${FIXDEPS} "${OBJECTDIR}/ft.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"C:/Projet/FreeRTOS/Source/include" -I"C:/Projet/FreeRTOS/Source/portable/MPLAB/PIC32MX" -I"." -I"C:/intFreeRTOS.X" -I"C:/intFreeRTOS.X/Systeme" -I"C:/Projet/intFreeRTOS.X/Peripheriques" -I"." -I".." -MMD -MF "${OBJECTDIR}/ft.o.d" -o ${OBJECTDIR}/ft.o ft.c   
	
${OBJECTDIR}/Peripheriques/can.o: Peripheriques/can.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/Peripheriques 
	@${RM} ${OBJECTDIR}/Peripheriques/can.o.d 
	@${FIXDEPS} "${OBJECTDIR}/Peripheriques/can.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"C:/Projet/FreeRTOS/Source/include" -I"C:/Projet/FreeRTOS/Source/portable/MPLAB/PIC32MX" -I"." -I"C:/intFreeRTOS.X" -I"C:/intFreeRTOS.X/Systeme" -I"C:/Projet/intFreeRTOS.X/Peripheriques" -I"." -I".." -MMD -MF "${OBJECTDIR}/Peripheriques/can.o.d" -o ${OBJECTDIR}/Peripheriques/can.o Peripheriques/can.c   
	
${OBJECTDIR}/main.o: main.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR} 
	@${RM} ${OBJECTDIR}/main.o.d 
	@${FIXDEPS} "${OBJECTDIR}/main.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"C:/Projet/FreeRTOS/Source/include" -I"C:/Projet/FreeRTOS/Source/portable/MPLAB/PIC32MX" -I"." -I"C:/intFreeRTOS.X" -I"C:/intFreeRTOS.X/Systeme" -I"C:/Projet/intFreeRTOS.X/Peripheriques" -I"." -I".." -MMD -MF "${OBJECTDIR}/main.o.d" -o ${OBJECTDIR}/main.o main.c   
	
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: compileCPP
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
else
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: link
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
dist/${CND_CONF}/${IMAGE_TYPE}/intFreeRTOS.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}: ${OBJECTFILES}  nbproject/Makefile-${CND_CONF}.mk    
	@${MKDIR} dist/${CND_CONF}/${IMAGE_TYPE} 
	${MP_CC} $(MP_EXTRA_LD_PRE)  -mdebugger -D__MPLAB_DEBUGGER_ICD3=1 -mprocessor=$(MP_PROCESSOR_OPTION)  -o dist/${CND_CONF}/${IMAGE_TYPE}/intFreeRTOS.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX} ${OBJECTFILES_QUOTED_IF_SPACED}          -Wl,--defsym=__MPLAB_BUILD=1$(MP_EXTRA_LD_POST)$(MP_LINKER_FILE_OPTION),--defsym=__ICD2RAM=1,--defsym=__MPLAB_DEBUG=1,--defsym=__DEBUG=1,--defsym=__MPLAB_DEBUGGER_ICD3=1,-Map="${DISTDIR}/${PROJECTNAME}.${IMAGE_TYPE}.map"
	
else
dist/${CND_CONF}/${IMAGE_TYPE}/intFreeRTOS.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}: ${OBJECTFILES}  nbproject/Makefile-${CND_CONF}.mk   
	@${MKDIR} dist/${CND_CONF}/${IMAGE_TYPE} 
	${MP_CC} $(MP_EXTRA_LD_PRE)  -mprocessor=$(MP_PROCESSOR_OPTION)  -o dist/${CND_CONF}/${IMAGE_TYPE}/intFreeRTOS.X.${IMAGE_TYPE}.${DEBUGGABLE_SUFFIX} ${OBJECTFILES_QUOTED_IF_SPACED}          -Wl,--defsym=__MPLAB_BUILD=1$(MP_EXTRA_LD_POST)$(MP_LINKER_FILE_OPTION),-Map="${DISTDIR}/${PROJECTNAME}.${IMAGE_TYPE}.map"
	${MP_CC_DIR}\\xc32-bin2hex dist/${CND_CONF}/${IMAGE_TYPE}/intFreeRTOS.X.${IMAGE_TYPE}.${DEBUGGABLE_SUFFIX} 
endif


# Subprojects
.build-subprojects:


# Subprojects
.clean-subprojects:

# Clean Targets
.clean-conf: ${CLEAN_SUBPROJECTS}
	${RM} -r build/default
	${RM} -r dist/default

# Enable dependency checking
.dep.inc: .depcheck-impl

DEPFILES=$(shell mplabwildcard ${POSSIBLE_DEPFILES})
ifneq (${DEPFILES},)
include ${DEPFILES}
endif
