# This application provides custom design.modus for the below boards
psoc6_check_bsp(
  CY8CKIT-062-BLE
  CY8CPROTO-063-BLE
)

project(ble-capsense-tuner-client)

psoc6_load_application(
  NAME mtb-example-psoc6-ble-capsense-tuner-client
  VERSION 1.0.0
)
psoc6_add_executable(
  SOURCES
    ${APP_DIR}/main.h
    ${APP_DIR}/main.c
    ${APP_DIR}/tuner_ble_client.h
    ${APP_DIR}/tuner_ble_client.c
    ${BLESS_COMMON_SOURCES}
  LINK_LIBRARIES
    capsense
    bless-host-controller
    mtb-hal-cat1
    retarget-io
  DESIGN_MODUS
    ${APP_DIR}/COMPONENT_CUSTOM_DESIGN_MODUS/TARGET_${BSP_NAME}/design.modus
  DESIGN_CAPSENSE
    ${APP_DIR}/COMPONENT_CUSTOM_DESIGN_MODUS/TARGET_${BSP_NAME}/design.cycapsense
  DESIGN_BLE
    ${APP_DIR}/design.cybt
)
