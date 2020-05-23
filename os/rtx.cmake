set(PORT_DIR ${CMAKE_SOURCE_DIR}/os/rtx)

# RTE_Components.h is included globally
include_directories(${PORT_DIR})

# Enable RTOS awareness in the HAL and BSP libraries
add_definitions(-DCY_RTOS_AWARE)
target_link_libraries(psoc6hal PRIVATE abstraction-rtos)
target_link_libraries(retarget-io PRIVATE abstraction-rtos)
if(TARGET udb-sdio-whd)
  target_link_libraries(udb-sdio-whd PRIVATE abstraction-rtos)
endif()

# Load library definitions
include(lib/cmsis-rtos2.cmake)
include(lib/cmsis-rtx.cmake)
include(lib/abstraction-rtos.cmake)

# Load Mbed OS libraries, applications and tests
include(mbed.cmake)
