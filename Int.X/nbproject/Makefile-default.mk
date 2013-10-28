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
FINAL_IMAGE=dist/${CND_CONF}/${IMAGE_TYPE}/Int.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}
else
IMAGE_TYPE=production
OUTPUT_SUFFIX=hex
DEBUGGABLE_SUFFIX=elf
FINAL_IMAGE=dist/${CND_CONF}/${IMAGE_TYPE}/Int.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}
endif

# Object Directory
OBJECTDIR=build/${CND_CONF}/${IMAGE_TYPE}

# Distribution Directory
DISTDIR=dist/${CND_CONF}/${IMAGE_TYPE}

# Source Files Quoted if spaced
SOURCEFILES_QUOTED_IF_SPACED=../Sources/main.c ../Sources/pwm.c ../Sources/uart.c ../Sources/timer.c ../Sources/gpio.c ../Sources/ads7885Pic32.c

# Object Files Quoted if spaced
OBJECTFILES_QUOTED_IF_SPACED=${OBJECTDIR}/_ext/2037729719/main.o ${OBJECTDIR}/_ext/2037729719/pwm.o ${OBJECTDIR}/_ext/2037729719/uart.o ${OBJECTDIR}/_ext/2037729719/timer.o ${OBJECTDIR}/_ext/2037729719/gpio.o ${OBJECTDIR}/_ext/2037729719/ads7885Pic32.o
POSSIBLE_DEPFILES=${OBJECTDIR}/_ext/2037729719/main.o.d ${OBJECTDIR}/_ext/2037729719/pwm.o.d ${OBJECTDIR}/_ext/2037729719/uart.o.d ${OBJECTDIR}/_ext/2037729719/timer.o.d ${OBJECTDIR}/_ext/2037729719/gpio.o.d ${OBJECTDIR}/_ext/2037729719/ads7885Pic32.o.d

# Object Files
OBJECTFILES=${OBJECTDIR}/_ext/2037729719/main.o ${OBJECTDIR}/_ext/2037729719/pwm.o ${OBJECTDIR}/_ext/2037729719/uart.o ${OBJECTDIR}/_ext/2037729719/timer.o ${OBJECTDIR}/_ext/2037729719/gpio.o ${OBJECTDIR}/_ext/2037729719/ads7885Pic32.o

# Source Files
SOURCEFILES=../Sources/main.c ../Sources/pwm.c ../Sources/uart.c ../Sources/timer.c ../Sources/gpio.c ../Sources/ads7885Pic32.c


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
	${MAKE} ${MAKE_OPTIONS} -f nbproject/Makefile-default.mk dist/${CND_CONF}/${IMAGE_TYPE}/Int.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}

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
else
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: compile
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
${OBJECTDIR}/_ext/2037729719/main.o: ../Sources/main.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/2037729719 
	@${RM} ${OBJECTDIR}/_ext/2037729719/main.o.d 
	@${RM} ${OBJECTDIR}/_ext/2037729719/main.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/2037729719/main.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1 -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"../Headers" -I"../Sources" -I".." -I"." -MMD -MF "${OBJECTDIR}/_ext/2037729719/main.o.d" -o ${OBJECTDIR}/_ext/2037729719/main.o ../Sources/main.c   
	
${OBJECTDIR}/_ext/2037729719/pwm.o: ../Sources/pwm.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/2037729719 
	@${RM} ${OBJECTDIR}/_ext/2037729719/pwm.o.d 
	@${RM} ${OBJECTDIR}/_ext/2037729719/pwm.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/2037729719/pwm.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1 -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"../Headers" -I"../Sources" -I".." -I"." -MMD -MF "${OBJECTDIR}/_ext/2037729719/pwm.o.d" -o ${OBJECTDIR}/_ext/2037729719/pwm.o ../Sources/pwm.c   
	
${OBJECTDIR}/_ext/2037729719/uart.o: ../Sources/uart.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/2037729719 
	@${RM} ${OBJECTDIR}/_ext/2037729719/uart.o.d 
	@${RM} ${OBJECTDIR}/_ext/2037729719/uart.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/2037729719/uart.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1 -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"../Headers" -I"../Sources" -I".." -I"." -MMD -MF "${OBJECTDIR}/_ext/2037729719/uart.o.d" -o ${OBJECTDIR}/_ext/2037729719/uart.o ../Sources/uart.c   
	
${OBJECTDIR}/_ext/2037729719/timer.o: ../Sources/timer.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/2037729719 
	@${RM} ${OBJECTDIR}/_ext/2037729719/timer.o.d 
	@${RM} ${OBJECTDIR}/_ext/2037729719/timer.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/2037729719/timer.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1 -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"../Headers" -I"../Sources" -I".." -I"." -MMD -MF "${OBJECTDIR}/_ext/2037729719/timer.o.d" -o ${OBJECTDIR}/_ext/2037729719/timer.o ../Sources/timer.c   
	
${OBJECTDIR}/_ext/2037729719/gpio.o: ../Sources/gpio.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/2037729719 
	@${RM} ${OBJECTDIR}/_ext/2037729719/gpio.o.d 
	@${RM} ${OBJECTDIR}/_ext/2037729719/gpio.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/2037729719/gpio.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1 -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"../Headers" -I"../Sources" -I".." -I"." -MMD -MF "${OBJECTDIR}/_ext/2037729719/gpio.o.d" -o ${OBJECTDIR}/_ext/2037729719/gpio.o ../Sources/gpio.c   
	
${OBJECTDIR}/_ext/2037729719/ads7885Pic32.o: ../Sources/ads7885Pic32.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/2037729719 
	@${RM} ${OBJECTDIR}/_ext/2037729719/ads7885Pic32.o.d 
	@${RM} ${OBJECTDIR}/_ext/2037729719/ads7885Pic32.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/2037729719/ads7885Pic32.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1 -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"../Headers" -I"../Sources" -I".." -I"." -MMD -MF "${OBJECTDIR}/_ext/2037729719/ads7885Pic32.o.d" -o ${OBJECTDIR}/_ext/2037729719/ads7885Pic32.o ../Sources/ads7885Pic32.c   
	
else
${OBJECTDIR}/_ext/2037729719/main.o: ../Sources/main.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/2037729719 
	@${RM} ${OBJECTDIR}/_ext/2037729719/main.o.d 
	@${RM} ${OBJECTDIR}/_ext/2037729719/main.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/2037729719/main.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"../Headers" -I"../Sources" -I".." -I"." -MMD -MF "${OBJECTDIR}/_ext/2037729719/main.o.d" -o ${OBJECTDIR}/_ext/2037729719/main.o ../Sources/main.c   
	
${OBJECTDIR}/_ext/2037729719/pwm.o: ../Sources/pwm.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/2037729719 
	@${RM} ${OBJECTDIR}/_ext/2037729719/pwm.o.d 
	@${RM} ${OBJECTDIR}/_ext/2037729719/pwm.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/2037729719/pwm.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"../Headers" -I"../Sources" -I".." -I"." -MMD -MF "${OBJECTDIR}/_ext/2037729719/pwm.o.d" -o ${OBJECTDIR}/_ext/2037729719/pwm.o ../Sources/pwm.c   
	
${OBJECTDIR}/_ext/2037729719/uart.o: ../Sources/uart.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/2037729719 
	@${RM} ${OBJECTDIR}/_ext/2037729719/uart.o.d 
	@${RM} ${OBJECTDIR}/_ext/2037729719/uart.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/2037729719/uart.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"../Headers" -I"../Sources" -I".." -I"." -MMD -MF "${OBJECTDIR}/_ext/2037729719/uart.o.d" -o ${OBJECTDIR}/_ext/2037729719/uart.o ../Sources/uart.c   
	
${OBJECTDIR}/_ext/2037729719/timer.o: ../Sources/timer.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/2037729719 
	@${RM} ${OBJECTDIR}/_ext/2037729719/timer.o.d 
	@${RM} ${OBJECTDIR}/_ext/2037729719/timer.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/2037729719/timer.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"../Headers" -I"../Sources" -I".." -I"." -MMD -MF "${OBJECTDIR}/_ext/2037729719/timer.o.d" -o ${OBJECTDIR}/_ext/2037729719/timer.o ../Sources/timer.c   
	
${OBJECTDIR}/_ext/2037729719/gpio.o: ../Sources/gpio.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/2037729719 
	@${RM} ${OBJECTDIR}/_ext/2037729719/gpio.o.d 
	@${RM} ${OBJECTDIR}/_ext/2037729719/gpio.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/2037729719/gpio.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"../Headers" -I"../Sources" -I".." -I"." -MMD -MF "${OBJECTDIR}/_ext/2037729719/gpio.o.d" -o ${OBJECTDIR}/_ext/2037729719/gpio.o ../Sources/gpio.c   
	
${OBJECTDIR}/_ext/2037729719/ads7885Pic32.o: ../Sources/ads7885Pic32.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/2037729719 
	@${RM} ${OBJECTDIR}/_ext/2037729719/ads7885Pic32.o.d 
	@${RM} ${OBJECTDIR}/_ext/2037729719/ads7885Pic32.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/2037729719/ads7885Pic32.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"../Headers" -I"../Sources" -I".." -I"." -MMD -MF "${OBJECTDIR}/_ext/2037729719/ads7885Pic32.o.d" -o ${OBJECTDIR}/_ext/2037729719/ads7885Pic32.o ../Sources/ads7885Pic32.c   
	
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: compileCPP
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
else
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: link
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
dist/${CND_CONF}/${IMAGE_TYPE}/Int.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}: ${OBJECTFILES}  nbproject/Makefile-${CND_CONF}.mk    
	@${MKDIR} dist/${CND_CONF}/${IMAGE_TYPE} 
	${MP_CC} $(MP_EXTRA_LD_PRE)  -mdebugger -D__MPLAB_DEBUGGER_ICD3=1 -mprocessor=$(MP_PROCESSOR_OPTION)  -o dist/${CND_CONF}/${IMAGE_TYPE}/Int.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX} ${OBJECTFILES_QUOTED_IF_SPACED}          -Wl,--defsym=__MPLAB_BUILD=1$(MP_EXTRA_LD_POST)$(MP_LINKER_FILE_OPTION),--defsym=__ICD2RAM=1,--defsym=__MPLAB_DEBUG=1,--defsym=__DEBUG=1,--defsym=__MPLAB_DEBUGGER_ICD3=1,-Map="${DISTDIR}/${PROJECTNAME}.${IMAGE_TYPE}.map"
	
else
dist/${CND_CONF}/${IMAGE_TYPE}/Int.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}: ${OBJECTFILES}  nbproject/Makefile-${CND_CONF}.mk   
	@${MKDIR} dist/${CND_CONF}/${IMAGE_TYPE} 
	${MP_CC} $(MP_EXTRA_LD_PRE)  -mprocessor=$(MP_PROCESSOR_OPTION)  -o dist/${CND_CONF}/${IMAGE_TYPE}/Int.X.${IMAGE_TYPE}.${DEBUGGABLE_SUFFIX} ${OBJECTFILES_QUOTED_IF_SPACED}          -Wl,--defsym=__MPLAB_BUILD=1$(MP_EXTRA_LD_POST)$(MP_LINKER_FILE_OPTION),-Map="${DISTDIR}/${PROJECTNAME}.${IMAGE_TYPE}.map"
	${MP_CC_DIR}\\xc32-bin2hex dist/${CND_CONF}/${IMAGE_TYPE}/Int.X.${IMAGE_TYPE}.${DEBUGGABLE_SUFFIX} 
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
