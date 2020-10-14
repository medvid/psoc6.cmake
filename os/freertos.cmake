set(PORT_DIR ${CMAKE_SOURCE_DIR}/os/freertos)

# FreeRTOSConfig.h is included globally
include_directories(${PORT_DIR})

# Load library definitions
include(lib/freertos.cmake)
include(lib/clib-support.cmake)
include(lib/abstraction-rtos.cmake)

# Enable RTOS awareness in the HAL and BSP libraries
add_definitions(-DCY_RTOS_AWARE)
# Cannot link against abstraction-rtos directly to avoid circular dependencies:
# cycfg.h -> mtb-hal-cat1 -> abstraction-rtos -> cyabs_freertos_helpers.c -> cycfg.h
target_include_directories(mtb-hal-cat1 PRIVATE
  ${ABSTRACTION_RTOS_INCLUDE_DIRS}
  ${FREERTOS_INCLUDE_DIRS}
)
if(TARGET udb-sdio-whd)
  target_include_directories(udb-sdio-whd PRIVATE
    ${ABSTRACTION_RTOS_INCLUDE_DIRS}
    ${FREERTOS_INCLUDE_DIRS}
  )
endif()
target_link_libraries(retarget-io PRIVATE abstraction-rtos)
target_link_libraries(freertos PRIVATE abstraction-rtos)

target_sources(freertos PRIVATE ${PORT_DIR}/hooks.c)
target_link_libraries(bsp PUBLIC freertos clib-support abstraction-rtos)

# Load application definitions
include(app/ble-battery-level-freertos.cmake)
# BUG: include <stdbool.h> missing
# include(app/ble-throughput-freertos.cmake)
# FIXME: CMake cannot fetch this example
include(app/capsense-buttons-slider-freertos.cmake)
include(app/emwin-eink-freertos.cmake)
include(app/emwin-oled-freertos.cmake)
include(app/usb-audio-device-freertos.cmake)

# Load AnyCloud definitions
include(anycloud.cmake)
