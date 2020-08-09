# https://github.com/cypresssemiconductorco/mtb-example-psoc6-emwin-eink-freertos#supported-kits
psoc6_check_bsp(
  CY8CKIT-062-BLE
  CY8CKIT-062-WIFI-BT
)

project(emwin-eink-freertos)

psoc6_load_application(
  NAME mtb-example-psoc6-emwin-eink-freertos
  VERSION 1.2.0
)
psoc6_add_executable(
  SOURCES
    ${APP_DIR}/source/main.c
    ${APP_DIR}/source/CypressLogo.c
    ${APP_DIR}/source/eink_task.h
    ${APP_DIR}/source/eink_task.c
    ${APP_DIR}/source/images.h
    ${APP_DIR}/eInk_Library/cy_eink_fonts.h
    ${APP_DIR}/eInk_Library/cy_eink_library.h
    ${APP_DIR}/eInk_Library/cy_eink_library.c
    ${APP_DIR}/eInk_Library/cy_eink_psoc_interface.h
    ${APP_DIR}/eInk_Library/cy_eink_psoc_interface.c
    ${APP_DIR}/eInk_Library/pervasive_eink_configuration.h
    ${APP_DIR}/eInk_Library/pervasive_eink_hardware_driver.h
    ${APP_DIR}/eInk_Library/pervasive_eink_hardware_driver_part1.c
    ${APP_DIR}/eInk_Library/pervasive_eink_hardware_driver_part2.c
    ${APP_DIR}/emwin_config/GUI_X_FreeRTOS.c
    ${APP_DIR}/emwin_config/GUIConf.c
    ${APP_DIR}/emwin_config/LCDConf.h
    ${APP_DIR}/emwin_config/LCDConf.c
  INCLUDE_DIRS
    ${APP_DIR}
    ${APP_DIR}/eInk_Library
    ${APP_DIR}/emwin_config
  LINK_LIBRARIES
    emwin-osts
    psoc6hal
    retarget-io
    freertos
)
