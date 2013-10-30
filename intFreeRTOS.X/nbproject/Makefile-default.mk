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
OBJECTFILES_QUOTED_IF_SPACED=${OBJECTDIR}/main.o ${OBJECTDIR}/Peripheriques/gpio.o ${OBJECTDIR}/Peripheriques/pwm.o ${OBJECTDIR}/Peripheriques/spi.o ${OBJECTDIR}/Peripheriques/timer.o ${OBJECTDIR}/Peripheriques/uart.o ${OBJECTDIR}/FreeRTOS/Source/croutine.o ${OBJECTDIR}/FreeRTOS/Source/list.o ${OBJECTDIR}/FreeRTOS/Source/queue.o ${OBJECTDIR}/FreeRTOS/Source/task.o ${OBJECTDIR}/FreeRTOS/Source/timers.o ${OBJECTDIR}/FreeRTOS/Source/portable/MemMang/heap_1.o ${OBJECTDIR}/FreeRTOS/Source/portable/MPLAB/PICMX/port.o ${OBJECTDIR}/FreeRTOS/Source/portable/MPLAB/PICMX/port_asm.o
POSSIBLE_DEPFILES=${OBJECTDIR}/main.o.d ${OBJECTDIR}/Peripheriques/gpio.o.d ${OBJECTDIR}/Peripheriques/pwm.o.d ${OBJECTDIR}/Peripheriques/spi.o.d ${OBJECTDIR}/Peripheriques/timer.o.d ${OBJECTDIR}/Peripheriques/uart.o.d ${OBJECTDIR}/FreeRTOS/Source/croutine.o.d ${OBJECTDIR}/FreeRTOS/Source/list.o.d ${OBJECTDIR}/FreeRTOS/Source/queue.o.d ${OBJECTDIR}/FreeRTOS/Source/task.o.d ${OBJECTDIR}/FreeRTOS/Source/timers.o.d ${OBJECTDIR}/FreeRTOS/Source/portable/MemMang/heap_1.o.d ${OBJECTDIR}/FreeRTOS/Source/portable/MPLAB/PICMX/port.o.d ${OBJECTDIR}/FreeRTOS/Source/portable/MPLAB/PICMX/port_asm.o.d

# Object Files
OBJECTFILES=${OBJECTDIR}/main.o ${OBJECTDIR}/Peripheriques/gpio.o ${OBJECTDIR}/Peripheriques/pwm.o ${OBJECTDIR}/Peripheriques/spi.o ${OBJECTDIR}/Peripheriques/timer.o ${OBJECTDIR}/Peripheriques/uart.o ${OBJECTDIR}/FreeRTOS/Source/croutine.o ${OBJECTDIR}/FreeRTOS/Source/list.o ${OBJECTDIR}/FreeRTOS/Source/queue.o ${OBJECTDIR}/FreeRTOS/Source/task.o ${OBJECTDIR}/FreeRTOS/Source/timers.o ${OBJECTDIR}/FreeRTOS/Source/portable/MemMang/heap_1.o ${OBJECTDIR}/FreeRTOS/Source/portable/MPLAB/PICMX/port.o ${OBJECTDIR}/FreeRTOS/Source/portable/MPLAB/PICMX/port_asm.o


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
${OBJECTDIR}/FreeRTOS/Source/portable/MPLAB/PICMX/port_asm.o: FreeRTOS/Source/portable/MPLAB/PICMX/port_asm.S  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/FreeRTOS/Source/portable/MPLAB/PICMX 
	@${RM} ${OBJECTDIR}/FreeRTOS/Source/portable/MPLAB/PICMX/port_asm.o.d 
	@${RM} ${OBJECTDIR}/FreeRTOS/Source/portable/MPLAB/PICMX/port_asm.o.ok ${OBJECTDIR}/FreeRTOS/Source/portable/MPLAB/PICMX/port_asm.o.err 
	@${FIXDEPS} "${OBJECTDIR}/FreeRTOS/Source/portable/MPLAB/PICMX/port_asm.o.d" "${OBJECTDIR}/FreeRTOS/Source/portable/MPLAB/PICMX/port_asm.o.asm.d" -t $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC} $(MP_EXTRA_AS_PRE)  -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1 -c -mprocessor=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/FreeRTOS/Source/portable/MPLAB/PICMX/port_asm.o.d"  -o ${OBJECTDIR}/FreeRTOS/Source/portable/MPLAB/PICMX/port_asm.o FreeRTOS/Source/portable/MPLAB/PICMX/port_asm.S  -Wa,--defsym=__MPLAB_BUILD=1$(MP_EXTRA_AS_POST),-MD="${OBJECTDIR}/FreeRTOS/Source/portable/MPLAB/PICMX/port_asm.o.asm.d",--defsym=__ICD2RAM=1,--defsym=__MPLAB_DEBUG=1,--gdwarf-2,--defsym=__DEBUG=1,--defsym=__MPLAB_DEBUGGER_ICD3=1,-I"C:/intFreeRTOS.X/FreeRTOS/Source/portable/MPLAB/PICMX"
	
else
${OBJECTDIR}/FreeRTOS/Source/portable/MPLAB/PICMX/port_asm.o: FreeRTOS/Source/portable/MPLAB/PICMX/port_asm.S  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/FreeRTOS/Source/portable/MPLAB/PICMX 
	@${RM} ${OBJECTDIR}/FreeRTOS/Source/portable/MPLAB/PICMX/port_asm.o.d 
	@${RM} ${OBJECTDIR}/FreeRTOS/Source/portable/MPLAB/PICMX/port_asm.o.ok ${OBJECTDIR}/FreeRTOS/Source/portable/MPLAB/PICMX/port_asm.o.err 
	@${FIXDEPS} "${OBJECTDIR}/FreeRTOS/Source/portable/MPLAB/PICMX/port_asm.o.d" "${OBJECTDIR}/FreeRTOS/Source/portable/MPLAB/PICMX/port_asm.o.asm.d" -t $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC} $(MP_EXTRA_AS_PRE)  -c -mprocessor=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/FreeRTOS/Source/portable/MPLAB/PICMX/port_asm.o.d"  -o ${OBJECTDIR}/FreeRTOS/Source/portable/MPLAB/PICMX/port_asm.o FreeRTOS/Source/portable/MPLAB/PICMX/port_asm.S  -Wa,--defsym=__MPLAB_BUILD=1$(MP_EXTRA_AS_POST),-MD="${OBJECTDIR}/FreeRTOS/Source/portable/MPLAB/PICMX/port_asm.o.asm.d",--gdwarf-2,-I"C:/intFreeRTOS.X/FreeRTOS/Source/portable/MPLAB/PICMX"
	
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: compile
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
${OBJECTDIR}/main.o: main.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR} 
	@${RM} ${OBJECTDIR}/main.o.d 
	@${FIXDEPS} "${OBJECTDIR}/main.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1 -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"C:/intFreeRTOS.X/FreeRTOS/Source/include" -I"C:/intFreeRTOS.X/FreeRTOS/Source/portable/MPLAB/PICMX" -I"C:/intFreeRTOS.X/FreeRTOS" -I"C:/intFreeRTOS.X" -I"C:/intFreeRTOS.X/Systeme" -I"C:/intFreeRTOS.X/Peripheriques" -I"." -I".." -MMD -MF "${OBJECTDIR}/main.o.d" -o ${OBJECTDIR}/main.o main.c   
	
${OBJECTDIR}/Peripheriques/gpio.o: Peripheriques/gpio.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/Peripheriques 
	@${RM} ${OBJECTDIR}/Peripheriques/gpio.o.d 
	@${FIXDEPS} "${OBJECTDIR}/Peripheriques/gpio.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1 -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"C:/intFreeRTOS.X/FreeRTOS/Source/include" -I"C:/intFreeRTOS.X/FreeRTOS/Source/portable/MPLAB/PICMX" -I"C:/intFreeRTOS.X/FreeRTOS" -I"C:/intFreeRTOS.X" -I"C:/intFreeRTOS.X/Systeme" -I"C:/intFreeRTOS.X/Peripheriques" -I"." -I".." -MMD -MF "${OBJECTDIR}/Peripheriques/gpio.o.d" -o ${OBJECTDIR}/Peripheriques/gpio.o Peripheriques/gpio.c   
	
${OBJECTDIR}/Peripheriques/pwm.o: Peripheriques/pwm.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/Peripheriques 
	@${RM} ${OBJECTDIR}/Peripheriques/pwm.o.d 
	@${FIXDEPS} "${OBJECTDIR}/Peripheriques/pwm.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1 -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"C:/intFreeRTOS.X/FreeRTOS/Source/include" -I"C:/intFreeRTOS.X/FreeRTOS/Source/portable/MPLAB/PICMX" -I"C:/intFreeRTOS.X/FreeRTOS" -I"C:/intFreeRTOS.X" -I"C:/intFreeRTOS.X/Systeme" -I"C:/intFreeRTOS.X/Peripheriques" -I"." -I".." -MMD -MF "${OBJECTDIR}/Peripheriques/pwm.o.d" -o ${OBJECTDIR}/Peripheriques/pwm.o Peripheriques/pwm.c   
	
${OBJECTDIR}/Peripheriques/spi.o: Peripheriques/spi.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/Peripheriques 
	@${RM} ${OBJECTDIR}/Peripheriques/spi.o.d 
	@${FIXDEPS} "${OBJECTDIR}/Peripheriques/spi.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1 -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"C:/intFreeRTOS.X/FreeRTOS/Source/include" -I"C:/intFreeRTOS.X/FreeRTOS/Source/portable/MPLAB/PICMX" -I"C:/intFreeRTOS.X/FreeRTOS" -I"C:/intFreeRTOS.X" -I"C:/intFreeRTOS.X/Systeme" -I"C:/intFreeRTOS.X/Peripheriques" -I"." -I".." -MMD -MF "${OBJECTDIR}/Peripheriques/spi.o.d" -o ${OBJECTDIR}/Peripheriques/spi.o Peripheriques/spi.c   
	
${OBJECTDIR}/Peripheriques/timer.o: Peripheriques/timer.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/Peripheriques 
	@${RM} ${OBJECTDIR}/Peripheriques/timer.o.d 
	@${FIXDEPS} "${OBJECTDIR}/Peripheriques/timer.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1 -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"C:/intFreeRTOS.X/FreeRTOS/Source/include" -I"C:/intFreeRTOS.X/FreeRTOS/Source/portable/MPLAB/PICMX" -I"C:/intFreeRTOS.X/FreeRTOS" -I"C:/intFreeRTOS.X" -I"C:/intFreeRTOS.X/Systeme" -I"C:/intFreeRTOS.X/Peripheriques" -I"." -I".." -MMD -MF "${OBJECTDIR}/Peripheriques/timer.o.d" -o ${OBJECTDIR}/Peripheriques/timer.o Peripheriques/timer.c   
	
${OBJECTDIR}/Peripheriques/uart.o: Peripheriques/uart.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/Peripheriques 
	@${RM} ${OBJECTDIR}/Peripheriques/uart.o.d 
	@${FIXDEPS} "${OBJECTDIR}/Peripheriques/uart.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1 -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"C:/intFreeRTOS.X/FreeRTOS/Source/include" -I"C:/intFreeRTOS.X/FreeRTOS/Source/portable/MPLAB/PICMX" -I"C:/intFreeRTOS.X/FreeRTOS" -I"C:/intFreeRTOS.X" -I"C:/intFreeRTOS.X/Systeme" -I"C:/intFreeRTOS.X/Peripheriques" -I"." -I".." -MMD -MF "${OBJECTDIR}/Peripheriques/uart.o.d" -o ${OBJECTDIR}/Peripheriques/uart.o Peripheriques/uart.c   
	
${OBJECTDIR}/FreeRTOS/Source/croutine.o: FreeRTOS/Source/croutine.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/FreeRTOS/Source 
	@${RM} ${OBJECTDIR}/FreeRTOS/Source/croutine.o.d 
	@${FIXDEPS} "${OBJECTDIR}/FreeRTOS/Source/croutine.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1 -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"C:/intFreeRTOS.X/FreeRTOS/Source/include" -I"C:/intFreeRTOS.X/FreeRTOS/Source/portable/MPLAB/PICMX" -I"C:/intFreeRTOS.X/FreeRTOS" -I"C:/intFreeRTOS.X" -I"C:/intFreeRTOS.X/Systeme" -I"C:/intFreeRTOS.X/Peripheriques" -I"." -I".." -MMD -MF "${OBJECTDIR}/FreeRTOS/Source/croutine.o.d" -o ${OBJECTDIR}/FreeRTOS/Source/croutine.o FreeRTOS/Source/croutine.c   
	
${OBJECTDIR}/FreeRTOS/Source/list.o: FreeRTOS/Source/list.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/FreeRTOS/Source 
	@${RM} ${OBJECTDIR}/FreeRTOS/Source/list.o.d 
	@${FIXDEPS} "${OBJECTDIR}/FreeRTOS/Source/list.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1 -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"C:/intFreeRTOS.X/FreeRTOS/Source/include" -I"C:/intFreeRTOS.X/FreeRTOS/Source/portable/MPLAB/PICMX" -I"C:/intFreeRTOS.X/FreeRTOS" -I"C:/intFreeRTOS.X" -I"C:/intFreeRTOS.X/Systeme" -I"C:/intFreeRTOS.X/Peripheriques" -I"." -I".." -MMD -MF "${OBJECTDIR}/FreeRTOS/Source/list.o.d" -o ${OBJECTDIR}/FreeRTOS/Source/list.o FreeRTOS/Source/list.c   
	
${OBJECTDIR}/FreeRTOS/Source/queue.o: FreeRTOS/Source/queue.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/FreeRTOS/Source 
	@${RM} ${OBJECTDIR}/FreeRTOS/Source/queue.o.d 
	@${FIXDEPS} "${OBJECTDIR}/FreeRTOS/Source/queue.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1 -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"C:/intFreeRTOS.X/FreeRTOS/Source/include" -I"C:/intFreeRTOS.X/FreeRTOS/Source/portable/MPLAB/PICMX" -I"C:/intFreeRTOS.X/FreeRTOS" -I"C:/intFreeRTOS.X" -I"C:/intFreeRTOS.X/Systeme" -I"C:/intFreeRTOS.X/Peripheriques" -I"." -I".." -MMD -MF "${OBJECTDIR}/FreeRTOS/Source/queue.o.d" -o ${OBJECTDIR}/FreeRTOS/Source/queue.o FreeRTOS/Source/queue.c   
	
${OBJECTDIR}/FreeRTOS/Source/task.o: FreeRTOS/Source/task.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/FreeRTOS/Source 
	@${RM} ${OBJECTDIR}/FreeRTOS/Source/task.o.d 
	@${FIXDEPS} "${OBJECTDIR}/FreeRTOS/Source/task.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1 -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"C:/intFreeRTOS.X/FreeRTOS/Source/include" -I"C:/intFreeRTOS.X/FreeRTOS/Source/portable/MPLAB/PICMX" -I"C:/intFreeRTOS.X/FreeRTOS" -I"C:/intFreeRTOS.X" -I"C:/intFreeRTOS.X/Systeme" -I"C:/intFreeRTOS.X/Peripheriques" -I"." -I".." -MMD -MF "${OBJECTDIR}/FreeRTOS/Source/task.o.d" -o ${OBJECTDIR}/FreeRTOS/Source/task.o FreeRTOS/Source/task.c   
	
${OBJECTDIR}/FreeRTOS/Source/timers.o: FreeRTOS/Source/timers.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/FreeRTOS/Source 
	@${RM} ${OBJECTDIR}/FreeRTOS/Source/timers.o.d 
	@${FIXDEPS} "${OBJECTDIR}/FreeRTOS/Source/timers.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1 -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"C:/intFreeRTOS.X/FreeRTOS/Source/include" -I"C:/intFreeRTOS.X/FreeRTOS/Source/portable/MPLAB/PICMX" -I"C:/intFreeRTOS.X/FreeRTOS" -I"C:/intFreeRTOS.X" -I"C:/intFreeRTOS.X/Systeme" -I"C:/intFreeRTOS.X/Peripheriques" -I"." -I".." -MMD -MF "${OBJECTDIR}/FreeRTOS/Source/timers.o.d" -o ${OBJECTDIR}/FreeRTOS/Source/timers.o FreeRTOS/Source/timers.c   
	
${OBJECTDIR}/FreeRTOS/Source/portable/MemMang/heap_1.o: FreeRTOS/Source/portable/MemMang/heap_1.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/FreeRTOS/Source/portable/MemMang 
	@${RM} ${OBJECTDIR}/FreeRTOS/Source/portable/MemMang/heap_1.o.d 
	@${FIXDEPS} "${OBJECTDIR}/FreeRTOS/Source/portable/MemMang/heap_1.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1 -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"C:/intFreeRTOS.X/FreeRTOS/Source/include" -I"C:/intFreeRTOS.X/FreeRTOS/Source/portable/MPLAB/PICMX" -I"C:/intFreeRTOS.X/FreeRTOS" -I"C:/intFreeRTOS.X" -I"C:/intFreeRTOS.X/Systeme" -I"C:/intFreeRTOS.X/Peripheriques" -I"." -I".." -MMD -MF "${OBJECTDIR}/FreeRTOS/Source/portable/MemMang/heap_1.o.d" -o ${OBJECTDIR}/FreeRTOS/Source/portable/MemMang/heap_1.o FreeRTOS/Source/portable/MemMang/heap_1.c   
	
${OBJECTDIR}/FreeRTOS/Source/portable/MPLAB/PICMX/port.o: FreeRTOS/Source/portable/MPLAB/PICMX/port.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/FreeRTOS/Source/portable/MPLAB/PICMX 
	@${RM} ${OBJECTDIR}/FreeRTOS/Source/portable/MPLAB/PICMX/port.o.d 
	@${FIXDEPS} "${OBJECTDIR}/FreeRTOS/Source/portable/MPLAB/PICMX/port.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1 -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"C:/intFreeRTOS.X/FreeRTOS/Source/include" -I"C:/intFreeRTOS.X/FreeRTOS/Source/portable/MPLAB/PICMX" -I"C:/intFreeRTOS.X/FreeRTOS" -I"C:/intFreeRTOS.X" -I"C:/intFreeRTOS.X/Systeme" -I"C:/intFreeRTOS.X/Peripheriques" -I"." -I".." -MMD -MF "${OBJECTDIR}/FreeRTOS/Source/portable/MPLAB/PICMX/port.o.d" -o ${OBJECTDIR}/FreeRTOS/Source/portable/MPLAB/PICMX/port.o FreeRTOS/Source/portable/MPLAB/PICMX/port.c   
	
else
${OBJECTDIR}/main.o: main.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR} 
	@${RM} ${OBJECTDIR}/main.o.d 
	@${FIXDEPS} "${OBJECTDIR}/main.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"C:/intFreeRTOS.X/FreeRTOS/Source/include" -I"C:/intFreeRTOS.X/FreeRTOS/Source/portable/MPLAB/PICMX" -I"C:/intFreeRTOS.X/FreeRTOS" -I"C:/intFreeRTOS.X" -I"C:/intFreeRTOS.X/Systeme" -I"C:/intFreeRTOS.X/Peripheriques" -I"." -I".." -MMD -MF "${OBJECTDIR}/main.o.d" -o ${OBJECTDIR}/main.o main.c   
	
${OBJECTDIR}/Peripheriques/gpio.o: Peripheriques/gpio.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/Peripheriques 
	@${RM} ${OBJECTDIR}/Peripheriques/gpio.o.d 
	@${FIXDEPS} "${OBJECTDIR}/Peripheriques/gpio.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"C:/intFreeRTOS.X/FreeRTOS/Source/include" -I"C:/intFreeRTOS.X/FreeRTOS/Source/portable/MPLAB/PICMX" -I"C:/intFreeRTOS.X/FreeRTOS" -I"C:/intFreeRTOS.X" -I"C:/intFreeRTOS.X/Systeme" -I"C:/intFreeRTOS.X/Peripheriques" -I"." -I".." -MMD -MF "${OBJECTDIR}/Peripheriques/gpio.o.d" -o ${OBJECTDIR}/Peripheriques/gpio.o Peripheriques/gpio.c   
	
${OBJECTDIR}/Peripheriques/pwm.o: Peripheriques/pwm.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/Peripheriques 
	@${RM} ${OBJECTDIR}/Peripheriques/pwm.o.d 
	@${FIXDEPS} "${OBJECTDIR}/Peripheriques/pwm.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"C:/intFreeRTOS.X/FreeRTOS/Source/include" -I"C:/intFreeRTOS.X/FreeRTOS/Source/portable/MPLAB/PICMX" -I"C:/intFreeRTOS.X/FreeRTOS" -I"C:/intFreeRTOS.X" -I"C:/intFreeRTOS.X/Systeme" -I"C:/intFreeRTOS.X/Peripheriques" -I"." -I".." -MMD -MF "${OBJECTDIR}/Peripheriques/pwm.o.d" -o ${OBJECTDIR}/Peripheriques/pwm.o Peripheriques/pwm.c   
	
${OBJECTDIR}/Peripheriques/spi.o: Peripheriques/spi.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/Peripheriques 
	@${RM} ${OBJECTDIR}/Peripheriques/spi.o.d 
	@${FIXDEPS} "${OBJECTDIR}/Peripheriques/spi.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"C:/intFreeRTOS.X/FreeRTOS/Source/include" -I"C:/intFreeRTOS.X/FreeRTOS/Source/portable/MPLAB/PICMX" -I"C:/intFreeRTOS.X/FreeRTOS" -I"C:/intFreeRTOS.X" -I"C:/intFreeRTOS.X/Systeme" -I"C:/intFreeRTOS.X/Peripheriques" -I"." -I".." -MMD -MF "${OBJECTDIR}/Peripheriques/spi.o.d" -o ${OBJECTDIR}/Peripheriques/spi.o Peripheriques/spi.c   
	
${OBJECTDIR}/Peripheriques/timer.o: Peripheriques/timer.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/Peripheriques 
	@${RM} ${OBJECTDIR}/Peripheriques/timer.o.d 
	@${FIXDEPS} "${OBJECTDIR}/Peripheriques/timer.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"C:/intFreeRTOS.X/FreeRTOS/Source/include" -I"C:/intFreeRTOS.X/FreeRTOS/Source/portable/MPLAB/PICMX" -I"C:/intFreeRTOS.X/FreeRTOS" -I"C:/intFreeRTOS.X" -I"C:/intFreeRTOS.X/Systeme" -I"C:/intFreeRTOS.X/Peripheriques" -I"." -I".." -MMD -MF "${OBJECTDIR}/Peripheriques/timer.o.d" -o ${OBJECTDIR}/Peripheriques/timer.o Peripheriques/timer.c   
	
${OBJECTDIR}/Peripheriques/uart.o: Peripheriques/uart.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/Peripheriques 
	@${RM} ${OBJECTDIR}/Peripheriques/uart.o.d 
	@${FIXDEPS} "${OBJECTDIR}/Peripheriques/uart.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"C:/intFreeRTOS.X/FreeRTOS/Source/include" -I"C:/intFreeRTOS.X/FreeRTOS/Source/portable/MPLAB/PICMX" -I"C:/intFreeRTOS.X/FreeRTOS" -I"C:/intFreeRTOS.X" -I"C:/intFreeRTOS.X/Systeme" -I"C:/intFreeRTOS.X/Peripheriques" -I"." -I".." -MMD -MF "${OBJECTDIR}/Peripheriques/uart.o.d" -o ${OBJECTDIR}/Peripheriques/uart.o Peripheriques/uart.c   
	
${OBJECTDIR}/FreeRTOS/Source/croutine.o: FreeRTOS/Source/croutine.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/FreeRTOS/Source 
	@${RM} ${OBJECTDIR}/FreeRTOS/Source/croutine.o.d 
	@${FIXDEPS} "${OBJECTDIR}/FreeRTOS/Source/croutine.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"C:/intFreeRTOS.X/FreeRTOS/Source/include" -I"C:/intFreeRTOS.X/FreeRTOS/Source/portable/MPLAB/PICMX" -I"C:/intFreeRTOS.X/FreeRTOS" -I"C:/intFreeRTOS.X" -I"C:/intFreeRTOS.X/Systeme" -I"C:/intFreeRTOS.X/Peripheriques" -I"." -I".." -MMD -MF "${OBJECTDIR}/FreeRTOS/Source/croutine.o.d" -o ${OBJECTDIR}/FreeRTOS/Source/croutine.o FreeRTOS/Source/croutine.c   
	
${OBJECTDIR}/FreeRTOS/Source/list.o: FreeRTOS/Source/list.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/FreeRTOS/Source 
	@${RM} ${OBJECTDIR}/FreeRTOS/Source/list.o.d 
	@${FIXDEPS} "${OBJECTDIR}/FreeRTOS/Source/list.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"C:/intFreeRTOS.X/FreeRTOS/Source/include" -I"C:/intFreeRTOS.X/FreeRTOS/Source/portable/MPLAB/PICMX" -I"C:/intFreeRTOS.X/FreeRTOS" -I"C:/intFreeRTOS.X" -I"C:/intFreeRTOS.X/Systeme" -I"C:/intFreeRTOS.X/Peripheriques" -I"." -I".." -MMD -MF "${OBJECTDIR}/FreeRTOS/Source/list.o.d" -o ${OBJECTDIR}/FreeRTOS/Source/list.o FreeRTOS/Source/list.c   
	
${OBJECTDIR}/FreeRTOS/Source/queue.o: FreeRTOS/Source/queue.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/FreeRTOS/Source 
	@${RM} ${OBJECTDIR}/FreeRTOS/Source/queue.o.d 
	@${FIXDEPS} "${OBJECTDIR}/FreeRTOS/Source/queue.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"C:/intFreeRTOS.X/FreeRTOS/Source/include" -I"C:/intFreeRTOS.X/FreeRTOS/Source/portable/MPLAB/PICMX" -I"C:/intFreeRTOS.X/FreeRTOS" -I"C:/intFreeRTOS.X" -I"C:/intFreeRTOS.X/Systeme" -I"C:/intFreeRTOS.X/Peripheriques" -I"." -I".." -MMD -MF "${OBJECTDIR}/FreeRTOS/Source/queue.o.d" -o ${OBJECTDIR}/FreeRTOS/Source/queue.o FreeRTOS/Source/queue.c   
	
${OBJECTDIR}/FreeRTOS/Source/task.o: FreeRTOS/Source/task.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/FreeRTOS/Source 
	@${RM} ${OBJECTDIR}/FreeRTOS/Source/task.o.d 
	@${FIXDEPS} "${OBJECTDIR}/FreeRTOS/Source/task.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"C:/intFreeRTOS.X/FreeRTOS/Source/include" -I"C:/intFreeRTOS.X/FreeRTOS/Source/portable/MPLAB/PICMX" -I"C:/intFreeRTOS.X/FreeRTOS" -I"C:/intFreeRTOS.X" -I"C:/intFreeRTOS.X/Systeme" -I"C:/intFreeRTOS.X/Peripheriques" -I"." -I".." -MMD -MF "${OBJECTDIR}/FreeRTOS/Source/task.o.d" -o ${OBJECTDIR}/FreeRTOS/Source/task.o FreeRTOS/Source/task.c   
	
${OBJECTDIR}/FreeRTOS/Source/timers.o: FreeRTOS/Source/timers.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/FreeRTOS/Source 
	@${RM} ${OBJECTDIR}/FreeRTOS/Source/timers.o.d 
	@${FIXDEPS} "${OBJECTDIR}/FreeRTOS/Source/timers.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"C:/intFreeRTOS.X/FreeRTOS/Source/include" -I"C:/intFreeRTOS.X/FreeRTOS/Source/portable/MPLAB/PICMX" -I"C:/intFreeRTOS.X/FreeRTOS" -I"C:/intFreeRTOS.X" -I"C:/intFreeRTOS.X/Systeme" -I"C:/intFreeRTOS.X/Peripheriques" -I"." -I".." -MMD -MF "${OBJECTDIR}/FreeRTOS/Source/timers.o.d" -o ${OBJECTDIR}/FreeRTOS/Source/timers.o FreeRTOS/Source/timers.c   
	
${OBJECTDIR}/FreeRTOS/Source/portable/MemMang/heap_1.o: FreeRTOS/Source/portable/MemMang/heap_1.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/FreeRTOS/Source/portable/MemMang 
	@${RM} ${OBJECTDIR}/FreeRTOS/Source/portable/MemMang/heap_1.o.d 
	@${FIXDEPS} "${OBJECTDIR}/FreeRTOS/Source/portable/MemMang/heap_1.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"C:/intFreeRTOS.X/FreeRTOS/Source/include" -I"C:/intFreeRTOS.X/FreeRTOS/Source/portable/MPLAB/PICMX" -I"C:/intFreeRTOS.X/FreeRTOS" -I"C:/intFreeRTOS.X" -I"C:/intFreeRTOS.X/Systeme" -I"C:/intFreeRTOS.X/Peripheriques" -I"." -I".." -MMD -MF "${OBJECTDIR}/FreeRTOS/Source/portable/MemMang/heap_1.o.d" -o ${OBJECTDIR}/FreeRTOS/Source/portable/MemMang/heap_1.o FreeRTOS/Source/portable/MemMang/heap_1.c   
	
${OBJECTDIR}/FreeRTOS/Source/portable/MPLAB/PICMX/port.o: FreeRTOS/Source/portable/MPLAB/PICMX/port.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/FreeRTOS/Source/portable/MPLAB/PICMX 
	@${RM} ${OBJECTDIR}/FreeRTOS/Source/portable/MPLAB/PICMX/port.o.d 
	@${FIXDEPS} "${OBJECTDIR}/FreeRTOS/Source/portable/MPLAB/PICMX/port.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"C:/intFreeRTOS.X/FreeRTOS/Source/include" -I"C:/intFreeRTOS.X/FreeRTOS/Source/portable/MPLAB/PICMX" -I"C:/intFreeRTOS.X/FreeRTOS" -I"C:/intFreeRTOS.X" -I"C:/intFreeRTOS.X/Systeme" -I"C:/intFreeRTOS.X/Peripheriques" -I"." -I".." -MMD -MF "${OBJECTDIR}/FreeRTOS/Source/portable/MPLAB/PICMX/port.o.d" -o ${OBJECTDIR}/FreeRTOS/Source/portable/MPLAB/PICMX/port.o FreeRTOS/Source/portable/MPLAB/PICMX/port.c   
	
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
	${MP_CC} $(MP_EXTRA_LD_PRE)  -mdebugger -D__MPLAB_DEBUGGER_ICD3=1 -mprocessor=$(MP_PROCESSOR_OPTION)  -o dist/${CND_CONF}/${IMAGE_TYPE}/intFreeRTOS.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX} ${OBJECTFILES_QUOTED_IF_SPACED}          -Wl,--defsym=__MPLAB_BUILD=1$(MP_EXTRA_LD_POST)$(MP_LINKER_FILE_OPTION),--defsym=__ICD2RAM=1,--defsym=__MPLAB_DEBUG=1,--defsym=__DEBUG=1,--defsym=__MPLAB_DEBUGGER_ICD3=1
	
else
dist/${CND_CONF}/${IMAGE_TYPE}/intFreeRTOS.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}: ${OBJECTFILES}  nbproject/Makefile-${CND_CONF}.mk   
	@${MKDIR} dist/${CND_CONF}/${IMAGE_TYPE} 
	${MP_CC} $(MP_EXTRA_LD_PRE)  -mprocessor=$(MP_PROCESSOR_OPTION)  -o dist/${CND_CONF}/${IMAGE_TYPE}/intFreeRTOS.X.${IMAGE_TYPE}.${DEBUGGABLE_SUFFIX} ${OBJECTFILES_QUOTED_IF_SPACED}          -Wl,--defsym=__MPLAB_BUILD=1$(MP_EXTRA_LD_POST)$(MP_LINKER_FILE_OPTION)
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
