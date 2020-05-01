psoc6_load_library(
  NAME cmsis
  VERSION 5.6.0
  URL https://github.com/ARM-software/CMSIS_5
  TAG 5.6.0
)

set(CMSIS_CORE_SOURCES
  ${CMSIS_DIR}/CMSIS/Core/Include/cmsis_compiler.h
  ${CMSIS_DIR}/CMSIS/Core/Include/cmsis_version.h
)
set(CMSIS_CORE_INCLUDE_DIRS
  ${CMSIS_DIR}/CMSIS/Core/Include
)

if(${CORE} STREQUAL CM4)
  list(APPEND CMSIS_CORE_SOURCES ${CMSIS_DIR}/CMSIS/Core/Include/core_cm4.h)
elseif(${CORE} STREQUAL CM0P)
  list(APPEND CMSIS_CORE_SOURCES ${CMSIS_DIR}/CMSIS/Core/Include/core_cm0plus.h)
else()
  message(FATAL_ERROR "cmsis: CORE ${CORE} is not supported.")
endif()

if(${TOOLCHAIN} STREQUAL GCC)
  list(APPEND CMSIS_CORE_SOURCES ${CMSIS_DIR}/CMSIS/Core/Include/cmsis_gcc.h)
elseif(${TOOLCHAIN} STREQUAL ARM)
  list(APPEND CMSIS_CORE_SOURCES ${CMSIS_DIR}/CMSIS/Core/Include/cmsis_armclang.h)
elseif(${TOOLCHAIN} STREQUAL IAR)
  list(APPEND CMSIS_CORE_SOURCES ${CMSIS_DIR}/CMSIS/Core/Include/cmsis_iccarm.h)
else()
  message(FATAL_ERROR "cmsis: TOOLCHAIN ${TOOLCHAIN} is not supported.")
endif()

set(CMSIS_CORE_LINK_LIBRARIES
  cmsis-core
  psoc6pdl
)

add_library(cmsis-core INTERFACE)
target_sources(cmsis-core INTERFACE ${CMSIS_CORE_SOURCES})
target_include_directories(cmsis-core INTERFACE ${CMSIS_CORE_INCLUDE_DIRS})
