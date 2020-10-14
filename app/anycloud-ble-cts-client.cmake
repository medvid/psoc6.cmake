project(anycloud-ble-cts-client)

psoc6_load_application(
  NAME mtb-example-anycloud-ble-cts-client
  VERSION 1.0.0
)
psoc6_add_executable(
  SOURCES
    ${APP_DIR}/main.c
    ${APP_DIR}/app_bt_utils.h
    ${APP_DIR}/app_bt_utils.c
    ${APP_DIR}/configs/app_bt_cfg.h
    ${APP_DIR}/configs/app_bt_cfg.c
  INCLUDE_DIRS
    ${APP_DIR}/configs
  LINK_LIBRARIES
    mtb-hal-cat1
    retarget-io
    freertos
    abstraction-rtos
    btstack-ble
    bluetooth-freertos
  DESIGN_BT
    ${APP_DIR}/cycfg_bt.cybt
)
