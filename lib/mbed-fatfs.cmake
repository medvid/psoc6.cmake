set(MBED_FATFS_DIR ${MBED_OS_DIR}/features/storage/filesystem/fat)
set(MBED_FATFS_SOURCES
  ${MBED_FATFS_DIR}/FATFileSystem.h
  ${MBED_FATFS_DIR}/FATFileSystem.cpp
  ${MBED_FATFS_DIR}/ChaN/diskio.h
  ${MBED_FATFS_DIR}/ChaN/ff.h
  ${MBED_FATFS_DIR}/ChaN/ff.cpp
  ${MBED_FATFS_DIR}/ChaN/ffconf.h
  ${MBED_FATFS_DIR}/ChaN/ffunicode.cpp
  ${MBED_FATFS_DIR}/ChaN/integer.h
)
set(MBED_FATFS_INCLUDE_DIRS
  ${MBED_FATFS_DIR}
)
set(MBED_FATFS_DEFINES
  # Switches debug mode.
  # 0: disable
  # 1: enable
  MBED_CONF_FAT_CHAN_FFS_DBG=0

  # Switches read-only configuration.
  # 0: read/write
  # 1: read-only
  MBED_CONF_FAT_CHAN_FF_FS_READONLY=0

  # Defines minimization level to remove some basic API functions.
  # 0: all functions enabled
  # 1: f_stat() removed
  # 2: f_opendir() removed in addition to 1
  # 3: f_lseek() removed in addition to 2
  MBED_CONF_FAT_CHAN_FF_FS_MINIMIZE=0

  # Switches string functions.
  # 0: disable string functions
  # 1: enable without LF-CRLF conversion
  # 2: enable with LF-CRLF conversion
  MBED_CONF_FAT_CHAN_FF_USE_STRFUNC=0

  # Switches filtered directory read functions.
  # 0: disable
  # 1: enable
  # 2: enable with matching altname[] too
  MBED_CONF_FAT_CHAN_FF_USE_FIND=0

  # Switches f_mkfs() function.
  # 0: disable
  # 1: enable.
  MBED_CONF_FAT_CHAN_FF_USE_MKFS=1

  # Switches fast seek function.
  # 0: disable
  # 1: enable
  MBED_CONF_FAT_CHAN_FF_USE_FASTSEEK=0

  # Switches f_expand function.
  # 0: disable
  # 1: enable
  MBED_CONF_FAT_CHAN_FF_USE_EXPAND=0

  # Switches attribute manipulation functions.
  # 0: disable
  # 1: enable
  # ff_fs_readonly needs to be 0 to enable this option
  MBED_CONF_FAT_CHAN_FF_USE_CHMOD=0

  # Switches volume label functions.
  # 0: disable
  # 1: enable
  MBED_CONF_FAT_CHAN_FF_USE_LABEL=0

  # Switches f_forward() function.
  # 0: disable
  # 1: enable
  MBED_CONF_FAT_CHAN_FF_USE_FORWARD=0

  # Specifies the OEM code page to be used on the target system.
  MBED_CONF_FAT_CHAN_FF_CODE_PAGE=437

  # Switches the support for LFN (long file name).
  # 0: disable LFN
  # 1: enable LFN with static working buffer on the BSS, always NOT thread-safe
  # 2: enable LFN with dynamic working buffer on the STACK
  # 3: enable LFN with dynamic working buffer on the HEAP
  MBED_CONF_FAT_CHAN_FF_USE_LFN=3

  # Defines size of the working buffer in UTF-16 code unit and it can be in range of 12 to 255.
  # It is recommended to be set 255 to fully support LFN specification.
  MBED_CONF_FAT_CHAN_FF_MAX_LFN=255

  # Switches the character encoding on the API when LFN is enabled.
  # 0: ANSI/OEM in current CP (TCHAR = char)
  # 1: unicode in UTF-16 (TCHAR = WCHAR)
  # 2: unicode in UTF-8 (TCHAR = char)
  MBED_CONF_FAT_CHAN_FF_LFN_UNICODE=0

  # Defines size of file name members in the FILINFO structure which is used to read out directory items.
  # The value should be suffcient for the file names to read.
  # The maximum possible length of the read file name depends on character encoding.
  # When LFN is not enabled, these options have no effect.
  MBED_CONF_FAT_CHAN_FF_LFN_BUF=255

  # See FF_LFN_BUF.
  MBED_CONF_FAT_CHAN_FF_SFN_BUF=12

  # When FF_LFN_UNICODE >= 1 with LFN enabled, string I/O functions convert the character encoding in it.
  # This option selects assumption of character encoding ON THE FILE to be read/written via those functions.
  # 0: ANSI/OEM in current CP
  # 1: unicode in UTF-16LE
  # 2: unicode in UTF-16BE
  # 3: unicode in UTF-8
  MBED_CONF_FAT_CHAN_FF_STRF_ENCODE=3

  # Configures support for relative path.
  # 0: disable relative path and remove related functions
  # 1: enable relative path. f_chdir() and f_chdrive() are available
  # 2: f_getcwd() function is available in addition to 1
  MBED_CONF_FAT_CHAN_FF_FS_RPATH=1

  # Number of volumes (logical drives) to be used. (1-10).
  MBED_CONF_FAT_CHAN_FF_VOLUMES=4

  # Switches string support for volume ID.
  # When ff_volume_strs is set to 1, also pre-defined strings
  # can be used as drive number in the path name.
  MBED_CONF_FAT_CHAN_FF_STR_VOLUME_ID=0

  # Defines the drive ID strings for each logical drive.
  # Number of items must be equal to ff_volumes.
  # Valid characters for the drive ID strings are: A-Z and 0-9.
  MBED_CONF_FAT_CHAN_FF_VOLUME_STRS="RAM","NAND","CF","SD","SD2","USB","USB2","USB3"

  # Switches support for multiple volumes on the physical drive.
  # By default (0), each logical drive number is bound to the same physical drive number
  # and only an FAT volume found on the physical drive will be mounted.
  # When this function is enabled (1), each logical drive number
  # can be bound to arbitrary physical drive.
  MBED_CONF_FAT_CHAN_FF_MULTI_PARTITION=0

  # This and the next option configures the range of sector size to be supported.
  # (512, 1024, 2048 or 4096)
  # Always set both 512 for most systems, generic memory card and harddisk.
  # But a larger value may be required for on-board flash memory and some type of optical media.
  MBED_CONF_FAT_CHAN_FF_MIN_SS=512

  # When ff_max_ss is larger than ff_min_ss, FatFs is configured for variable sector size mode.
  MBED_CONF_FAT_CHAN_FF_MAX_SS=4096

  # Switches support for ATA-TRIM.
  # 0: disable
  # 1: enable
  MBED_CONF_FAT_CHAN_FF_USE_TRIM=1

  # If you need to know correct free space on the FAT32 volume, set bit 0 of this option,
  # and f_getfree() function at first time after volume mount will force a full FAT scan.
  # Bit 1 controls the use of last allocated cluster number.
  MBED_CONF_FAT_CHAN_FF_FS_NOFSINFO=0

  # Switches tiny buffer configuration.
  # (0:Normal or 1:Tiny).
  # At the tiny configuration, size of file object (FIL) is shrinked ff_max_ss bytes.
  # Instead of private sector buffer eliminated from the file object,
  # common sector buffer in the filesystem object (FATFS) is used for the file data transfer.
  MBED_CONF_FAT_CHAN_FF_FS_TINY=1

  # Switches support for exFAT filesystem.
  # 0: disable, 1: enable.
  # When enable exFAT, also LFN needs to be enabled.
  # Note that enabling exFAT discards ANSI C (C89) compatibility.
  MBED_CONF_FAT_CHAN_FF_FS_EXFAT=0

  # Enables the use of the heap for allocating buffers.
  # Otherwise _max_ss sized buffers are allocated statically in relevant structures
  # (in FATFS if _fs_tiny, otherwise in FATFS and FIL).
  MBED_CONF_FAT_CHAN_FF_FS_HEAPBUF=1

  # Switches timestamp functiton. If the system does not have any RTC function
  # or valid timestamp is not needed, set to 1 to disable the timestamp function.
  # All objects modified by FatFs will have a fixed timestamp defined by
  # ff_nortc_mon, ff_nortc_mday and ff_nortc_year in local time.
  MBED_CONF_FAT_CHAN_FF_FS_NORTC=0

  # See FF_FS_NORTC.
  MBED_CONF_FAT_CHAN_FF_NORTC_MON=1

  # See FF_FS_NORTC.
  MBED_CONF_FAT_CHAN_FF_NORTC_MDAY=1

  # See FF_FS_NORTC.
  MBED_CONF_FAT_CHAN_FF_NORTC_YEAR=2017

  # Switches file lock function to control duplicated file open
  # and illegal operation to open objects.
  # This option must be 0 when ff_fs_readonly is 1.
  # The value defines how many files/sub-directories can be opened
  # simultaneously under file lock control.
  # Note that the file lock control is independent of re-entrancy.
  MBED_CONF_FAT_CHAN_FF_FS_LOCK=0

  # Switches the re-entrancy (thread safe) of the FatFs module itself.
  # Note that regardless of this option, file access to different volume
  # is always re-entrant and volume control functions.
  # 0: disable re-entrancy.
  # ff_fs_timeout and ff_sync_t have no effect.
  # 1: enable re-entrancy.
  # Also user provided synchronization handlers must be added to the project.
  # Samples are available in option/syscall.c.
  MBED_CONF_FAT_CHAN_FF_FS_REENTRANT=0

  # Defines timeout period in unit of time tick.
  MBED_CONF_FAT_CHAN_FF_FS_TIMEOUT=1000

  # Defines O/S dependent sync object type.
  # e.g. HANDLE, ID, OS_EVENT* and SemaphoreHandle_t.
  MBED_CONF_FAT_CHAN_FF_SYNC_T=HANDLE

  # Sync the file on every new cluster.
  MBED_CONF_FAT_CHAN_FLUSH_ON_NEW_CLUSTER=0

  # Sync the file on every new sector.
  MBED_CONF_FAT_CHAN_FLUSH_ON_NEW_SECTOR=1
)
set(MBED_FATFS_LINK_LIBRARIES
  mbed-platform
)

add_library(mbed-fatfs STATIC EXCLUDE_FROM_ALL ${MBED_FATFS_SOURCES})
target_include_directories(mbed-fatfs PUBLIC ${MBED_FATFS_INCLUDE_DIRS})
target_compile_definitions(mbed-fatfs PUBLIC ${MBED_FATFS_DEFINES})
target_link_libraries(mbed-fatfs PUBLIC ${MBED_FATFS_LINK_LIBRARIES})
