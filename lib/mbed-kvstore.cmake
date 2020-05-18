set(MBED_KVSTORE_DIR ${MBED_OS_DIR}/features/storage/kvstore)
set(MBED_KVSTORE_SOURCES
  ${MBED_KVSTORE_DIR}/include/KVStore.h
  ${MBED_KVSTORE_DIR}/conf/kv_config.h
  ${MBED_KVSTORE_DIR}/conf/kv_config.cpp
  ${MBED_KVSTORE_DIR}/direct_access_devicekey/DirectAccessDevicekey.h
  ${MBED_KVSTORE_DIR}/direct_access_devicekey/DirectAccessDevicekey.cpp
  ${MBED_KVSTORE_DIR}/filesystemstore/FileSystemStore.h
  ${MBED_KVSTORE_DIR}/filesystemstore/FileSystemStore.cpp
  ${MBED_KVSTORE_DIR}/global_api/kvstore_global_api.h
  ${MBED_KVSTORE_DIR}/global_api/kvstore_global_api.cpp
  ${MBED_KVSTORE_DIR}/kv_map/KVMap.h
  ${MBED_KVSTORE_DIR}/kv_map/KVMap.cpp
  ${MBED_KVSTORE_DIR}/securestore/SecureStore.h
  ${MBED_KVSTORE_DIR}/securestore/SecureStore.cpp
  ${MBED_KVSTORE_DIR}/tdbstore/TDBStore.h
  ${MBED_KVSTORE_DIR}/tdbstore/TDBStore.cpp
)
set(MBED_KVSTORE_INCLUDE_DIRS
  ${MBED_KVSTORE_DIR}/conf
  ${MBED_KVSTORE_DIR}/include
  ${MBED_KVSTORE_DIR}/kv_map
  ${MBED_KVSTORE_DIR}/tdbstore
)
set(MBED_KVSTORE_DEFINES
  MBED_CONF_STORAGE_STORAGE_TYPE=default
  # Size of the FlashIAP block device.
  # Default size will be the larger of the last 2 sectors or last 14 pages of flash.
  MBED_CONF_STORAGE_TDB_INTERNAL_INTERNAL_SIZE=0x10000
  # If default, the base address is set to INTERNAL_SIZE bytes before the end of flash.
  MBED_CONF_STORAGE_TDB_INTERNAL_INTERNAL_BASE_ADDRESS=0
)
set(MBED_KVSTORE_LINK_LIBRARIES
  mbed-blockdevice
  mbed-tls
  mbed-trace
  mbed-littlefs
  mbed-fatfs
  mbed-flashiap
)

add_library(mbed-kvstore STATIC EXCLUDE_FROM_ALL ${MBED_KVSTORE_SOURCES})
target_include_directories(mbed-kvstore PUBLIC ${MBED_KVSTORE_INCLUDE_DIRS})
target_compile_definitions(mbed-kvstore PUBLIC ${MBED_KVSTORE_DEFINES})
target_link_libraries(mbed-kvstore PUBLIC ${MBED_KVSTORE_LINK_LIBRARIES})
