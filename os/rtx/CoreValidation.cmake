psoc6_add_executable(
  NAME
    CoreValidation
  SOURCES
    ${CMSIS_DIR}/CMSIS/CoreValidation/Include/cmsis_cv.h
    ${CMSIS_DIR}/CMSIS/CoreValidation/Include/CV_Framework.h
    ${CMSIS_DIR}/CMSIS/CoreValidation/Include/CV_Report.h
    ${CMSIS_DIR}/CMSIS/CoreValidation/Include/CV_Typedefs.h
    ${CMSIS_DIR}/CMSIS/CoreValidation/Source/cmsis_cv.c
    ${CMSIS_DIR}/CMSIS/CoreValidation/Source/CV_CoreFunc.c
    ${CMSIS_DIR}/CMSIS/CoreValidation/Source/CV_CoreInstr.c
    ${CMSIS_DIR}/CMSIS/CoreValidation/Source/CV_CoreSimd.c
    ${CMSIS_DIR}/CMSIS/CoreValidation/Source/CV_Framework.c
    ${CMSIS_DIR}/CMSIS/CoreValidation/Source/CV_MPU_ARMv7.c
    ${CMSIS_DIR}/CMSIS/CoreValidation/Source/CV_Report.c
    ${CMSIS_DIR}/CMSIS/CoreValidation/Tests/main.c
  INCLUDE_DIRS
    ${CMSIS_DIR}/CMSIS/CoreValidation/Include
    ${CMSIS_DIR}/CMSIS/CoreValidation/Tests
    ${CMSIS_DIR}/CMSIS/CoreValidation/Tests/Config/core_m
  DEFINES
    ARMCM4_FP
    # Override ARMCM4_FP.h interrupt name with PDL name
    Interrupt0_IRQn=ioss_interrupts_gpio_0_IRQn
  LINK_LIBRARIES
    ${CMSIS_CORE_LINK_LIBRARIES}
)
set_property(TARGET CoreValidation PROPERTY
  COMPILE_FLAGS ${TOOLCHAIN_PREINCLUDE}${PORT_DIR}/RTE_Components.h
)
