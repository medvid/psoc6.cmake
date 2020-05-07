# This application provides custom design.modus for the below boards
psoc6_check_bsp(
  CY8CKIT-062-BLE
  CY8CKIT-062-WIFI-BT
  CY8CKIT-062S2-43012
  CY8CPROTO-062-4343W
  CY8CPROTO-062S3-4343W
  # FIXME: exclude cycfg_routing.c
  #CY8CPROTO-063-BLE
  #CYW9P62S1-43012EVB-01
  CYW9P62S1-43438EVB-01
)

project(smartio-ramping-led)

psoc6_load_application(
  NAME mtb-example-psoc6-smartio-ramping-led
  VERSION 1.2.0
)
psoc6_add_executable(
  SOURCES
    ${APP_DIR}/main.c
  LINK_LIBRARIES
    psoc6hal
  DESIGN_MODUS
    ${APP_DIR}/COMPONENT_CUSTOM_DESIGN_MODUS/TARGET_${BSP_NAME}/design.modus
  # FIXME: cannot pass a list to CMake macro
  #GENERATED_SOURCES
  #  ${BSP_GENERATED_SOURCES}
)
