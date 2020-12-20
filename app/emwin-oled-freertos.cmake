# https://github.com/cypresssemiconductorco/mtb-example-psoc6-emwin-oled-freertos#supported-kits
psoc6_check_bsp(
  CY8CKIT-062-BLE
  CY8CKIT-062-WIFI-BT
  CY8CKIT-062S2-43012
  CYW9P62S1-43438EVB-01
  CYW9P62S1-43012EVB-01
  CY8CKIT-064B0S2-4343W
)

project(emwin-oled-freertos)

psoc6_load_application(
  NAME mtb-example-psoc6-emwin-oled-freertos
  VERSION 2.0.0
)
psoc6_add_executable(
  SOURCES
    ${APP_DIR}/source/Cypress_Logo.c
    ${APP_DIR}/source/images.h
    ${APP_DIR}/source/main.c
    ${APP_DIR}/source/oledTask.h
    ${APP_DIR}/source/oledTask.c
  INCLUDE_DIRS
    ${APP_DIR}/source
    ${APP_DIR}/emwin_config
  LINK_LIBRARIES
    emwin-osts
    mtb-hal-cat1
    retarget-io
    freertos
    CY8CKIT-032
)
# TODO: move to display-oled-ssd1306.cmake
target_link_libraries(display-oled-ssd1306 PRIVATE emwin-osts)