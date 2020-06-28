psoc6_load_library(
  NAME whd-bsp-integration
  VERSION 1.0.2
)

set(WHD_BSP_INTEGRATION_SOURCES
  ${WHD_BSP_INTEGRATION_DIR}/cy_network_buffer.h
  ${WHD_BSP_INTEGRATION_DIR}/cy_network_buffer.c
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
