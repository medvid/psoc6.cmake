# This applications relies on BSP providing design.cycapsense
if(NOT TARGET bsp_design_capsense)
  return()
endif()

# main.c depends on BSP-specific macros
# https://github.com/cypresssemiconductorco/mtb-example-psoc6-capsense-buttons-slider#supported-kits
psoc6_check_bsp(
  CY8CKIT-062-BLE
  CY8CKIT-062-WIFI-BT
  CY8CKIT-062S2-43012
  CY8CPROTO-062-4343W
)

project(capsense-buttons-slider)

psoc6_load_application(
  NAME mtb-example-psoc6-capsense-buttons-slider
  VERSION 1.0.0
)
psoc6_add_executable(
  SOURCES
    ${APP_DIR}/main.c
    ${APP_DIR}/led.h
    ${APP_DIR}/led.c
  LINK_LIBRARIES
    capsense
    psoc6hal
    bsp_design_capsense
)
