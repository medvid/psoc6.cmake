psoc6_load_library(
  NAME wifi-host-driver
  VERSION 1.90.2
)

set(WIFI_HOST_DRIVER_SOURCES
  ${WIFI_HOST_DRIVER_DIR}/WiFi_Host_Driver/inc/whd.h
  ${WIFI_HOST_DRIVER_DIR}/WiFi_Host_Driver/inc/whd_events.h
  ${WIFI_HOST_DRIVER_DIR}/WiFi_Host_Driver/inc/whd_network_types.h
  ${WIFI_HOST_DRIVER_DIR}/WiFi_Host_Driver/inc/whd_resource_api.h
  ${WIFI_HOST_DRIVER_DIR}/WiFi_Host_Driver/inc/whd_types.h
  ${WIFI_HOST_DRIVER_DIR}/WiFi_Host_Driver/inc/whd_version.h
  ${WIFI_HOST_DRIVER_DIR}/WiFi_Host_Driver/inc/whd_wifi_api.h
  ${WIFI_HOST_DRIVER_DIR}/WiFi_Host_Driver/src/whd_ap.c
  ${WIFI_HOST_DRIVER_DIR}/WiFi_Host_Driver/src/whd_buffer_api.c
  ${WIFI_HOST_DRIVER_DIR}/WiFi_Host_Driver/src/whd_cdc_bdc.c
  ${WIFI_HOST_DRIVER_DIR}/WiFi_Host_Driver/src/whd_chip.c
  ${WIFI_HOST_DRIVER_DIR}/WiFi_Host_Driver/src/whd_chip_constants.c
  ${WIFI_HOST_DRIVER_DIR}/WiFi_Host_Driver/src/whd_clm.c
  ${WIFI_HOST_DRIVER_DIR}/WiFi_Host_Driver/src/whd_debug.c
  ${WIFI_HOST_DRIVER_DIR}/WiFi_Host_Driver/src/whd_events.c
  ${WIFI_HOST_DRIVER_DIR}/WiFi_Host_Driver/src/whd_logging.c
  ${WIFI_HOST_DRIVER_DIR}/WiFi_Host_Driver/src/whd_management.c
  ${WIFI_HOST_DRIVER_DIR}/WiFi_Host_Driver/src/whd_network_if.c
  ${WIFI_HOST_DRIVER_DIR}/WiFi_Host_Driver/src/whd_resource_if.c
  ${WIFI_HOST_DRIVER_DIR}/WiFi_Host_Driver/src/whd_sdpcm.c
  ${WIFI_HOST_DRIVER_DIR}/WiFi_Host_Driver/src/whd_thread.c
  ${WIFI_HOST_DRIVER_DIR}/WiFi_Host_Driver/src/whd_utils.c
  ${WIFI_HOST_DRIVER_DIR}/WiFi_Host_Driver/src/whd_wifi.c
  ${WIFI_HOST_DRIVER_DIR}/WiFi_Host_Driver/src/whd_wifi_api.c
  ${WIFI_HOST_DRIVER_DIR}/WiFi_Host_Driver/src/whd_wifi_p2p.c
  ${WIFI_HOST_DRIVER_DIR}/WiFi_Host_Driver/src/bus_protocols/whd_bus.h
  ${WIFI_HOST_DRIVER_DIR}/WiFi_Host_Driver/src/bus_protocols/whd_bus.c
  ${WIFI_HOST_DRIVER_DIR}/WiFi_Host_Driver/src/bus_protocols/whd_bus_common.h
  ${WIFI_HOST_DRIVER_DIR}/WiFi_Host_Driver/src/bus_protocols/whd_bus_common.c
  ${WIFI_HOST_DRIVER_DIR}/WiFi_Host_Driver/src/bus_protocols/whd_bus_protocol_interface.h
  ${WIFI_HOST_DRIVER_DIR}/WiFi_Host_Driver/src/bus_protocols/whd_bus_sdio_protocol.h
  ${WIFI_HOST_DRIVER_DIR}/WiFi_Host_Driver/src/bus_protocols/whd_bus_sdio_protocol.c
  ${WIFI_HOST_DRIVER_DIR}/WiFi_Host_Driver/src/bus_protocols/whd_bus_spi_protocol.h
  ${WIFI_HOST_DRIVER_DIR}/WiFi_Host_Driver/src/bus_protocols/whd_bus_spi_protocol.c
  ${WIFI_HOST_DRIVER_DIR}/WiFi_Host_Driver/src/bus_protocols/whd_chip_reg.h
  ${WIFI_HOST_DRIVER_DIR}/WiFi_Host_Driver/src/bus_protocols/whd_sdio.h
  ${WIFI_HOST_DRIVER_DIR}/WiFi_Host_Driver/src/bus_protocols/whd_spi.h
  ${WIFI_HOST_DRIVER_DIR}/WiFi_Host_Driver/src/include/whd_ap.h
  ${WIFI_HOST_DRIVER_DIR}/WiFi_Host_Driver/src/include/whd_buffer_api.h
  ${WIFI_HOST_DRIVER_DIR}/WiFi_Host_Driver/src/include/whd_cdc_bdc.h
  ${WIFI_HOST_DRIVER_DIR}/WiFi_Host_Driver/src/include/whd_chip.h
  ${WIFI_HOST_DRIVER_DIR}/WiFi_Host_Driver/src/include/whd_chip_constants.h
  ${WIFI_HOST_DRIVER_DIR}/WiFi_Host_Driver/src/include/whd_clm.h
  ${WIFI_HOST_DRIVER_DIR}/WiFi_Host_Driver/src/include/whd_debug.h
  ${WIFI_HOST_DRIVER_DIR}/WiFi_Host_Driver/src/include/whd_endian.h
  ${WIFI_HOST_DRIVER_DIR}/WiFi_Host_Driver/src/include/whd_events_int.h
  ${WIFI_HOST_DRIVER_DIR}/WiFi_Host_Driver/src/include/whd_int.h
  ${WIFI_HOST_DRIVER_DIR}/WiFi_Host_Driver/src/include/whd_network_if.h
  ${WIFI_HOST_DRIVER_DIR}/WiFi_Host_Driver/src/include/whd_poll.h
  ${WIFI_HOST_DRIVER_DIR}/WiFi_Host_Driver/src/include/whd_resource_if.h
  ${WIFI_HOST_DRIVER_DIR}/WiFi_Host_Driver/src/include/whd_sdpcm.h
  ${WIFI_HOST_DRIVER_DIR}/WiFi_Host_Driver/src/include/whd_thread.h
  ${WIFI_HOST_DRIVER_DIR}/WiFi_Host_Driver/src/include/whd_thread_internal.h
  ${WIFI_HOST_DRIVER_DIR}/WiFi_Host_Driver/src/include/whd_types_int.h
  ${WIFI_HOST_DRIVER_DIR}/WiFi_Host_Driver/src/include/whd_utils.h
  ${WIFI_HOST_DRIVER_DIR}/WiFi_Host_Driver/src/include/whd_wifi_p2p.h
  ${WIFI_HOST_DRIVER_DIR}/WiFi_Host_Driver/src/include/whd_wlioctl.h
  ${WIFI_HOST_DRIVER_DIR}/WiFi_Host_Driver/resources/resource_imp/wiced_resource.h
  ${WIFI_HOST_DRIVER_DIR}/WiFi_Host_Driver/resources/resource_imp/whd_resources.c
)
set(WIFI_HOST_DRIVER_INCLUDE_DIRS
  ${WIFI_HOST_DRIVER_DIR}/WiFi_Host_Driver/inc
  ${WIFI_HOST_DRIVER_DIR}/WiFi_Host_Driver/src
  ${WIFI_HOST_DRIVER_DIR}/WiFi_Host_Driver/src/include
  ${WIFI_HOST_DRIVER_DIR}/WiFi_Host_Driver/resources/resource_imp
  # FIXME: support custom wifi_nvram_image.h
  ${WIFI_HOST_DRIVER_DIR}/WiFi_Host_Driver/resources/nvram/TARGET_${MBED_BSP_NAME}
  # FIXME: copy generated_mac_address.txt to the BSP?
  ${WIFI_HOST_DRIVER_DIR}
)
set(WIFI_HOST_DRIVER_LIBRARIES
  core-lib
  psoc6hal
  abstraction-rtos
)

if(43012 IN_LIST COMPONENTS)
  list(APPEND WIFI_HOST_DRIVER_SOURCES
    ${WIFI_HOST_DRIVER_DIR}/WiFi_Host_Driver/resources/firmware/COMPONENT_43012/43012C0-mfgtest_bin.c
    ${WIFI_HOST_DRIVER_DIR}/WiFi_Host_Driver/resources/firmware/COMPONENT_43012/43012C0-mfgtest_clm_blob.c
    ${WIFI_HOST_DRIVER_DIR}/WiFi_Host_Driver/resources/firmware/COMPONENT_43012/43012C0_bin.c
    ${WIFI_HOST_DRIVER_DIR}/WiFi_Host_Driver/resources/firmware/COMPONENT_43012/43012C0_clm_blob.c
    ${WIFI_HOST_DRIVER_DIR}/WiFi_Host_Driver/resources/firmware/COMPONENT_43012/resources.h
  )
  list(APPEND WIFI_HOST_DRIVER_INCLUDE_DIRS
    ${WIFI_HOST_DRIVER_DIR}/WiFi_Host_Driver/resources/firmware/COMPONENT_43012
  )
elseif(43438 IN_LIST COMPONENTS)
  list(APPEND WIFI_HOST_DRIVER_SOURCES
    ${WIFI_HOST_DRIVER_DIR}/WiFi_Host_Driver/resources/firmware/COMPONENT_43438/43438A1-mfgtest_bin.c
    ${WIFI_HOST_DRIVER_DIR}/WiFi_Host_Driver/resources/firmware/COMPONENT_43438/43438A1-mfgtest_clm_blob.c
    ${WIFI_HOST_DRIVER_DIR}/WiFi_Host_Driver/resources/firmware/COMPONENT_43438/43438A1_bin.c
    ${WIFI_HOST_DRIVER_DIR}/WiFi_Host_Driver/resources/firmware/COMPONENT_43438/43438A1_clm_blob.c
    ${WIFI_HOST_DRIVER_DIR}/WiFi_Host_Driver/resources/firmware/COMPONENT_43438/resources.h
  )
  list(APPEND WIFI_HOST_DRIVER_INCLUDE_DIRS
    ${WIFI_HOST_DRIVER_DIR}/WiFi_Host_Driver/resources/firmware/COMPONENT_43438
  )
elseif(4343W IN_LIST COMPONENTS)
  list(APPEND WIFI_HOST_DRIVER_SOURCES
    ${WIFI_HOST_DRIVER_DIR}/WiFi_Host_Driver/resources/firmware/COMPONENT_4343W/4343WA1-mfgtest_bin.c
    ${WIFI_HOST_DRIVER_DIR}/WiFi_Host_Driver/resources/firmware/COMPONENT_4343W/4343WA1-mfgtest_clm_blob.c
    ${WIFI_HOST_DRIVER_DIR}/WiFi_Host_Driver/resources/firmware/COMPONENT_4343W/4343WA1_bin.c
    ${WIFI_HOST_DRIVER_DIR}/WiFi_Host_Driver/resources/firmware/COMPONENT_4343W/4343WA1_clm_blob.c
    ${WIFI_HOST_DRIVER_DIR}/WiFi_Host_Driver/resources/firmware/COMPONENT_4343W/resources.h
  )
  list(APPEND WIFI_HOST_DRIVER_INCLUDE_DIRS
    ${WIFI_HOST_DRIVER_DIR}/WiFi_Host_Driver/resources/firmware/COMPONENT_4343W
  )
else()
  message(FATAL_ERROR "wifi-host-driver: COMPONENTS should include either 43012, 43438 or 4343W.")
endif()

add_library(wifi-host-driver STATIC ${WIFI_HOST_DRIVER_SOURCES})
target_include_directories(wifi-host-driver PUBLIC ${WIFI_HOST_DRIVER_INCLUDE_DIRS})
target_link_libraries(wifi-host-driver PUBLIC ${WIFI_HOST_DRIVER_LIBRARIES})
