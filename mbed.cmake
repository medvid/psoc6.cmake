# Load Mbed OS library definitions
include(lib/mbed-os.cmake)

# Provide custom cy_toolchain_init to integrate BSP startup with RTOS init hooks
target_sources(bsp PRIVATE ${PORT_DIR}/cy_toolchain_init.c)

# Load Mbed OS application definitions
include(app/mbed-os-example-blinky.cmake)
