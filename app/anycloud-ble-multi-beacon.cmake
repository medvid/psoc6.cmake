project(anycloud-ble-multi-beacon)

psoc6_load_application(
  NAME mtb-example-anycloud-ble-multi-beacon
  VERSION 2.0.0
)
psoc6_add_executable(
  SOURCES
    ${APP_DIR}/main.c
    ${APP_DIR}/beacon_utils.h
    ${APP_DIR}/beacon_utils.c
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
