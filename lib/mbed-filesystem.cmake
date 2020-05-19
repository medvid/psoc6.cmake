set(MBED_FILESYSTEM_DIR ${MBED_OS_DIR}/features/storage/filesystem)
set(MBED_FILESYSTEM_SOURCES
  ${MBED_FILESYSTEM_DIR}/mbed_filesystem.h
  ${MBED_FILESYSTEM_DIR}/Dir.h
  ${MBED_FILESYSTEM_DIR}/Dir.cpp
  ${MBED_FILESYSTEM_DIR}/File.h
  ${MBED_FILESYSTEM_DIR}/File.cpp
  ${MBED_FILESYSTEM_DIR}/FileSystem.h
  ${MBED_FILESYSTEM_DIR}/FileSystem.cpp
)
set(MBED_FILESYSTEM_INCLUDE_DIRS
  ${MBED_OS_DIR}/features/storage
  ${MBED_FILESYSTEM_DIR}
)
set(MBED_FILESYSTEM_DEFINES
  MBED_CONF_FILESYSTEM_PRESENT=1
)
set(MBED_FILESYSTEM_LINK_LIBRARIES
  mbed-platform
)

add_library(mbed-filesystem STATIC EXCLUDE_FROM_ALL ${MBED_FILESYSTEM_SOURCES})
target_include_directories(mbed-filesystem PUBLIC ${MBED_FILESYSTEM_INCLUDE_DIRS})
target_compile_definitions(mbed-filesystem PUBLIC ${MBED_FILESYSTEM_DEFINES})
target_link_libraries(mbed-filesystem PUBLIC ${MBED_FILESYSTEM_LINK_LIBRARIES})
