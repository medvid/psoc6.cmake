set(MBED_BLOCKDEVICE_DIR ${MBED_OS_DIR}/features/storage/blockdevice)
set(MBED_BLOCKDEVICE_SOURCES
  ${MBED_BLOCKDEVICE_DIR}/BlockDevice.h
  ${MBED_BLOCKDEVICE_DIR}/BufferedBlockDevice.h
  ${MBED_BLOCKDEVICE_DIR}/BufferedBlockDevice.cpp
  ${MBED_BLOCKDEVICE_DIR}/ChainingBlockDevice.h
  ${MBED_BLOCKDEVICE_DIR}/ChainingBlockDevice.cpp
  ${MBED_BLOCKDEVICE_DIR}/ExhaustibleBlockDevice.h
  ${MBED_BLOCKDEVICE_DIR}/ExhaustibleBlockDevice.cpp
  ${MBED_BLOCKDEVICE_DIR}/FlashSimBlockDevice.h
  ${MBED_BLOCKDEVICE_DIR}/FlashSimBlockDevice.cpp
  ${MBED_BLOCKDEVICE_DIR}/HeapBlockDevice.h
  ${MBED_BLOCKDEVICE_DIR}/HeapBlockDevice.cpp
  ${MBED_BLOCKDEVICE_DIR}/MBRBlockDevice.h
  ${MBED_BLOCKDEVICE_DIR}/MBRBlockDevice.cpp
  ${MBED_BLOCKDEVICE_DIR}/ObservingBlockDevice.h
  ${MBED_BLOCKDEVICE_DIR}/ObservingBlockDevice.cpp
  ${MBED_BLOCKDEVICE_DIR}/ProfilingBlockDevice.h
  ${MBED_BLOCKDEVICE_DIR}/ProfilingBlockDevice.cpp
  ${MBED_BLOCKDEVICE_DIR}/ReadOnlyBlockDevice.h
  ${MBED_BLOCKDEVICE_DIR}/ReadOnlyBlockDevice.cpp
  ${MBED_BLOCKDEVICE_DIR}/SlicingBlockDevice.h
  ${MBED_BLOCKDEVICE_DIR}/SlicingBlockDevice.cpp
)
set(MBED_BLOCKDEVICE_INCLUDE_DIRS
  ${MBED_BLOCKDEVICE_DIR}
)
set(MBED_BLOCKDEVICE_LINK_LIBRARIES
  mbed-platform
)

add_library(mbed-blockdevice STATIC EXCLUDE_FROM_ALL ${MBED_BLOCKDEVICE_SOURCES})
target_include_directories(mbed-blockdevice PUBLIC ${MBED_BLOCKDEVICE_INCLUDE_DIRS})
target_link_libraries(mbed-blockdevice PUBLIC ${MBED_BLOCKDEVICE_LINK_LIBRARIES})
