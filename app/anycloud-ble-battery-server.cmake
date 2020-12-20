project(anycloud-ble-battery-server)

psoc6_load_application(
  NAME mtb-example-anycloud-ble-battery-server
  VERSION 2.0.0
)
psoc6_add_executable(
  SOURCES
    ${APP_DIR}/main.c
    ${APP_DIR}/app_bt_utils.h
    ${APP_DIR}/app_bt_utils.c
    ${APP_DIR}/configs/app_platform_cfg.h
    ${APP_DIR}/configs/app_platform_cfg.c
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
  BT_GENERATED_SOURCES
    cycfg_bt_settings.h
    cycfg_bt_settings.c
    cycfg_gap.h
    cycfg_gap.c
    cycfg_gatt_db.h
    cycfg_gatt_db.c
)
