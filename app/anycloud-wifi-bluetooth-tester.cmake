project(anycloud-wifi-bluetooth-tester)

psoc6_load_application(
  NAME mtb-anycloud-wifi-bluetooth-tester
  VERSION 1.0.0
)
psoc6_add_executable(
  SOURCES
    ${APP_DIR}/main.c
  LINK_LIBRARIES
    retarget-io
    wifi-mw-core
    command-console
    btstack-ble
    bluetooth-freertos
)
