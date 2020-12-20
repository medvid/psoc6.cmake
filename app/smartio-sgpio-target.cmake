# This application provides custom design.modus for the below boards
psoc6_check_bsp(
  CY8CKIT-062-BLE
  CY8CKIT-062-WIFI-BT
  CY8CKIT-062S2-43012
  CY8CKIT-064B0S2-4343W
  CY8CPROTO-062-4343W
  CY8CPROTO-063-BLE
)

project(smartio-sgpio-target)

psoc6_load_application(
  NAME mtb-example-psoc6-smartio-sgpio-target
  VERSION 1.0.0
)
psoc6_add_executable(
  SOURCES
    ${APP_DIR}/sgpio_target.h
    ${APP_DIR}/sgpio_target.c
    ${APP_DIR}/main.c
  LINK_LIBRARIES
    mtb-hal-cat1
    retarget-io
  DESIGN_MODUS
    ${APP_DIR}/COMPONENT_CUSTOM_DESIGN_MODUS/TARGET_${BSP_NAME}/design.modus
)
