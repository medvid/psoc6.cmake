psoc6_check_bsp(CY8CKIT-062-BLE CY8CKIT-062-WIFI-BT)

project(qspi-fram-access)

psoc6_load_application(
  NAME mtb-example-psoc6-qspi-fram-access
  VERSION 1.0.0
)
psoc6_add_executable(
  SOURCES
    ${APP_DIR}/main.c
    ${APP_DIR}/serial_fram_api.h
    ${APP_DIR}/serial_fram_api.c
  LINK_LIBRARIES
    psoc6hal
    retarget-io
)
