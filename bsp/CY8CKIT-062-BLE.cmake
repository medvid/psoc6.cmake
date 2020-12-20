# Download BSP sources from GitHub
psoc6_load_bsp(
  NAME CY8CKIT-062-BLE
  VERSION 2.0.0
)

# Set target MPN
psoc6_set_device(CY8C6347BZI-BLD53)

# Set target CPU core
psoc6_set_core(CM4)

# Set target VFP
if(${CORE} STREQUAL CM4)
  psoc6_set_vfp(${VFP})
endif()

# Set OpenOCD script name
set(OPENOCD_CFG ${CMAKE_SOURCE_DIR}/CY8C6xx7.tcl)

set(BSP_SOURCES
  ${BSP_DIR}/cybsp.h
  ${BSP_DIR}/cybsp.c
  ${BSP_DIR}/cybsp_types.h
)
set(BSP_LINK_LIBRARIES
  mtb-pdl-cat1
)

# Include BSP_DIR globally
include_directories(${BSP_DIR})

# Set device die-specific definitions
psoc6_add_component(PSOC6_01)
psoc6_add_bsp_startup(
  startup_psoc6_01_cm4
  cy8c6xx7_cm4_dual
  startup_psoc6_01_cm0plus
  cy8c6xx7_cm0plus
)

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

# Add common definitions and components
add_definitions(-DCY_USING_HAL)
psoc6_add_component(CM0P_SLEEP)
psoc6_add_component(BSP_DESIGN_MODUS)
psoc6_add_component(PSOC6HAL)
psoc6_add_component(MXCRYPTO)
psoc6_add_component(MXCRYPTO_01)
psoc6_add_component(BLE)
psoc6_add_component(CORDIO)

# Include common libraries
include(lib/mtb-hal-cat1.cmake)
include(lib/psoc6cm0p.cmake)
include(lib/capsense.cmake)
include(lib/csdadc.cmake)
include(lib/csdidac.cmake)
include(lib/emeeprom.cmake)
include(lib/emwin.cmake)
include(lib/bless.cmake)
include(lib/retarget-io.cmake)
include(lib/rgb-led.cmake)
include(lib/serial-flash.cmake)

# Include shield libraries
include(lib/shields.cmake)

# Define custom recipes for the BSP generated sources
psoc6_add_bsp_design_modus(${BSP_DIR}/COMPONENT_BSP_DESIGN_MODUS/design.modus)
psoc6_add_bsp_design_capsense(${BSP_DIR}/COMPONENT_BSP_DESIGN_MODUS/design.cycapsense)
psoc6_add_bsp_design_qspi(${BSP_DIR}/COMPONENT_BSP_DESIGN_MODUS/design.cyqspi)
