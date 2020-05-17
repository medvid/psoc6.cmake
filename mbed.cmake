# Load Mbed OS library definitions
include(lib/mbed-os.cmake)

# Provide custom cy_toolchain_init to integrate BSP startup with RTOS init hooks
target_sources(bsp PRIVATE ${PORT_DIR}/cy_toolchain_init.c)

# Load Mbed OS application definitions
include(app/mbed-blinky.cmake)
include(app/mbed-sys-info.cmake)
include(app/mbed-crypto.cmake)
include(app/mbed-attestation.cmake)
