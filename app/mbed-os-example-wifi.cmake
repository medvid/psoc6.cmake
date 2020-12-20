project(mbed-os-example-wifi)

psoc6_load_application(
  NAME mbed-os-example-wifi
  URL  https://github.com/ARMmbed/mbed-os-example-wifi
  TAG  mbed-os-6.6.0
)
psoc6_add_executable(
  SOURCES
    ${APP_DIR}/main.cpp
  DEFINES
    MBED_CONF_APP_WIFI_SSID="${WIFI_SSID}"
    MBED_CONF_APP_WIFI_PASSWORD="${WIFI_PASSWORD}"
  LINK_LIBRARIES
    mbed-os
)
