# main.c depends on BSP-specific macros
# https://github.com/cypresssemiconductorco/mtb-example-anycloud-ble-capsense-buttons-slider#supported-kits
psoc6_check_bsp(
  CY8CKIT-062-WIFI-BT
  CY8CKIT-062S2-43012
  CY8CPROTO-062-4343W
  CYW9P62S1-43012EVB-01
)

project(anycloud-ble-capsense-buttons-slider)

psoc6_load_application(
  NAME mtb-example-anycloud-ble-capsense-buttons-slider
  VERSION 1.0.0
)
psoc6_add_executable(
  SOURCES
    ${APP_DIR}/source/ble_task.h
    ${APP_DIR}/source/ble_task.c
    ${APP_DIR}/source/capsense_task.h
    ${APP_DIR}/source/capsense_task.c
    ${APP_DIR}/source/led_task.h
    ${APP_DIR}/source/led_task.c
    ${APP_DIR}/source/main.c
    ${APP_DIR}/configs/app_bt_cfg.h
    ${APP_DIR}/configs/app_bt_cfg.c
  INCLUDE_DIRS
    ${APP_DIR}/source
    ${APP_DIR}/configs
  LINK_LIBRARIES
    capsense
    mtb-hal-cat1
    retarget-io
    freertos
    abstraction-rtos
    btstack-ble
    bluetooth-freertos
  DESIGN_BT
    ${APP_DIR}/cycfg_bt.cybt
)
