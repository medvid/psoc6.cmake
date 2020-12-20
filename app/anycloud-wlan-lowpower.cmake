# This application provides custom design.modus for the below boards
psoc6_check_bsp(
  CY8CKIT-062-WIFI-BT
  CY8CKIT-062S2-43012
  CY8CPROTO-062-4343W
  CYW9P62S1-43012EVB-01
  CYW9P62S1-43438EVB-01
)

project(anycloud-wlan-lowpower)

psoc6_load_application(
  NAME mtb-example-anycloud-wlan-lowpower
  VERSION 2.0.0
)
psoc6_add_executable(
  SOURCES
    ${APP_DIR}/main.c
    ${APP_DIR}/lowpower_task.h
    ${APP_DIR}/lowpower_task.c
  LINK_LIBRARIES
    retarget-io
    lpa
  DESIGN_MODUS
    ${APP_DIR}/COMPONENT_CUSTOM_DESIGN_MODUS/TARGET_${BSP_NAME}/design.modus
)
