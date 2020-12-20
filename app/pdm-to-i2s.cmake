# https://github.com/cypresssemiconductorco/mtb-example-psoc6-pdm-to-i2s#supported-kits-make-variable-target
psoc6_check_bsp(
  CY8CPROTO-062-4343W
  CY8CKIT-062-WIFI-BT
  CY8CKIT-062-BLE
  CY8CKIT-062S2-43012
  CYW9P62S1-43438EVB-01
  CYW9P62S1-43012EVB-01
  CY8CKIT-064B0S2-4343W
)

project(pdm-to-i2s)

psoc6_load_application(
  NAME mtb-example-psoc6-pdm-to-i2s
  VERSION 2.0.0
)
psoc6_add_executable(
  SOURCES
    ${APP_DIR}/main.c
  LINK_LIBRARIES
    mtb-hal-cat1
    audio-codec-ak4954a
)
