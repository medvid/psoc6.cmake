# This application is compatible with PSoC 6 boards with 2M of internal FLASH
# https://github.com/cypresssemiconductorco/mtb-example-anycloud-ota-mqtt#supported-kits
psoc6_check_bsp(
  CY8CKIT-062S2-43012
  CY8CPROTO-062-4343W
)

project(anycloud-ota-mqtt)

psoc6_load_application(
  NAME mtb-example-anycloud-ota-mqtt
  VERSION 1.0.0
)
psoc6_add_executable(
  SOURCES
    ${APP_DIR}/source/main.c
    ${APP_DIR}/source/led_task.h
    ${APP_DIR}/source/led_task.c
    ${APP_DIR}/source/ota_app_config.h
    ${APP_DIR}/source/ota_task.h
    ${APP_DIR}/source/ota_task.c
  LINK_LIBRARIES
    retarget-io
    wifi-connection-manager
    anycloud-ota
)
