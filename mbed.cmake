# Declare CMake cache variables for WiFi SSID, password and security
set_property(CACHE TOOLCHAIN PROPERTY STRINGS GCC ARM IAR)
set(WIFI_SSID "SSID" CACHE STRING "WiFi SSID")
set(WIFI_PASSWORD "PASSWORD" CACHE STRING "WiFi Password")
set(WIFI_SECURITY "WPA2" CACHE STRING "WiFi Security Protocol")
set_property(CACHE WIFI_SECURITY PROPERTY STRINGS WEP WPA WPA2)

# Load library definitions
if(4343W IN_LIST COMPONENTS OR 43012 IN_LIST COMPONENTS)
  include(lib/wifi-host-driver.cmake)
  include(lib/whd-bsp-integration.cmake)
endif()

# Load Mbed OS library definitions
include(lib/mbed-os.cmake)

# Provide custom cy_toolchain_init to integrate BSP startup with RTOS init hooks
target_sources(bsp PRIVATE ${PORT_DIR}/cy_toolchain_init.c)

# Load Mbed OS application definitions
include(app/mbed-attestation.cmake)
include(app/mbed-blinky.cmake)
include(app/mbed-crash-reporting.cmake)
include(app/mbed-crypto.cmake)
#include(app/mbed-error-handling.cmake)
include(app/mbed-kvstore.cmake)
include(app/mbed-sys-info.cmake)
include(app/mbed-tls.cmake)
include(app/mbed-wifi.cmake)

# Load Mbed OS Greentea tests
include(test/mbed-tests.cmake)
