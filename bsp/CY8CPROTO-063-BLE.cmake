# Download BSP sources from GitHub
psoc6_load_bsp(
  NAME CY8CPROTO-063-BLE
  VERSION 2.0.0
)

# Set target MPN
psoc6_set_device(CYBLE-416045-02)

# Set target CPU core
psoc6_set_core()

# Set target VFP
if(${CORE} STREQUAL CM4)
  psoc6_set_vfp(${VFP})
endif()

# Set OpenOCD script name
set(OPENOCD_CFG ${CMAKE_SOURCE_DIR}/CY8C6xx7.tcl)

set(BSP_SOURCES
  ${BSP_DIR}/system_psoc6.h
  ${BSP_DIR}/cybsp.h
  ${BSP_DIR}/cybsp.c
  ${BSP_DIR}/cybsp_types.h
)
set(BSP_LINK_LIBRARIES
  mtb-pdl-cat1
)

# Include BSP_DIR globally
include_directories(${BSP_DIR})

if(${CORE} STREQUAL CM4)
  add_definitions(-DCY_USING_HAL)
  psoc6_add_component(CM0P_SLEEP)
  psoc6_add_component(BSP_DESIGN_MODUS)
  psoc6_add_component(PSOC6HAL)
  # Enable crypto HW acceleration
  set(TARGET_MXCRYPTO "TARGET_MXCRYPTO_01")

  list(APPEND BSP_SOURCES ${BSP_DIR}/COMPONENT_CM4/system_psoc6_cm4.c)
  list(APPEND BSP_LINK_LIBRARIES mtb-hal-cat1)
  if(${TOOLCHAIN} STREQUAL GCC)
    list(APPEND BSP_SOURCES ${BSP_DIR}/COMPONENT_CM4/TOOLCHAIN_GCC_ARM/startup_psoc6_01_cm4.S)
    set(BSP_LINKER_SCRIPT ${BSP_DIR}/COMPONENT_CM4/TOOLCHAIN_GCC_ARM/cy8c6xx7_cm4_dual.ld)
  elseif(${TOOLCHAIN} STREQUAL ARM)
    list(APPEND BSP_SOURCES ${BSP_DIR}/COMPONENT_CM4/TOOLCHAIN_ARM/startup_psoc6_01_cm4.s)
    set(BSP_LINKER_SCRIPT ${BSP_DIR}/COMPONENT_CM4/TOOLCHAIN_ARM/cy8c6xx7_cm4_dual.sct)
  elseif(${TOOLCHAIN} STREQUAL IAR)
    list(APPEND BSP_SOURCES ${BSP_DIR}/COMPONENT_CM4/TOOLCHAIN_IAR/startup_psoc6_01_cm4.s)
    set(BSP_LINKER_SCRIPT ${BSP_DIR}/COMPONENT_CM4/TOOLCHAIN_IAR/cy8c6xx7_cm4_dual.icf)
  elseif(${TOOLCHAIN} STREQUAL LLVM)
    list(APPEND BSP_SOURCES ${LLVM_PORT_DIR}/startup/startup_psoc6_01_cm4.S)
    set(BSP_LINKER_SCRIPT ${BSP_DIR}/COMPONENT_CM4/TOOLCHAIN_GCC_ARM/cy8c6xx7_cm4_dual.ld)
  else()
    message(FATAL_ERROR "bsp: TOOLCHAIN ${TOOLCHAIN} is not supported.")
  endif()
elseif(${CORE} STREQUAL CM0P)
  list(APPEND BSP_SOURCES ${BSP_DIR}/COMPONENT_CM0P/system_psoc6_cm0plus.c)
  if(${TOOLCHAIN} STREQUAL GCC)
    list(APPEND BSP_SOURCES ${BSP_DIR}/COMPONENT_CM0P/TOOLCHAIN_GCC_ARM/startup_psoc6_01_cm0plus.S)
    set(BSP_LINKER_SCRIPT ${BSP_DIR}/COMPONENT_CM0P/TOOLCHAIN_GCC_ARM/cy8c6xx7_cm0plus.ld)
  elseif(${TOOLCHAIN} STREQUAL ARM)
    list(APPEND BSP_SOURCES ${BSP_DIR}/COMPONENT_CM0P/TOOLCHAIN_ARM/startup_psoc6_01_cm0plus.s)
    set(BSP_LINKER_SCRIPT ${BSP_DIR}/COMPONENT_CM0P/TOOLCHAIN_ARM/cy8c6xx7_cm0plus.sct)
  elseif(${TOOLCHAIN} STREQUAL IAR)
    list(APPEND BSP_SOURCES ${BSP_DIR}/COMPONENT_CM0P/TOOLCHAIN_IAR/startup_psoc6_01_cm0plus.s)
    set(BSP_LINKER_SCRIPT ${BSP_DIR}/COMPONENT_CM0P/TOOLCHAIN_IAR/cy8c6xx7_cm0plus.icf)
  elseif(${TOOLCHAIN} STREQUAL LLVM)
    list(APPEND BSP_SOURCES ${LLVM_PORT_DIR}/startup/startup_psoc6_01_cm0plus.S)
    set(BSP_LINKER_SCRIPT ${BSP_DIR}/COMPONENT_CM0P/TOOLCHAIN_GCC_ARM/cy8c6xx7_cm0plus.ld)
  else()
    message(FATAL_ERROR "bsp: TOOLCHAIN ${TOOLCHAIN} is not supported.")
  endif()
else()
  message(FATAL_ERROR "bsp: CORE ${CORE} is not supported.")
endif()

# Define BSP library
add_library(bsp STATIC EXCLUDE_FROM_ALL ${BSP_SOURCES})
target_link_libraries(bsp PUBLIC ${BSP_LINK_LIBRARIES})

# Load library definitions
include(lib/cmsis.cmake)
include(lib/core-lib.cmake)
include(lib/mtb-pdl-cat1.cmake)

# The rest of this file is CM4-specific
if(${CORE} STREQUAL CM0P)
  return()
endif()

# Include common libraries
include(lib/mtb-hal-cat1.cmake)
include(lib/psoc6cm0p.cmake)
include(lib/capsense.cmake)
include(lib/csdadc.cmake)
include(lib/csdidac.cmake)
include(lib/emeeprom.cmake)
include(lib/bless.cmake)
include(lib/retarget-io.cmake)
include(lib/rgb-led.cmake)

# Define custom recipes for BSP generated sources
psoc6_add_bsp_design_modus(${BSP_DIR}/COMPONENT_BSP_DESIGN_MODUS/design.modus
  GENERATED_SOURCES
    cycfg.h
    cycfg.c
    cycfg_notices.h
    cycfg_peripherals.h
    cycfg_peripherals.c
    cycfg_pins.h
    cycfg_pins.c
    cycfg_routing.h
    cycfg_system.h
    cycfg_system.c
)
