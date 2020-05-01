psoc6_check_bsp(CY8CKIT-062-BLE CY8CKIT-062-WIFI-BT)

project(i2s)

psoc6_load_application(
  NAME mtb-example-psoc6-i2s
  VERSION 1.0.0
)
psoc6_add_executable(
  SOURCES
    ${APP_DIR}/main.c
    ${APP_DIR}/ak4954a.h
    ${APP_DIR}/ak4954a.c
    ${APP_DIR}/wave.h
    ${APP_DIR}/wave.c
  LINK_LIBRARIES
    psoc6hal
  DESIGN_MODUS
    ${APP_DIR}/COMPONENT_CUSTOM_DESIGN_MODUS/TARGET_${BSP_NAME}/design.modus
)
