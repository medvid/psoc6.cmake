# This application provides custom design.modus for the below boards
psoc6_check_bsp(
  CY8CKIT-062S2-43012
  CY8CPROTO-062-4343W
)

project(anycloud-wlan-lowpower)

psoc6_load_application(
  NAME mtb-example-anycloud-wlan-lowpower
  VERSION 1.0.0
)
psoc6_add_executable(
  SOURCES
    ${APP_DIR}/main.c
    ${APP_DIR}/lowpower_task.h
    ${APP_DIR}/lowpower_task.c
  # BUG: lowpower_task.h depends in Mbed BSP name
  DEFINES
    -DTARGET_${MBED_BSP_NAME}
  LINK_LIBRARIES
    retarget-io
    lpa
  DESIGN_MODUS
    ${APP_DIR}/COMPONENT_CUSTOM_DESIGN_MODUS/TARGET_${BSP_NAME}/design.modus
)
