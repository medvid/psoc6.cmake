set(MBED_FLASHIAP_DIR ${MBED_OS_DIR}/components/storage/blockdevice/COMPONENT_FLASHIAP)
set(MBED_FLASHIAP_SOURCES
  ${MBED_FLASHIAP_DIR}/FlashIAPBlockDevice.h
  ${MBED_FLASHIAP_DIR}/FlashIAPBlockDevice.cpp
  ${MBED_FLASHIAP_DIR}/COMMON/fslittle_debug.h
  ${MBED_FLASHIAP_DIR}/COMMON/fslittle_test.h
  ${MBED_FLASHIAP_DIR}/COMMON/fslittle_test.c
)
set(MBED_FLASHIAP_INCLUDE_DIRS
  ${MBED_FLASHIAP_DIR}
)
set(MBED_FLASHIAP_DEFINES
  COMPONENT_FLASHIAP
  # Base address for the block device on the external flash.
  MBED_CONF_FLASHIAP_BLOCK_DEVICE_BASE_ADDRESS=0xFFFFFFFF
  # Memory allocated for block device.
  MBED_CONF_FLASHIAP_BLOCK_DEVICE_SIZE=0
)
set(MBED_FLASHIAP_LINK_LIBRARIES
  mbed-drivers
)

add_library(mbed-flashiap STATIC EXCLUDE_FROM_ALL ${MBED_FLASHIAP_SOURCES})
target_include_directories(mbed-flashiap PUBLIC ${MBED_FLASHIAP_INCLUDE_DIRS})
target_compile_definitions(mbed-flashiap PUBLIC ${MBED_FLASHIAP_DEFINES})
target_link_libraries(mbed-flashiap PUBLIC ${MBED_FLASHIAP_LINK_LIBRARIES})
