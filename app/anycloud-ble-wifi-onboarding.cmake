# This application provides custom design.modus for the below boards
psoc6_check_bsp(
  CY8CKIT-062S2-43012
  CY8CPROTO-062-4343W
)

project(anycloud-ble-wifi-onboarding)

psoc6_load_application(
  NAME mtb-example-anycloud-ble-wifi-onboarding
  VERSION 1.0.0
)
psoc6_add_executable(
  SOURCES
    ${APP_DIR}/main.c
    ${APP_DIR}/app_utils.h
    ${APP_DIR}/app_utils.c
    ${APP_DIR}/wifi_task.h
    ${APP_DIR}/wifi_task.c
    ${APP_DIR}/configs/app_bt_cfg.h
    ${APP_DIR}/configs/app_bt_cfg.c
  INCLUDE_DIRS
    ${APP_DIR}
    ${APP_DIR}/configs
  LINK_LIBRARIES
    psoc6hal
    retarget-io
    freertos
    abstraction-rtos
    lpa
    emeeprom
    btstack-ble
    bluetooth-freertos
  DESIGN_MODUS
    ${APP_DIR}/COMPONENT_CUSTOM_DESIGN_MODUS/TARGET_${BSP_NAME}/design.modus
  DESIGN_BT
    ${APP_DIR}/cycfg_bt.cybt
)
