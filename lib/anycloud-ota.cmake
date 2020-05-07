psoc6_load_library(
  NAME anycloud-ota
  VERSION 1.2.0
)

set(ANYCLOUD_OTA_SOURCES
  ${ANYCLOUD_OTA_DIR}/include/cy_ota_api.h
  ${ANYCLOUD_OTA_DIR}/include/cy_ota_defaults.h
  ${ANYCLOUD_OTA_DIR}/source/cy_ota_agent.c
  ${ANYCLOUD_OTA_DIR}/source/cy_ota_http.c
  ${ANYCLOUD_OTA_DIR}/source/cy_ota_internal.h
  ${ANYCLOUD_OTA_DIR}/source/cy_ota_mqtt.c
  ${ANYCLOUD_OTA_DIR}/source/cy_ota_sign_check.c
  ${ANYCLOUD_OTA_DIR}/source/cy_ota_storage.c
)
set(ANYCLOUD_OTA_INCLUDE_DIRS
  ${ANYCLOUD_OTA_DIR}/include
  ${CMAKE_SOURCE_DIR}/configs/ota
)
set(ANYCLOUD_OTA_LINK_LIBRARIES
  retarget-io
  wifi-connection-manager
  mqtt
  mcuboot
)

add_library(anycloud-ota STATIC EXCLUDE_FROM_ALL ${ANYCLOUD_OTA_SOURCES})
target_include_directories(anycloud-ota PUBLIC ${ANYCLOUD_OTA_INCLUDE_DIRS})
target_link_libraries(anycloud-ota PUBLIC ${ANYCLOUD_OTA_LINK_LIBRARIES})

# TODO: declare paths to custom linker scripts
