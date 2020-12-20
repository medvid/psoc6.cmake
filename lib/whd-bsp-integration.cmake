psoc6_load_library(
  NAME whd-bsp-integration
  VERSION 1.1.1
)

set(WHD_BSP_INTEGRATION_SOURCES
  ${WHD_BSP_INTEGRATION_DIR}/cy_network_buffer.h
  ${WHD_BSP_INTEGRATION_DIR}/cy_network_buffer.c
  ${WHD_BSP_INTEGRATION_DIR}/cy_wifi_fw_section.h
  ${WHD_BSP_INTEGRATION_DIR}/cybsp_wifi.h
  ${WHD_BSP_INTEGRATION_DIR}/cybsp_wifi.c
)
set(WHD_BSP_INTEGRATION_INCLUDE_DIRS
  ${WHD_BSP_INTEGRATION_DIR}
  ${BSP_GENERATED_SOURCE_DIR}
)
set(WHD_BSP_INTEGRATION_LIBRARIES
  wifi-host-driver
)

add_library(whd-bsp-integration STATIC ${WHD_BSP_INTEGRATION_SOURCES})
target_include_directories(whd-bsp-integration PUBLIC ${WHD_BSP_INTEGRATION_INCLUDE_DIRS})
target_link_libraries(whd-bsp-integration PUBLIC ${WHD_BSP_INTEGRATION_LIBRARIES})

# cy_network_buffer.c includes lwIP headers
if(${OS} STREQUAL RTX) # Mbed OS
  target_include_directories(whd-bsp-integration
    PRIVATE
      ${MBED_OS_DIR}/connectivity/lwipstack/lwip-sys
      ${MBED_OS_DIR}/connectivity/lwipstack/include/lwipstack
      ${MBED_OS_DIR}/connectivity/lwipstack/lwip/src/include
  )
  target_link_libraries(whd-bsp-integration PRIVATE mbed-os)
else() # AnyCloud
  target_link_libraries(whd-bsp-integration PRIVATE lwip)
endif()

# CY8CPROTO-062-4343W board shares the same GPIO for the user button (USER BTN1)
# and the CYW4343W host wake up pin. Since some examples use the GPIO for
# interfacing with the user button, the SDIO interrupt to wake up the host is
# disabled by setting CY_WIFI_HOST_WAKE_SW_FORCE to '0'.
if(${BSP_NAME} STREQUAL CY8CPROTO-062-4343W)
  target_compile_definitions(whd-bsp-integration PUBLIC CY_WIFI_HOST_WAKE_SW_FORCE=0)
endif()
