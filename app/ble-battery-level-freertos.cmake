psoc6_check_bsp(CY8CKIT-062-BLE)

project(ble-battery-level-freertos)

psoc6_load_application(
  NAME mtb-example-psoc6-ble-battery-level-freertos
  VERSION 1.1.0
)
psoc6_add_executable(
  SOURCES
    ${APP_DIR}/source/main.c
    ${APP_DIR}/source/battery_task.h
    ${APP_DIR}/source/battery_task.c
    ${APP_DIR}/source/ble_task.h
    ${APP_DIR}/source/ble_task.c
    ${APP_DIR}/source/status_led_task.h
    ${APP_DIR}/source/status_led_task.c
    ${APP_DIR}/source/uart_debug.h
    ${APP_DIR}/source/uart_debug.c
    ${BLESS_COMMON_SOURCES}
  LINK_LIBRARIES
    bless-host-controller
    psoc6hal
    retarget-io
    freertos
  DESIGN_BT
    ${APP_DIR}/design.cybt
)
