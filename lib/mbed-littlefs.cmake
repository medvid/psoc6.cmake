set(MBED_LITTLEFS_DIR ${MBED_OS_DIR}/features/storage/filesystem/littlefs)
set(MBED_LITTLEFS_SOURCES
  ${MBED_LITTLEFS_DIR}/LittleFileSystem.h
  ${MBED_LITTLEFS_DIR}/LittleFileSystem.cpp
  ${MBED_LITTLEFS_DIR}/littlefs/lfs.h
  ${MBED_LITTLEFS_DIR}/littlefs/lfs.c
  ${MBED_LITTLEFS_DIR}/littlefs/lfs_util.h
  ${MBED_LITTLEFS_DIR}/littlefs/lfs_util.h
  # FIXME: dirent.h:72:15: error: unknown type name 'DIR'
  #${MBED_LITTLEFS_DIR}/littlefs/emubd/lfs_emubd.h
  #${MBED_LITTLEFS_DIR}/littlefs/emubd/lfs_emubd.c
)
set(MBED_LITTLEFS_INCLUDE_DIRS
  ${MBED_LITTLEFS_DIR}
  ${MBED_LITTLEFS_DIR}/littlefs
)
set(MBED_LITTLEFS_DEFINES
  # Minimum size of a block read.
  # This determines the size of read buffers.
  # This may be larger than the physical read size to improve
  # performance by caching more of the block device.
  MBED_LFS_READ_SIZE=64

  # Minimum size of a block program.
  # This determines the size of program buffers.
  # This may be larger than the physical program size to improve
  # performance by caching more of the block device.
  MBED_LFS_PROG_SIZE=64

  # Size of an erasable block.
  # This does not impact ram consumption and may be larger than the physical erase size.
  # However, this should be kept small as each file currently takes up an entire block.
  MBED_LFS_BLOCK_SIZE=512

  # Number of blocks to lookahead during block allocation.
  # A larger lookahead reduces the number of passes required to allocate a block.
  # The lookahead buffer requires only 1 bit per block so it can be quite large with little ram impact.
  # Should be a multiple of 32.
  MBED_LFS_LOOKAHEAD=512

  # Enable intrinsics for bit operations such as ctz, popc, and le32 conversion.
  # Can be disabled to help debug toolchain issues
  MBED_LFS_INTRINSICS=true

  # Enables info logging.
  # true = enabled
  # false = disabled
  # null = disabled only in release builds
  #MBED_LFS_ENABLE_INFO=false

  # Enables info logging.
  # true = enabled
  # false = disabled
  # null = disabled only in release builds
  #MBED_LFS_ENABLE_DEBUG

  # Enables warn logging.
  # true = enabled
  # false = disabled
  # null = disabled only in release builds
  #MBED_LFS_ENABLE_WARN

  # Enables error logging.
  # true = enabled
  # false = disabled
  # null = disabled only in release builds
  #MBED_LFS_ENABLE_ERROR

  # Enables asserts.
  # true = enabled
  # false = disabled
  # null = disabled only in release builds
  #MBED_LFS_ENABLE_ASSERT
)
set(MBED_LITTLEFS_LINK_LIBRARIES
  mbed-filesystem
  mbed-drivers
)

add_library(mbed-littlefs STATIC EXCLUDE_FROM_ALL ${MBED_LITTLEFS_SOURCES})
target_include_directories(mbed-littlefs PUBLIC ${MBED_LITTLEFS_INCLUDE_DIRS})
target_compile_definitions(mbed-littlefs PUBLIC ${MBED_LITTLEFS_DEFINES})
target_link_libraries(mbed-littlefs PUBLIC ${MBED_LITTLEFS_LINK_LIBRARIES})
