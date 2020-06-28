psoc6_load_library(
  NAME wifi-connection-manager
  VERSION 1.1.0
)

set(WIFI_CONNECTION_MANAGER_SOURCES
  ${WIFI_CONNECTION_MANAGER_DIR}/include/cy_wcm.h
  ${WIFI_CONNECTION_MANAGER_DIR}/include/cy_wcm_error.h
  ${WIFI_CONNECTION_MANAGER_DIR}/include/cy_wcm_log.h
  ${WIFI_CONNECTION_MANAGER_DIR}/source/nn.h
  ${WIFI_CONNECTION_MANAGER_DIR}/source/nn.c
  ${WIFI_CONNECTION_MANAGER_DIR}/source/cy_wcm_wps.c
  ${WIFI_CONNECTION_MANAGER_DIR}/source/cy_wps_memory.h
  ${WIFI_CONNECTION_MANAGER_DIR}/source/WPS/cy_eapol.c
  ${WIFI_CONNECTION_MANAGER_DIR}/source/WPS/cy_wps.c
  ${WIFI_CONNECTION_MANAGER_DIR}/source/WPS/cy_wps_common.c
  ${WIFI_CONNECTION_MANAGER_DIR}/source/WPS/cy_wps_enrollee.c
  ${WIFI_CONNECTION_MANAGER_DIR}/source/WPS/include/cy_eapol.h
  ${WIFI_CONNECTION_MANAGER_DIR}/source/WPS/include/cy_template_wps_packets.h
  ${WIFI_CONNECTION_MANAGER_DIR}/source/WPS/include/cy_wps.h
  ${WIFI_CONNECTION_MANAGER_DIR}/source/WPS/include/cy_wps_common.h
  ${WIFI_CONNECTION_MANAGER_DIR}/source/WPS/include/cy_wps_constants.h
  ${WIFI_CONNECTION_MANAGER_DIR}/source/WPS/include/cy_wps_result.h
  ${WIFI_CONNECTION_MANAGER_DIR}/source/WPS/include/cy_wps_structures.h
  ${WIFI_CONNECTION_MANAGER_DIR}/source/WPS/include/wps_helper_utility.h
  ${WIFI_CONNECTION_MANAGER_DIR}/source/Utilities/TLV/tlv.h
  ${WIFI_CONNECTION_MANAGER_DIR}/source/Utilities/TLV/tlv.c
  ${WIFI_CONNECTION_MANAGER_DIR}/source/COMPONENT_LWIP/cy_wcm.c
  ${WIFI_CONNECTION_MANAGER_DIR}/source/COMPONENT_MBEDTLS/cy_wps_aes_ctr_ccm.c
  ${WIFI_CONNECTION_MANAGER_DIR}/source/COMPONENT_MBEDTLS/cy_wps_crypto.h
  ${WIFI_CONNECTION_MANAGER_DIR}/source/COMPONENT_MBEDTLS/cy_wps_crypto.c
)
set(WIFI_CONNECTION_MANAGER_INCLUDE_DIRS
  ${WIFI_CONNECTION_MANAGER_DIR}
  ${WIFI_CONNECTION_MANAGER_DIR}/include
  ${WIFI_CONNECTION_MANAGER_DIR}/source
  ${WIFI_CONNECTION_MANAGER_DIR}/source/WPS/include
  ${WIFI_CONNECTION_MANAGER_DIR}/source/Utilities/TLV
  ${WIFI_CONNECTION_MANAGER_DIR}/source/COMPONENT_MBEDTLS
)
set(WIFI_CONNECTION_MANAGER_LIBRARIES
  psoc6hal
  abstraction-rtos
  wifi-host-driver
  whd-bsp-integration
  lwip
  mbedtls
  connectivity-utilities
  wifi-mw-core
)

if(43012 IN_LIST COMPONENTS)
  list(APPEND WIFI_CONNECTION_MANAGER_SOURCES
    ${WIFI_CONNECTION_MANAGER_DIR}/source/COMPONENT_43012/cy_chip_constants.h
  )
  list(APPEND WIFI_CONNECTION_MANAGER_INCLUDE_DIRS
    ${WIFI_CONNECTION_MANAGER_DIR}/source/COMPONENT_43012
  )
elseif(4343W IN_LIST COMPONENTS)
  list(APPEND WIFI_CONNECTION_MANAGER_SOURCES
    ${WIFI_CONNECTION_MANAGER_DIR}/source/COMPONENT_4343W/cy_chip_constants.h
  )
  list(APPEND WIFI_CONNECTION_MANAGER_INCLUDE_DIRS
    ${WIFI_CONNECTION_MANAGER_DIR}/source/COMPONENT_4343W
  )
else()
  message(FATAL_ERROR "wifi-connection-manager: COMPONENTS should include either 43012 or 4343W.")
endif()

add_library(wifi-connection-manager STATIC ${WIFI_CONNECTION_MANAGER_SOURCES})
target_include_directories(wifi-connection-manager PUBLIC ${WIFI_CONNECTION_MANAGER_INCLUDE_DIRS})
target_link_libraries(wifi-connection-manager PUBLIC ${WIFI_CONNECTION_MANAGER_LIBRARIES})
