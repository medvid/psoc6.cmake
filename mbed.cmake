# Declare CMake cache variables for WiFi SSID, password and security
set(WIFI_SSID "SSID" CACHE STRING "WiFi SSID")
set(WIFI_PASSWORD "PASSWORD" CACHE STRING "WiFi Password")
set(WIFI_SECURITY "WPA2" CACHE STRING "WiFi Security Protocol")
set_property(CACHE WIFI_SECURITY PROPERTY STRINGS WEP WPA WPA2)

include(mbed_config.cmake)

# Load Mbed OS library definitions
include(lib/mbed-os.cmake)
if(WHD IN_LIST COMPONENTS)
  include(lib/wifi-host-driver.cmake)
  include(lib/whd-bsp-integration.cmake)
endif()

# Provide custom cy_toolchain_init to integrate BSP startup with RTOS init hooks
target_sources(bsp PRIVATE ${PORT_DIR}/cy_toolchain_init.c)

# RTX includes RTE_Components.h -> mbed_cmsis_conf.h and cmsis.h
target_include_directories(cmsis-rtos2
  PUBLIC
    ${MBED_OS_DIR}/cmsis/device
    ${MBED_OS_DIR}/cmsis/device/RTE/include
    ${MBED_OS_DIR}/targets/TARGET_Cypress/TARGET_PSOC6
)

# Load Mbed OS application definitions
include(app/mbed-os-example-attestation.cmake)
include(app/mbed-os-example-blinky.cmake)
include(app/mbed-os-example-crash-reporting.cmake)
include(app/mbed-os-example-error-handling.cmake)
include(app/mbed-os-example-kvstore.cmake)
include(app/mbed-os-example-mbed-crypto.cmake)
include(app/mbed-os-example-sys-info.cmake)
include(app/mbed-os-example-tls.cmake)
include(app/mbed-os-example-wifi.cmake)

# Load Mbed OS Greentea tests
include(test/mbed-tests.cmake)
