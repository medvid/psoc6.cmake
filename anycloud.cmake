# AnyCloud requires either 43012 or 4343W module to be present on board
if(NOT 4343W IN_LIST COMPONENTS AND NOT 43012 IN_LIST COMPONENTS)
  return()
endif()

# Load library definitions
include(lib/wifi-host-driver.cmake)
include(lib/whd-bsp-integration.cmake)
include(lib/mbedtls.cmake)
include(lib/lwip.cmake)
include(lib/connectivity-utilities.cmake)
include(lib/secure-sockets.cmake)
include(lib/wifi-mw-core.cmake)
include(lib/wifi-connection-manager.cmake)
include(lib/lpa.cmake)
include(lib/aws-iot.cmake)
include(lib/mqtt.cmake)
include(lib/mcuboot.cmake)
include(lib/anycloud-ota.cmake)
# BUG: accelerated versions are incompatible with the selected mbedtls version
#include(lib/cy-mbedtls-acceleration.cmake)
include(lib/btstack.cmake)
include(lib/bluetooth-freertos.cmake)

# Load application definitions
include(app/anycloud-mqtt-client.cmake)
include(app/anycloud-offload-tcp-keepalive.cmake)
#include(app/anycloud-ota-mqtt.cmake)
include(app/anycloud-secure-tcp-client.cmake)
include(app/anycloud-secure-tcp-server.cmake)
include(app/anycloud-tcp-client.cmake)
include(app/anycloud-tcp-server.cmake)
include(app/anycloud-wlan-lowpower.cmake)
include(app/anycloud-wifi-scan.cmake)
include(app/anycloud-ble-battery-server.cmake)
include(app/anycloud-ble-ess.cmake)
include(app/anycloud-ble-multi-beacon.cmake)
include(app/anycloud-ble-wifi-onboarding.cmake)

# CY8CPROTO-062-4343W board shares the same GPIO for the user button (USER BTN1)
# and the CYW4343W host wake up pin. Since some examples use the GPIO for
# interfacing with the user button, the SDIO interrupt to wake up the host is
# disabled by setting CY_WIFI_HOST_WAKE_SW_FORCE to '0'.
if(${BSP_NAME} STREQUAL CY8CPROTO-062-4343W)
  target_compile_definitions(whd-bsp-integration PUBLIC CY_WIFI_HOST_WAKE_SW_FORCE=0)
endif()

# AnyCloud debugging
#target_compile_definitions(secure-sockets PUBLIC TLS_ENABLE_PRINT_LIBRARY_DEBUG)
