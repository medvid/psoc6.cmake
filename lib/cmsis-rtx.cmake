set(CMSIS_RTX_SOURCES
  ${CMSIS_DIR}/CMSIS/RTOS2/RTX/Config/RTX_Config.h
  ${CMSIS_DIR}/CMSIS/RTOS2/RTX/Config/RTX_Config.c
  ${CMSIS_DIR}/CMSIS/RTOS2/RTX/Include/rtx_evr.h
  ${CMSIS_DIR}/CMSIS/RTOS2/RTX/Include/rtx_os.h
  ${CMSIS_DIR}/CMSIS/RTOS2/RTX/Source/rtx_core_c.h
  ${CMSIS_DIR}/CMSIS/RTOS2/RTX/Source/rtx_core_cm.h
  ${CMSIS_DIR}/CMSIS/RTOS2/RTX/Source/rtx_delay.c
  ${CMSIS_DIR}/CMSIS/RTOS2/RTX/Source/rtx_evflags.c
  ${CMSIS_DIR}/CMSIS/RTOS2/RTX/Source/rtx_evr.c
  ${CMSIS_DIR}/CMSIS/RTOS2/RTX/Source/rtx_kernel.c
  ${CMSIS_DIR}/CMSIS/RTOS2/RTX/Source/rtx_lib.h
  ${CMSIS_DIR}/CMSIS/RTOS2/RTX/Source/rtx_lib.c
  ${CMSIS_DIR}/CMSIS/RTOS2/RTX/Source/rtx_memory.c
  ${CMSIS_DIR}/CMSIS/RTOS2/RTX/Source/rtx_mempool.c
  ${CMSIS_DIR}/CMSIS/RTOS2/RTX/Source/rtx_msgqueue.c
  ${CMSIS_DIR}/CMSIS/RTOS2/RTX/Source/rtx_mutex.c
  ${CMSIS_DIR}/CMSIS/RTOS2/RTX/Source/rtx_semaphore.c
  ${CMSIS_DIR}/CMSIS/RTOS2/RTX/Source/rtx_system.c
  ${CMSIS_DIR}/CMSIS/RTOS2/RTX/Source/rtx_thread.c
  ${CMSIS_DIR}/CMSIS/RTOS2/RTX/Source/rtx_timer.c
)
set(CMSIS_RTX_INCLUDE_DIRS
  ${CMSIS_DIR}/CMSIS/RTOS2/RTX/Config
  ${CMSIS_DIR}/CMSIS/RTOS2/RTX/Include
  ${CMSIS_DIR}/CMSIS/RTOS2/RTX/Source
)
set(CMSIS_RTX_LINK_LIBRARIES
  cmsis-rtos2
)

if(${CORE} STREQUAL CM4)
  if(${TOOLCHAIN} STREQUAL GCC)
    list(APPEND CMSIS_RTX_SOURCES ${CMSIS_DIR}/CMSIS/RTOS2/RTX/Source/GCC/irq_cm4f.S)
  elseif(${TOOLCHAIN} STREQUAL ARM)
    list(APPEND CMSIS_RTX_SOURCES ${CMSIS_DIR}/CMSIS/RTOS2/RTX/Source/ARM/irq_cm4f.s)
  elseif(${TOOLCHAIN} STREQUAL IAR)
    list(APPEND CMSIS_RTX_SOURCES ${CMSIS_DIR}/CMSIS/RTOS2/RTX/Source/IAR/irq_cm4f.s)
  else()
    message(FATAL_ERROR "cmsis-rtx: TOOLCHAIN ${TOOLCHAIN} is not supported.")
  endif()
elseif(${CORE} STREQUAL CM0P)
  if(${TOOLCHAIN} STREQUAL GCC)
    list(APPEND CMSIS_RTX_SOURCES ${CMSIS_DIR}/CMSIS/RTOS2/RTX/Source/GCC/irq_cm0.S)
  elseif(${TOOLCHAIN} STREQUAL ARM)
    list(APPEND CMSIS_RTX_SOURCES ${CMSIS_DIR}/CMSIS/RTOS2/RTX/Source/ARM/irq_cm0.s)
  elseif(${TOOLCHAIN} STREQUAL IAR)
    list(APPEND CMSIS_RTX_SOURCES ${CMSIS_DIR}/CMSIS/RTOS2/RTX/Source/IAR/irq_cm0.s)
  else()
    message(FATAL_ERROR "cmsis-rtx: TOOLCHAIN ${TOOLCHAIN} is not supported.")
  endif()
else()
  message(FATAL_ERROR "cmsis-rtx: CORE ${CORE} is not supported.")
endif()

add_library(cmsis-rtx STATIC EXCLUDE_FROM_ALL ${CMSIS_RTX_SOURCES})
target_include_directories(cmsis-rtx PUBLIC ${CMSIS_RTX_INCLUDE_DIRS})
target_link_libraries(cmsis-rtx PUBLIC ${CMSIS_RTX_LINK_LIBRARIES})

# Suppress warning: ISO C++17 does not allow 'register' storage class specifier [-Wregister]
if(${TOOLCHAIN} STREQUAL GCC)
  target_compile_options(cmsis-rtx PUBLIC $<$<COMPILE_LANGUAGE:CXX>:-Wno-register>)
elseif(${TOOLCHAIN} STREQUAL ARM)
  target_compile_options(cmsis-rtx PUBLIC $<$<COMPILE_LANGUAGE:CXX>:-Wno-deprecated-register>)
endif()
