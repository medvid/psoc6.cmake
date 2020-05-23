project(anycloud-ble-ess)

psoc6_load_application(
  NAME mtb-example-anycloud-ble-ess
  VERSION 1.0.0
)
psoc6_add_executable(
  SOURCES
    ${APP_DIR}/main.c
    ${APP_DIR}/app_bt_gatt_handler.h
    ${APP_DIR}/app_bt_gatt_handler.c
    ${APP_DIR}/app_bt_utils.h
    ${APP_DIR}/app_bt_utils.c
    ${APP_DIR}/configs/app_bt_cfg.h
    ${APP_DIR}/configs/app_bt_cfg.c
  INCLUDE_DIRS
    ${APP_DIR}/configs
    ${BSP_DIR}/COMPONENT_BSP_DESIGN_MODUS
  LINK_LIBRARIES
    psoc6hal
    retarget-io
    freertos
    abstraction-rtos
    btstack-ble
    bluetooth-freertos
  DESIGN_BT
    ${APP_DIR}/cycfg_bt.cybt
)
