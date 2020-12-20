psoc6_load_library(
  NAME lpa
  VERSION 3.0.0
)

set(LPA_SOURCES
  ${LPA_DIR}/include/cy_lpa_compat.h
  ${LPA_DIR}/include/cy_lpa_wifi_arp_ol.h
  ${LPA_DIR}/include/cy_lpa_wifi_ol.h
  ${LPA_DIR}/include/cy_lpa_wifi_ol_common.h
  ${LPA_DIR}/include/cy_lpa_wifi_ol_debug.h
  ${LPA_DIR}/include/cy_lpa_wifi_olm.h
  ${LPA_DIR}/include/cy_lpa_wifi_pf_ol.h
  ${LPA_DIR}/include/cy_lpa_wifi_result.h
  ${LPA_DIR}/include/cy_lpa_wifi_tko_ol.h
  ${LPA_DIR}/include/cy_whd_tko_api.h
  ${LPA_DIR}/source/cy_lpa_wifi_arp_ol.c
  ${LPA_DIR}/source/cy_lpa_wifi_ol_priv.h
  ${LPA_DIR}/source/cy_lpa_wifi_olm.c
  ${LPA_DIR}/source/cy_lpa_wifi_pf_ol.c
  ${LPA_DIR}/source/cy_lpa_wifi_tko_ol.c
  ${LPA_DIR}/source/cy_whd_stubs.c
  ${LPA_DIR}/source/cy_whd_tko_api.c
  ${LPA_DIR}/helpers/net_activity/network_activity_handler.h
  ${LPA_DIR}/helpers/net_activity/COMPONENT_SECURE_SOCKETS/ip4string.h
  ${LPA_DIR}/helpers/net_activity/COMPONENT_SECURE_SOCKETS/ip4string.c
  ${LPA_DIR}/helpers/net_activity/COMPONENT_SECURE_SOCKETS/network_activity_handler.c
  ${LPA_DIR}/target/cy_nw_lpa_helper.h
  ${LPA_DIR}/target/COMPONENT_WCM/cy_nw_lpa_helper.c
  ${LPA_DIR}/target/COMPONENT_WCM/cy_OlmInterface.h
  ${LPA_DIR}/target/COMPONENT_WCM/cy_OlmInterface.c
)
set(LPA_INCLUDE_DIRS
  ${LPA_DIR}/include
  ${LPA_DIR}/source
  ${LPA_DIR}/helpers/net_activity
  ${LPA_DIR}/helpers/net_activity/COMPONENT_SECURE_SOCKETS
  ${LPA_DIR}/target
  ${LPA_DIR}/target/COMPONENT_WCM
)
set(LPA_LINK_LIBRARIES
  connectivity-utilities
  wifi-mw-core
  wifi-connection-manager
)

add_library(lpa STATIC EXCLUDE_FROM_ALL ${LPA_SOURCES})
target_include_directories(lpa PUBLIC ${LPA_INCLUDE_DIRS})
target_link_libraries(lpa PUBLIC ${LPA_LINK_LIBRARIES})

# BUG: cy_lpa_wifi_tko_ol.c includes prot/ip.h
target_include_directories(lpa PRIVATE ${LWIP_DIR}/src/include/lwip)
