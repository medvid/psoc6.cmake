# resource_map.h depends on BSP-specific macros
# https://github.com/cypresssemiconductorco/mtb-example-psoc6-spi-master#supported-kits
psoc6_check_bsp(
  CY8CKIT-062-BLE
  CY8CKIT-062-WIFI-BT
  CY8CKIT-062S2-43012
  CY8CPROTO-062-4343W
  CY8CPROTO-062S3-4343W
  CY8CPROTO-063-BLE
  CYW9P62S1-43012EVB-01
  CYW9P62S1-43438EVB-01
)

project(spi-master)

psoc6_load_application(
  NAME mtb-example-psoc6-spi-master
  VERSION 2.0.0
)
psoc6_add_executable(
  SOURCES
    ${APP_DIR}/app_config.h
    ${APP_DIR}/main.c
    ${APP_DIR}/resource_map.h
  LINK_LIBRARIES
    mtb-hal-cat1
    retarget-io
)
