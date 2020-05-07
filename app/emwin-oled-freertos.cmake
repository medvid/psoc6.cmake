# https://github.com/cypresssemiconductorco/mtb-example-psoc6-emwin-oled-freertos#supported-kits
psoc6_check_bsp(
  CY8CKIT-062-BLE
  CY8CKIT-062-WIFI-BT
)

project(emwin-oled-freertos)

psoc6_load_application(
  NAME mtb-example-psoc6-emwin-oled-freertos
  VERSION 1.1.0
)
psoc6_add_executable(
  SOURCES
    ${APP_DIR}/source/main.c
    ${APP_DIR}/source/Cypress_Logo_1bpp.c
    ${APP_DIR}/source/i2c_portapi.h
    ${APP_DIR}/source/i2c_portapi.c
    ${APP_DIR}/source/oledTask.h
    ${APP_DIR}/source/oledTask.c
    ${APP_DIR}/emwin_config/GUI_X_FreeRTOS.c
    ${APP_DIR}/emwin_config/GUIConf.c
    ${APP_DIR}/emwin_config/LCDConf.h
    ${APP_DIR}/emwin_config/LCDConf.c
  INCLUDE_DIRS
    ${APP_DIR}/source
    ${APP_DIR}/emwin_config
  LINK_LIBRARIES
    emwin-osts
    psoc6hal
    retarget-io
    freertos
)
