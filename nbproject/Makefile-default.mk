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
FINAL_IMAGE=dist/${CND_CONF}/${IMAGE_TYPE}/Ix.${IMAGE_TYPE}.${OUTPUT_SUFFIX}
else
IMAGE_TYPE=production
OUTPUT_SUFFIX=hex
DEBUGGABLE_SUFFIX=elf
FINAL_IMAGE=dist/${CND_CONF}/${IMAGE_TYPE}/Ix.${IMAGE_TYPE}.${OUTPUT_SUFFIX}
endif

# Object Directory
OBJECTDIR=build/${CND_CONF}/${IMAGE_TYPE}

# Distribution Directory
DISTDIR=dist/${CND_CONF}/${IMAGE_TYPE}

# Object Files Quoted if spaced
OBJECTFILES_QUOTED_IF_SPACED=${OBJECTDIR}/Sources/Peripheriques/gpio.o ${OBJECTDIR}/Sources/Peripheriques/main.o ${OBJECTDIR}/Sources/Peripheriques/pwm.o ${OBJECTDIR}/Sources/Peripheriques/spi.o ${OBJECTDIR}/Sources/Peripheriques/timer.o ${OBJECTDIR}/Sources/Peripheriques/uart.o ${OBJECTDIR}/Sources/main.o
POSSIBLE_DEPFILES=${OBJECTDIR}/Sources/Peripheriques/gpio.o.d ${OBJECTDIR}/Sources/Peripheriques/main.o.d ${OBJECTDIR}/Sources/Peripheriques/pwm.o.d ${OBJECTDIR}/Sources/Peripheriques/spi.o.d ${OBJECTDIR}/Sources/Peripheriques/timer.o.d ${OBJECTDIR}/Sources/Peripheriques/uart.o.d ${OBJECTDIR}/Sources/main.o.d

# Object Files
OBJECTFILES=${OBJECTDIR}/Sources/Peripheriques/gpio.o ${OBJECTDIR}/Sources/Peripheriques/main.o ${OBJECTDIR}/Sources/Peripheriques/pwm.o ${OBJECTDIR}/Sources/Peripheriques/spi.o ${OBJECTDIR}/Sources/Peripheriques/timer.o ${OBJECTDIR}/Sources/Peripheriques/uart.o ${OBJECTDIR}/Sources/main.o


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
	${MAKE} ${MAKE_OPTIONS} -f nbproject/Makefile-default.mk dist/${CND_CONF}/${IMAGE_TYPE}/Ix.${IMAGE_TYPE}.${OUTPUT_SUFFIX}

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
${OBJECTDIR}/Sources/Peripheriques/gpio.o: Sources/Peripheriques/gpio.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/Sources/Peripheriques 
	@${RM} ${OBJECTDIR}/Sources/Peripheriques/gpio.o.d 
	@${FIXDEPS} "${OBJECTDIR}/Sources/Peripheriques/gpio.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1 -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"C:/Users/Kévin/Desktop/MpLabX/Benchmark.X/Headers/Peripheriques" -I"C:/Users/Kévin/Desktop/MpLabX/Benchmark.X/Headers/Systeme" -I"C:/Users/Kévin/Desktop/MpLabX/Benchmark.X/Sources/Peripheriques" -I"C:/Users/Kévin/Desktop/MpLabX/Benchmark.X/Sources" -I"C:/Users/Kévin/Desktop/MpLabX/Benchmark.X/Headers" -MMD -MF "${OBJECTDIR}/Sources/Peripheriques/gpio.o.d" -o ${OBJECTDIR}/Sources/Peripheriques/gpio.o Sources/Peripheriques/gpio.c   
	
${OBJECTDIR}/Sources/Peripheriques/main.o: Sources/Peripheriques/main.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/Sources/Peripheriques 
	@${RM} ${OBJECTDIR}/Sources/Peripheriques/main.o.d 
	@${FIXDEPS} "${OBJECTDIR}/Sources/Peripheriques/main.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1 -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"C:/Users/Kévin/Desktop/MpLabX/Benchmark.X/Headers/Peripheriques" -I"C:/Users/Kévin/Desktop/MpLabX/Benchmark.X/Headers/Systeme" -I"C:/Users/Kévin/Desktop/MpLabX/Benchmark.X/Sources/Peripheriques" -I"C:/Users/Kévin/Desktop/MpLabX/Benchmark.X/Sources" -I"C:/Users/Kévin/Desktop/MpLabX/Benchmark.X/Headers" -MMD -MF "${OBJECTDIR}/Sources/Peripheriques/main.o.d" -o ${OBJECTDIR}/Sources/Peripheriques/main.o Sources/Peripheriques/main.c   
	
${OBJECTDIR}/Sources/Peripheriques/pwm.o: Sources/Peripheriques/pwm.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/Sources/Peripheriques 
	@${RM} ${OBJECTDIR}/Sources/Peripheriques/pwm.o.d 
	@${FIXDEPS} "${OBJECTDIR}/Sources/Peripheriques/pwm.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1 -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"C:/Users/Kévin/Desktop/MpLabX/Benchmark.X/Headers/Peripheriques" -I"C:/Users/Kévin/Desktop/MpLabX/Benchmark.X/Headers/Systeme" -I"C:/Users/Kévin/Desktop/MpLabX/Benchmark.X/Sources/Peripheriques" -I"C:/Users/Kévin/Desktop/MpLabX/Benchmark.X/Sources" -I"C:/Users/Kévin/Desktop/MpLabX/Benchmark.X/Headers" -MMD -MF "${OBJECTDIR}/Sources/Peripheriques/pwm.o.d" -o ${OBJECTDIR}/Sources/Peripheriques/pwm.o Sources/Peripheriques/pwm.c   
	
${OBJECTDIR}/Sources/Peripheriques/spi.o: Sources/Peripheriques/spi.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/Sources/Peripheriques 
	@${RM} ${OBJECTDIR}/Sources/Peripheriques/spi.o.d 
	@${FIXDEPS} "${OBJECTDIR}/Sources/Peripheriques/spi.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1 -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"C:/Users/Kévin/Desktop/MpLabX/Benchmark.X/Headers/Peripheriques" -I"C:/Users/Kévin/Desktop/MpLabX/Benchmark.X/Headers/Systeme" -I"C:/Users/Kévin/Desktop/MpLabX/Benchmark.X/Sources/Peripheriques" -I"C:/Users/Kévin/Desktop/MpLabX/Benchmark.X/Sources" -I"C:/Users/Kévin/Desktop/MpLabX/Benchmark.X/Headers" -MMD -MF "${OBJECTDIR}/Sources/Peripheriques/spi.o.d" -o ${OBJECTDIR}/Sources/Peripheriques/spi.o Sources/Peripheriques/spi.c   
	
${OBJECTDIR}/Sources/Peripheriques/timer.o: Sources/Peripheriques/timer.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/Sources/Peripheriques 
	@${RM} ${OBJECTDIR}/Sources/Peripheriques/timer.o.d 
	@${FIXDEPS} "${OBJECTDIR}/Sources/Peripheriques/timer.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1 -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"C:/Users/Kévin/Desktop/MpLabX/Benchmark.X/Headers/Peripheriques" -I"C:/Users/Kévin/Desktop/MpLabX/Benchmark.X/Headers/Systeme" -I"C:/Users/Kévin/Desktop/MpLabX/Benchmark.X/Sources/Peripheriques" -I"C:/Users/Kévin/Desktop/MpLabX/Benchmark.X/Sources" -I"C:/Users/Kévin/Desktop/MpLabX/Benchmark.X/Headers" -MMD -MF "${OBJECTDIR}/Sources/Peripheriques/timer.o.d" -o ${OBJECTDIR}/Sources/Peripheriques/timer.o Sources/Peripheriques/timer.c   
	
${OBJECTDIR}/Sources/Peripheriques/uart.o: Sources/Peripheriques/uart.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/Sources/Peripheriques 
	@${RM} ${OBJECTDIR}/Sources/Peripheriques/uart.o.d 
	@${FIXDEPS} "${OBJECTDIR}/Sources/Peripheriques/uart.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1 -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"C:/Users/Kévin/Desktop/MpLabX/Benchmark.X/Headers/Peripheriques" -I"C:/Users/Kévin/Desktop/MpLabX/Benchmark.X/Headers/Systeme" -I"C:/Users/Kévin/Desktop/MpLabX/Benchmark.X/Sources/Peripheriques" -I"C:/Users/Kévin/Desktop/MpLabX/Benchmark.X/Sources" -I"C:/Users/Kévin/Desktop/MpLabX/Benchmark.X/Headers" -MMD -MF "${OBJECTDIR}/Sources/Peripheriques/uart.o.d" -o ${OBJECTDIR}/Sources/Peripheriques/uart.o Sources/Peripheriques/uart.c   
	
${OBJECTDIR}/Sources/main.o: Sources/main.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/Sources 
	@${RM} ${OBJECTDIR}/Sources/main.o.d 
	@${FIXDEPS} "${OBJECTDIR}/Sources/main.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1 -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"C:/Users/Kévin/Desktop/MpLabX/Benchmark.X/Headers/Peripheriques" -I"C:/Users/Kévin/Desktop/MpLabX/Benchmark.X/Headers/Systeme" -I"C:/Users/Kévin/Desktop/MpLabX/Benchmark.X/Sources/Peripheriques" -I"C:/Users/Kévin/Desktop/MpLabX/Benchmark.X/Sources" -I"C:/Users/Kévin/Desktop/MpLabX/Benchmark.X/Headers" -MMD -MF "${OBJECTDIR}/Sources/main.o.d" -o ${OBJECTDIR}/Sources/main.o Sources/main.c   
	
else
${OBJECTDIR}/Sources/Peripheriques/gpio.o: Sources/Peripheriques/gpio.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/Sources/Peripheriques 
	@${RM} ${OBJECTDIR}/Sources/Peripheriques/gpio.o.d 
	@${FIXDEPS} "${OBJECTDIR}/Sources/Peripheriques/gpio.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"C:/Users/Kévin/Desktop/MpLabX/Benchmark.X/Headers/Peripheriques" -I"C:/Users/Kévin/Desktop/MpLabX/Benchmark.X/Headers/Systeme" -I"C:/Users/Kévin/Desktop/MpLabX/Benchmark.X/Sources/Peripheriques" -I"C:/Users/Kévin/Desktop/MpLabX/Benchmark.X/Sources" -I"C:/Users/Kévin/Desktop/MpLabX/Benchmark.X/Headers" -MMD -MF "${OBJECTDIR}/Sources/Peripheriques/gpio.o.d" -o ${OBJECTDIR}/Sources/Peripheriques/gpio.o Sources/Peripheriques/gpio.c   
	
${OBJECTDIR}/Sources/Peripheriques/main.o: Sources/Peripheriques/main.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/Sources/Peripheriques 
	@${RM} ${OBJECTDIR}/Sources/Peripheriques/main.o.d 
	@${FIXDEPS} "${OBJECTDIR}/Sources/Peripheriques/main.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"C:/Users/Kévin/Desktop/MpLabX/Benchmark.X/Headers/Peripheriques" -I"C:/Users/Kévin/Desktop/MpLabX/Benchmark.X/Headers/Systeme" -I"C:/Users/Kévin/Desktop/MpLabX/Benchmark.X/Sources/Peripheriques" -I"C:/Users/Kévin/Desktop/MpLabX/Benchmark.X/Sources" -I"C:/Users/Kévin/Desktop/MpLabX/Benchmark.X/Headers" -MMD -MF "${OBJECTDIR}/Sources/Peripheriques/main.o.d" -o ${OBJECTDIR}/Sources/Peripheriques/main.o Sources/Peripheriques/main.c   
	
${OBJECTDIR}/Sources/Peripheriques/pwm.o: Sources/Peripheriques/pwm.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/Sources/Peripheriques 
	@${RM} ${OBJECTDIR}/Sources/Peripheriques/pwm.o.d 
	@${FIXDEPS} "${OBJECTDIR}/Sources/Peripheriques/pwm.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"C:/Users/Kévin/Desktop/MpLabX/Benchmark.X/Headers/Peripheriques" -I"C:/Users/Kévin/Desktop/MpLabX/Benchmark.X/Headers/Systeme" -I"C:/Users/Kévin/Desktop/MpLabX/Benchmark.X/Sources/Peripheriques" -I"C:/Users/Kévin/Desktop/MpLabX/Benchmark.X/Sources" -I"C:/Users/Kévin/Desktop/MpLabX/Benchmark.X/Headers" -MMD -MF "${OBJECTDIR}/Sources/Peripheriques/pwm.o.d" -o ${OBJECTDIR}/Sources/Peripheriques/pwm.o Sources/Peripheriques/pwm.c   
	
${OBJECTDIR}/Sources/Peripheriques/spi.o: Sources/Peripheriques/spi.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/Sources/Peripheriques 
	@${RM} ${OBJECTDIR}/Sources/Peripheriques/spi.o.d 
	@${FIXDEPS} "${OBJECTDIR}/Sources/Peripheriques/spi.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"C:/Users/Kévin/Desktop/MpLabX/Benchmark.X/Headers/Peripheriques" -I"C:/Users/Kévin/Desktop/MpLabX/Benchmark.X/Headers/Systeme" -I"C:/Users/Kévin/Desktop/MpLabX/Benchmark.X/Sources/Peripheriques" -I"C:/Users/Kévin/Desktop/MpLabX/Benchmark.X/Sources" -I"C:/Users/Kévin/Desktop/MpLabX/Benchmark.X/Headers" -MMD -MF "${OBJECTDIR}/Sources/Peripheriques/spi.o.d" -o ${OBJECTDIR}/Sources/Peripheriques/spi.o Sources/Peripheriques/spi.c   
	
${OBJECTDIR}/Sources/Peripheriques/timer.o: Sources/Peripheriques/timer.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/Sources/Peripheriques 
	@${RM} ${OBJECTDIR}/Sources/Peripheriques/timer.o.d 
	@${FIXDEPS} "${OBJECTDIR}/Sources/Peripheriques/timer.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"C:/Users/Kévin/Desktop/MpLabX/Benchmark.X/Headers/Peripheriques" -I"C:/Users/Kévin/Desktop/MpLabX/Benchmark.X/Headers/Systeme" -I"C:/Users/Kévin/Desktop/MpLabX/Benchmark.X/Sources/Peripheriques" -I"C:/Users/Kévin/Desktop/MpLabX/Benchmark.X/Sources" -I"C:/Users/Kévin/Desktop/MpLabX/Benchmark.X/Headers" -MMD -MF "${OBJECTDIR}/Sources/Peripheriques/timer.o.d" -o ${OBJECTDIR}/Sources/Peripheriques/timer.o Sources/Peripheriques/timer.c   
	
${OBJECTDIR}/Sources/Peripheriques/uart.o: Sources/Peripheriques/uart.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/Sources/Peripheriques 
	@${RM} ${OBJECTDIR}/Sources/Peripheriques/uart.o.d 
	@${FIXDEPS} "${OBJECTDIR}/Sources/Peripheriques/uart.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"C:/Users/Kévin/Desktop/MpLabX/Benchmark.X/Headers/Peripheriques" -I"C:/Users/Kévin/Desktop/MpLabX/Benchmark.X/Headers/Systeme" -I"C:/Users/Kévin/Desktop/MpLabX/Benchmark.X/Sources/Peripheriques" -I"C:/Users/Kévin/Desktop/MpLabX/Benchmark.X/Sources" -I"C:/Users/Kévin/Desktop/MpLabX/Benchmark.X/Headers" -MMD -MF "${OBJECTDIR}/Sources/Peripheriques/uart.o.d" -o ${OBJECTDIR}/Sources/Peripheriques/uart.o Sources/Peripheriques/uart.c   
	
${OBJECTDIR}/Sources/main.o: Sources/main.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/Sources 
	@${RM} ${OBJECTDIR}/Sources/main.o.d 
	@${FIXDEPS} "${OBJECTDIR}/Sources/main.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"C:/Users/Kévin/Desktop/MpLabX/Benchmark.X/Headers/Peripheriques" -I"C:/Users/Kévin/Desktop/MpLabX/Benchmark.X/Headers/Systeme" -I"C:/Users/Kévin/Desktop/MpLabX/Benchmark.X/Sources/Peripheriques" -I"C:/Users/Kévin/Desktop/MpLabX/Benchmark.X/Sources" -I"C:/Users/Kévin/Desktop/MpLabX/Benchmark.X/Headers" -MMD -MF "${OBJECTDIR}/Sources/main.o.d" -o ${OBJECTDIR}/Sources/main.o Sources/main.c   
	
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: compileCPP
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
else
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: link
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
dist/${CND_CONF}/${IMAGE_TYPE}/Ix.${IMAGE_TYPE}.${OUTPUT_SUFFIX}: ${OBJECTFILES}  nbproject/Makefile-${CND_CONF}.mk    
	@${MKDIR} dist/${CND_CONF}/${IMAGE_TYPE} 
	${MP_CC} $(MP_EXTRA_LD_PRE)  -mdebugger -D__MPLAB_DEBUGGER_ICD3=1 -mprocessor=$(MP_PROCESSOR_OPTION)  -o dist/${CND_CONF}/${IMAGE_TYPE}/Ix.${IMAGE_TYPE}.${OUTPUT_SUFFIX} ${OBJECTFILES_QUOTED_IF_SPACED}          -Wl,--defsym=__MPLAB_BUILD=1$(MP_EXTRA_LD_POST)$(MP_LINKER_FILE_OPTION),--defsym=__ICD2RAM=1,--defsym=__MPLAB_DEBUG=1,--defsym=__DEBUG=1,--defsym=__MPLAB_DEBUGGER_ICD3=1
	
else
dist/${CND_CONF}/${IMAGE_TYPE}/Ix.${IMAGE_TYPE}.${OUTPUT_SUFFIX}: ${OBJECTFILES}  nbproject/Makefile-${CND_CONF}.mk   
	@${MKDIR} dist/${CND_CONF}/${IMAGE_TYPE} 
	${MP_CC} $(MP_EXTRA_LD_PRE)  -mprocessor=$(MP_PROCESSOR_OPTION)  -o dist/${CND_CONF}/${IMAGE_TYPE}/Ix.${IMAGE_TYPE}.${DEBUGGABLE_SUFFIX} ${OBJECTFILES_QUOTED_IF_SPACED}          -Wl,--defsym=__MPLAB_BUILD=1$(MP_EXTRA_LD_POST)$(MP_LINKER_FILE_OPTION)
	${MP_CC_DIR}\\xc32-bin2hex dist/${CND_CONF}/${IMAGE_TYPE}/Ix.${IMAGE_TYPE}.${DEBUGGABLE_SUFFIX} 
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
