set(PORT_DIR ${CMAKE_SOURCE_DIR}/os/freertos)

# FreeRTOSConfig.h is included globally
include_directories(${PORT_DIR})

# Load library definitions
include(lib/freertos.cmake)
include(lib/clib-support.cmake)
include(lib/abstraction-rtos.cmake)

# Enable RTOS awareness in the HAL and BSP libraries
add_definitions(-DCY_RTOS_AWARE)
target_link_libraries(psoc6hal PRIVATE abstraction-rtos)
target_link_libraries(retarget-io PRIVATE abstraction-rtos)
target_link_libraries(freertos PRIVATE abstraction-rtos)
if(TARGET udb-sdio-whd)
  target_link_libraries(udb-sdio-whd PRIVATE abstraction-rtos)
endif()

target_sources(freertos PUBLIC ${PORT_DIR}/hooks.c)
target_link_libraries(bsp PUBLIC freertos clib-support abstraction-rtos)

# Load application definitions
include(app/ble-battery-level-freertos.cmake)
# BUG: include <stdbool.h> missing
# include(app/ble-throughput-freertos.cmake)
# FIXME: CMake cannot fetch this example
#include(app/capsense-buttons-slider-freertos.cmake)
include(app/emwin-eink-freertos.cmake)
include(app/emwin-oled-freertos.cmake)
# BUG: update custom design.modus to ECO-2.0
#include(app/usb-audio-device-freertos.cmake)

# Load AnyCloud definitions
include(anycloud.cmake)
