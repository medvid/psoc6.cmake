# https://github.com/cypresssemiconductorco/mtb-example-psoc6-emwin-eink-freertos#supported-kits
psoc6_check_bsp(
  CY8CKIT-062-BLE
  CY8CKIT-062-WIFI-BT
  CY8CKIT-062S2-43012
  CYW9P62S1-43438EVB-01
  CYW9P62S1-43012EVB-01
  CY8CKIT-064B0S2-4343W
)

project(emwin-eink-freertos)

psoc6_load_application(
  NAME mtb-example-psoc6-emwin-eink-freertos
  VERSION 2.0.0
)
psoc6_add_executable(
  SOURCES
    ${APP_DIR}/source/CypressLogo.c
    ${APP_DIR}/source/eink_task.h
    ${APP_DIR}/source/eink_task.c
    ${APP_DIR}/source/main.c
    ${APP_DIR}/source/images.h
  LINK_LIBRARIES
    emwin-osts
    mtb-hal-cat1
    retarget-io
    freertos
    CY8CKIT-028-EPD
)
