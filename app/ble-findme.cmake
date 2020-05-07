# This application is compatible with BLE-enabled boards
psoc6_check_bsp(
  CY8CKIT-062-BLE
  CY8CPROTO-063-BLE
)

project(ble-findme)

psoc6_load_application(
  NAME mtb-example-psoc6-ble-findme
  VERSION 1.1.0
)
psoc6_add_executable(
  SOURCES
    ${APP_DIR}/main.c
    ${APP_DIR}/ble_findme.h
    ${APP_DIR}/ble_findme.c
    ${BLESS_COMMON_SOURCES}
  LINK_LIBRARIES
    bless-host-controller
    psoc6hal
    retarget-io
  DESIGN_BT
    ${APP_DIR}/design.cybt
)
