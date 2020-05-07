psoc6_load_library(
  NAME wifi-mw-core
  VERSION 2.0.0
)

set(WIFI_MW_CORE_SOURCES
  ${WIFI_MW_CORE_DIR}/lwip-whd-port/cy_lwip.h
  ${WIFI_MW_CORE_DIR}/lwip-whd-port/cy_lwip.c
  ${WIFI_MW_CORE_DIR}/lwip-whd-port/cy_lwip_debug.h
  ${WIFI_MW_CORE_DIR}/lwip-whd-port/cy_lwip_error.h
  ${WIFI_MW_CORE_DIR}/lwip-whd-port/arch/cc.h
  ${WIFI_MW_CORE_DIR}/lwip-whd-port/arch/sys_arch.h
  ${WIFI_MW_CORE_DIR}/lwip-whd-port/arch/sys_arch.c
)
set(WIFI_MW_CORE_INCLUDE_DIRS
  ${WIFI_MW_CORE_DIR}/lwip-whd-port
)
set(WIFI_MW_CORE_LIBRARIES
  wifi-host-driver
  mbedtls
  lwip
  abstraction-rtos
  whd-bsp-integration
  secure-sockets
)

add_library(wifi-mw-core STATIC ${WIFI_MW_CORE_SOURCES})
target_include_directories(wifi-mw-core PUBLIC ${WIFI_MW_CORE_INCLUDE_DIRS})
target_link_libraries(wifi-mw-core PUBLIC ${WIFI_MW_CORE_LIBRARIES})

# lwIP sources include wifi-mw-core/lwip-whd-port/arch/cc.h
target_include_directories(lwip PUBLIC ${WIFI_MW_CORE_INCLUDE_DIRS})
target_link_libraries(lwip PRIVATE wifi-mw-core)
