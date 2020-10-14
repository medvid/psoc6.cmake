# This application provides custom design.modus for the below boards
psoc6_check_bsp(
  CY8CKIT-062-BLE
  CY8CKIT-062-WIFI-BT
  CY8CKIT-062S2-43012
  CY8CPROTO-062-4343W
  CY8CKIT-062S3-4343W
)

project(capsense-custom-scan)

psoc6_load_application(
  NAME mtb-example-psoc6-capsense-custom-scan
  VERSION 1.0.0
)
psoc6_add_executable(
  SOURCES
    ${APP_DIR}/main.c
    ${APP_DIR}/led.h
    ${APP_DIR}/led.c
  LINK_LIBRARIES
    capsense
    mtb-hal-cat1
  DESIGN_MODUS
    ${APP_DIR}/COMPONENT_CUSTOM_DESIGN_MODUS/TARGET_${BSP_NAME}/design.modus
  DESIGN_CAPSENSE
    ${APP_DIR}/COMPONENT_CUSTOM_DESIGN_MODUS/TARGET_${BSP_NAME}/design.cycapsense
)
