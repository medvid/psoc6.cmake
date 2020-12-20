if(NOT WHD IN_LIST COMPONENTS)
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
include(lib/command-console.cmake)

# Load application definitions
#include(app/anycloud-ota-mqtt.cmake)
include(app/anycloud-ble-capsense-buttons-slider.cmake)
include(app/anycloud-ble-cts-client.cmake)
include(app/anycloud-ble-cts-server.cmake)
include(app/anycloud-ble-battery-server.cmake)
include(app/anycloud-ble-ess.cmake)
include(app/anycloud-ble-findme.cmake)
include(app/anycloud-ble-multi-beacon.cmake)
include(app/anycloud-ble-wifi-onboarding.cmake)
include(app/anycloud-mqtt-client.cmake)
include(app/anycloud-offload-tcp-keepalive.cmake)
include(app/anycloud-secure-tcp-client.cmake)
include(app/anycloud-secure-tcp-server.cmake)
include(app/anycloud-tcp-client.cmake)
include(app/anycloud-tcp-server.cmake)
include(app/anycloud-udp-client.cmake)
include(app/anycloud-udp-server.cmake)
#include(app/anycloud-wifi-bluetooth-tester.cmake)
include(app/anycloud-wifi-scan.cmake)
include(app/anycloud-wlan-lowpower.cmake)
include(app/anycloud-wps-enrollee.cmake)

# AnyCloud debugging
#target_compile_definitions(secure-sockets PUBLIC TLS_ENABLE_PRINT_LIBRARY_DEBUG)
