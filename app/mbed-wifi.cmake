project(mbed-wifi)

psoc6_load_application(
  NAME mbed-os-example-wifi
  URL  https://github.com/ARMmbed/mbed-os-example-wifi
  # Using compatible WiFiInterface APIs from master
  TAG  2644ed4
)
psoc6_add_executable(
  NAME
    mbed-wifi
  SOURCES
    ${APP_DIR}/main.cpp
  DEFINES
    MBED_CONF_APP_WIFI_SSID="${WIFI_SSID}"
    MBED_CONF_APP_WIFI_PASSWORD="${WIFI_PASSWORD}"
  LINK_LIBRARIES
    mbed-target
    mbed-netsocket
    mbed-tls-platform
    mbed-whd-emac
)
