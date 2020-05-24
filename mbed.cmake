# Load library definitions
include(lib/wifi-host-driver.cmake)
include(lib/whd-bsp-integration.cmake)

# Load Mbed OS library definitions
include(lib/mbed-os.cmake)

# Provide custom cy_toolchain_init to integrate BSP startup with RTOS init hooks
target_sources(bsp PRIVATE ${PORT_DIR}/cy_toolchain_init.c)

# Load Mbed OS application definitions
include(app/mbed-blinky.cmake)
include(app/mbed-sys-info.cmake)
include(app/mbed-crash-reporting.cmake)
#include(app/mbed-error-handling.cmake)
include(app/mbed-crypto.cmake)
include(app/mbed-attestation.cmake)
include(app/mbed-tls.cmake)

# Load Mbed OS Greentea tests
include(test/mbed-tests.cmake)
