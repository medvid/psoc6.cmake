# This application is compatible with BLE+CapSense enabled boards
psoc6_check_bsp(
  CY8CKIT-062-BLE
)

project(ble-capsense-tuner-server)

psoc6_load_application(
  NAME mtb-example-psoc6-ble-capsense-tuner-server
  VERSION 1.0.0
)
psoc6_add_executable(
  SOURCES
    ${APP_DIR}/main.c
    ${APP_DIR}/tuner_ble_server.h
    ${APP_DIR}/tuner_ble_server.c
    ${BLESS_COMMON_SOURCES}
  LINK_LIBRARIES
    capsense
    bless-host-controller
    mtb-hal-cat1
    retarget-io
  DESIGN_BLE
    ${APP_DIR}/design.cybt
)
