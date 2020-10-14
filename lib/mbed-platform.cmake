set(MBED_PLATFORM_DIR ${MBED_OS_DIR}/platform)
set(MBED_PLATFORM_SOURCES
  ${MBED_PLATFORM_DIR}/ATCmdParser.h
  ${MBED_PLATFORM_DIR}/Callback.h
  ${MBED_PLATFORM_DIR}/CircularBuffer.h
  ${MBED_PLATFORM_DIR}/CriticalSectionLock.h
  ${MBED_PLATFORM_DIR}/CThunk.h
  ${MBED_PLATFORM_DIR}/DeepSleepLock.h
  ${MBED_PLATFORM_DIR}/DirHandle.h
  ${MBED_PLATFORM_DIR}/FileBase.h
  ${MBED_PLATFORM_DIR}/FileHandle.h
  ${MBED_PLATFORM_DIR}/FileLike.h
  ${MBED_PLATFORM_DIR}/FilePath.h
  ${MBED_PLATFORM_DIR}/FileSystemHandle.h
  ${MBED_PLATFORM_DIR}/FileSystemLike.h
  ${MBED_PLATFORM_DIR}/LocalFileSystem.h
  ${MBED_PLATFORM_DIR}/mbed_application.h
  ${MBED_PLATFORM_DIR}/mbed_assert.h
  ${MBED_PLATFORM_DIR}/mbed_atomic.h
  ${MBED_PLATFORM_DIR}/mbed_chrono.h
  ${MBED_PLATFORM_DIR}/mbed_critical.h
  ${MBED_PLATFORM_DIR}/mbed_debug.h
  ${MBED_PLATFORM_DIR}/mbed_error.h
  ${MBED_PLATFORM_DIR}/mbed_interface.h
  ${MBED_PLATFORM_DIR}/mbed_mem_trace.h
  ${MBED_PLATFORM_DIR}/mbed_mktime.h
  ${MBED_PLATFORM_DIR}/mbed_mpu_mgmt.h
  ${MBED_PLATFORM_DIR}/mbed_poll.h
  ${MBED_PLATFORM_DIR}/mbed_power_mgmt.h
  ${MBED_PLATFORM_DIR}/mbed_preprocessor.h
  ${MBED_PLATFORM_DIR}/mbed_retarget.h
  ${MBED_PLATFORM_DIR}/mbed_rtc_time.h
  ${MBED_PLATFORM_DIR}/mbed_semihost_api.h
  ${MBED_PLATFORM_DIR}/mbed_stats.h
  ${MBED_PLATFORM_DIR}/mbed_thread.h
  ${MBED_PLATFORM_DIR}/mbed_toolchain.h
  ${MBED_PLATFORM_DIR}/mbed_version.h
  ${MBED_PLATFORM_DIR}/mbed_wait_api.h
  ${MBED_PLATFORM_DIR}/NonCopyable.h
  ${MBED_PLATFORM_DIR}/platform.h
  ${MBED_PLATFORM_DIR}/PlatformMutex.h
  ${MBED_PLATFORM_DIR}/ScopedLock.h
  ${MBED_PLATFORM_DIR}/ScopedRamExecutionLock.h
  ${MBED_PLATFORM_DIR}/ScopedRomWriteLock.h
  ${MBED_PLATFORM_DIR}/SharedPtr.h
  ${MBED_PLATFORM_DIR}/SingletonPtr.h
  ${MBED_PLATFORM_DIR}/Span.h
  ${MBED_PLATFORM_DIR}/Stream.h
  ${MBED_PLATFORM_DIR}/Transaction.h
  ${MBED_PLATFORM_DIR}/internal/CThunkBase.h
  ${MBED_PLATFORM_DIR}/internal/mbed_atomic_impl.h
  ${MBED_PLATFORM_DIR}/internal/mbed_fault_handler.h
  ${MBED_PLATFORM_DIR}/source/ATCmdParser.cpp
  ${MBED_PLATFORM_DIR}/source/CriticalSectionLock.cpp
  ${MBED_PLATFORM_DIR}/source/CThunkBase.cpp
  ${MBED_PLATFORM_DIR}/source/DeepSleepLock.cpp
  ${MBED_PLATFORM_DIR}/source/FileBase.cpp
  ${MBED_PLATFORM_DIR}/source/FileHandle.cpp
  ${MBED_PLATFORM_DIR}/source/FilePath.cpp
  ${MBED_PLATFORM_DIR}/source/FileSystemHandle.cpp
  ${MBED_PLATFORM_DIR}/source/LocalFileSystem.cpp
  ${MBED_PLATFORM_DIR}/source/mbed_alloc_wrappers.cpp
  ${MBED_PLATFORM_DIR}/source/mbed_application.c
  ${MBED_PLATFORM_DIR}/source/mbed_assert.c
  ${MBED_PLATFORM_DIR}/source/mbed_atomic_impl.c
  ${MBED_PLATFORM_DIR}/source/mbed_board.c
  ${MBED_PLATFORM_DIR}/source/mbed_crash_data_offsets.h
  ${MBED_PLATFORM_DIR}/source/mbed_critical.c
  ${MBED_PLATFORM_DIR}/source/mbed_error.c
  ${MBED_PLATFORM_DIR}/source/mbed_error_hist.c
  ${MBED_PLATFORM_DIR}/source/mbed_error_hist.h
  ${MBED_PLATFORM_DIR}/source/mbed_interface.c
  ${MBED_PLATFORM_DIR}/source/mbed_mem_trace.cpp
  ${MBED_PLATFORM_DIR}/source/mbed_mktime.c
  ${MBED_PLATFORM_DIR}/source/mbed_mpu_mgmt.c
  ${MBED_PLATFORM_DIR}/source/mbed_os_timer.cpp
  ${MBED_PLATFORM_DIR}/source/mbed_os_timer.h
  ${MBED_PLATFORM_DIR}/source/mbed_poll.cpp
  ${MBED_PLATFORM_DIR}/source/mbed_power_mgmt.c
  ${MBED_PLATFORM_DIR}/source/mbed_retarget.cpp
  # FIXME: error: invalid use of incomplete type 'struct timeval'
  #${MBED_PLATFORM_DIR}/source/mbed_rtc_time.cpp
  ${MBED_PLATFORM_DIR}/source/mbed_sdk_boot.c
  ${MBED_PLATFORM_DIR}/source/mbed_semihost_api.c
  ${MBED_PLATFORM_DIR}/source/mbed_stats.c
  ${MBED_PLATFORM_DIR}/source/mbed_thread.cpp
  ${MBED_PLATFORM_DIR}/source/mbed_wait_api_no_rtos.c
  ${MBED_PLATFORM_DIR}/source/Stream.cpp
  ${MBED_PLATFORM_DIR}/source/SysTimer.h
  ${MBED_PLATFORM_DIR}/source/SysTimer.cpp
  ${MBED_PLATFORM_DIR}/source/TARGET_CORTEX_M/mbed_fault_handler.c
  ${MBED_PLATFORM_DIR}/source/minimal-printf/mbed_printf_armlink_overrides.c
  ${MBED_PLATFORM_DIR}/source/minimal-printf/mbed_printf_implementation.h
  ${MBED_PLATFORM_DIR}/source/minimal-printf/mbed_printf_implementation.c
  ${MBED_PLATFORM_DIR}/source/minimal-printf/mbed_printf_wrapper.c
)
set(MBED_PLATFORM_INCLUDE_DIRS
  ${MBED_OS_DIR}
  ${MBED_PLATFORM_DIR}
  # mbed_fault_handler.c includes mbed_fault_handler.h
  ${MBED_PLATFORM_DIR}/internal
  ${MBED_PLATFORM_DIR}/cxxsupport
  ${MBED_PLATFORM_DIR}/source
  ${MBED_PLATFORM_DIR}/source/TARGET_CORTEX_M
  # objects.h includes pinmap.h
  ${MBED_OS_DIR}/hal
  # TBD: cmsis.h
  ${MBED_OS_DIR}/targets/TARGET_Cypress/TARGET_PSOC6
  # TBD: cycfg.h
  ${BSP_GENERATED_SOURCE_DIR}
  # rtos/mbed_rtos1_types.h include cmsis_os.h
  # TODO: include ${CMSIS_DIR}/CMSIS/RTOS/RTX/INC instead
  ${MBED_OS_DIR}/rtos/source/TARGET_CORTEX/rtx4
)
set(MBED_PLATFORM_DEFINES
  __MBED__=1
  TARGET_LIKE_MBED=1
  TARGET_CORTEX_M=1

  # Enable conversion to standard newlines on stdin/stdout/stderr
  MBED_CONF_PLATFORM_STDIO_CONVERT_NEWLINES=1

  # Enable conversion to standard newlines on any tty FILE stream
  MBED_CONF_PLATFORM_STDIO_CONVERT_TTY_NEWLINES=1

  # (Applies if target.console-uart is true and stdio-minimal-console-only is false.)
  # Use BufferedSerial driver to obtain buffered serial I/O on stdin/stdout/stderr.
  # If false, unbuffered serial_getc and serial_putc are used directly.
  MBED_CONF_PLATFORM_STDIO_BUFFERED_SERIAL=1

  # (Ignores stdio-buffered-serial) Creates a console for basic unbuffered I/O operations.
  # Enable if your application does not require file handles to access the serial interface.
  # The POSIX `fsync` function will always an error.
  MBED_CONF_PLATFORM_STDIO_MINIMAL_CONSOLE_ONLY=0

  # (Applies if target.console-uart is true.) Baud rate for stdio
  MBED_CONF_PLATFORM_STDIO_BAUD_RATE=115200

  # Enable or disable the flush of standard I/O's at exit.
  MBED_CONF_PLATFORM_STDIO_FLUSH_AT_EXIT=1

  # Default baud rate for a serial object (if not specified in the constructor)
  MBED_CONF_PLATFORM_DEFAULT_SERIAL_BAUD_RATE=115200

  # Enable use of low power timer class for poll(). May cause missing events.
  MBED_CONF_PLATFORM_POLL_USE_LOWPOWER_TIMER=0

  # Enable for error history tracking.
  MBED_CONF_PLATFORM_ERROR_HIST_ENABLED=1

  # Set the number of most recent errors the system keeps in its history
  # needs MBED_CONF_PLATFORM_ERROR_HIST_ENABLED set to 1 for this to work.
  MBED_CONF_PLATFORM_ERROR_HIST_SIZE=4

  # Enables capture of filename and line number as part of error context capture,
  # this works only for debug and develop builds.
  # On release builds, filename capture is always disabled
  MBED_CONF_PLATFORM_ERROR_FILENAME_CAPTURE_ENABLED=0

  # Reports all the threads in the system as part of error report.
  MBED_CONF_PLATFORM_ERROR_ALL_THREADS_INFO=0

  # Sets the maximum length of buffer used for capturing the filename in error context.
  # This needs MBED_CONF_PLATFORM_ERROR_FILENAME_CAPTURE_ENABLED feature.
  MBED_CONF_PLATFORM_MAX_ERROR_FILENAME_LEN=16

  # Enable tracing of each memory call by invoking a callback on each memory operation.
  # See mbed_mem_trace.h in the HAL API for more information
  #MBED_MEM_TRACING_ENABLED

  # Set to 1 to enable all platform stats.
  # When enabled the functions mbed_stats_*_get returns non-zero data.
  # See mbed_stats.h for more information
  MBED_ALL_STATS_ENABLED=1

  # Set to 1 to enable system stats.
  # When enabled the function mbed_stats_sys_get returns non-zero data.
  # See mbed_stats.h for more information
  MBED_SYS_STATS_ENABLED=1

  # Set to 1 to enable stack stats.
  # When enabled the functions mbed_stats_stack_get and mbed_stats_stack_get_each return non-zero data.
  # See mbed_stats.h for more information
  MBED_STACK_STATS_ENABLED=1

  # Set to true to enable stack dump.
  #MBED_STACK_DUMP_ENABLED

  # Set to 1 to enable cpu stats.
  # When enabled the function mbed_stats_cpu_get returns non-zero data.
  # See mbed_stats.h for more information
  #MBED_CPU_STATS_ENABLED

  # Set to 1 to enable heap stats.
  # When enabled the function mbed_stats_heap_get returns non-zero data.
  # See mbed_stats.h for more information
  #MBED_HEAP_STATS_ENABLED

  # Set to 1 to enable thread stats.
  # When enabled the function mbed_stats_thread_get_each returns non-zero data.
  # See mbed_stats.h for more information
  #MBED_THREAD_STATS_ENABLED

  # The maximum CThunk objects used at the same time.
  # This must be greater than 0 and less 256
  MBED_CONF_PLATFORM_CTHUNK_COUNT_MAX=8

  # Enables support for non-trivial callable objects in Callback.
  # Can be disabled to save ROM if no-one is using non-trivial types.
  # Changing this value may cause incompatibility with pre-built binaries.
  MBED_CONF_PLATFORM_CALLBACK_NONTRIVIAL=0

  # Enables support for comparing two Callbacks.
  # See notes on operator== for limitations.
  # Can be disabled to save ROM if not required.
  MBED_CONF_PLATFORM_CALLBACK_COMPARABLE=1

  # Enables crash context capture when the system enters a fatal error/crash.
  # This feature requires linker script modification
  # https://os.mbed.com/docs/mbed-os/v5.15/apis/error-handling.html
  MBED_CONF_PLATFORM_CRASH_CAPTURE_ENABLED=0

  # Maximum number of auto reboots permitted when an error happens.
  MBED_CONF_PLATFORM_ERROR_REBOOT_MAX=1

  # Setting this to true enables auto-reboot on a fatal error.
  MBED_CONF_PLATFORM_FATAL_ERROR_AUTO_REBOOT_ENABLED=0

  # Use the MPU if available to fault execution from RAM and writes to ROM.
  # Can be disabled to reduce image size.
  MBED_CONF_PLATFORM_USE_MPU=1

  # Enable printing 64 bit integers when using minimal printf library
  MBED_CONF_PLATFORM_MINIMAL_PRINTF_ENABLE_64_BIT=1

  # Enable floating point printing when using minimal printf library
  MBED_CONF_PLATFORM_MINIMAL_PRINTF_ENABLE_FLOATING_POINT=0

  # Maximum number of decimals to be printed when using minimal printf library
  MBED_CONF_PLATFORM_MINIMAL_PRINTF_SET_FLOATING_POINT_MAX_DECIMALS=6

  # TODO
  MBED_CONF_TARGET_DEEP_SLEEP_LATENCY=CY_CFG_PWR_DEEPSLEEP_LATENCY

  # TODO
  MBED_CONF_TARGET_CONSOLE_UART=1
)
set(MBED_PLATFORM_LINK_LIBRARIES
  mtb-pdl-cat1
)

if(${TOOLCHAIN} STREQUAL GCC OR ${TOOLCHAIN} STREQUAL LLVM)
  list(APPEND MBED_PLATFORM_SOURCES
    ${MBED_PLATFORM_DIR}/source/TARGET_CORTEX_M/TOOLCHAIN_GCC/except.S
  )
  # BUG: mbed_alloc_wrapper.cpp uses TOOLCHAIN_GCC
  list(APPEND MBED_PLATFORM_DEFINES TOOLCHAIN_GCC_ARM TOOLCHAIN_GCC)
elseif(${TOOLCHAIN} STREQUAL ARM)
  list(APPEND MBED_PLATFORM_SOURCES
    # TODO: armasm.exe build recipe doesn't run the preprocessor
    #${MBED_PLATFORM_DIR}/source/TARGET_CORTEX_M/TOOLCHAIN_ARM/except.S
  )
  list(APPEND MBED_PLATFORM_DEFINES TOOLCHAIN_ARM)
elseif(${TOOLCHAIN} STREQUAL IAR)
  list(APPEND MBED_PLATFORM_SOURCES
    ${MBED_PLATFORM_DIR}/source/TARGET_CORTEX_M/TOOLCHAIN_IAR/except.S
  )
  list(APPEND MBED_PLATFORM_DEFINES TOOLCHAIN_IAR)
else()
  message(FATAL_ERROR "mbed-os: TOOLCHAIN ${TOOLCHAIN} is not supported.")
endif()

add_library(mbed-platform STATIC EXCLUDE_FROM_ALL ${MBED_PLATFORM_SOURCES})
target_include_directories(mbed-platform PUBLIC ${MBED_PLATFORM_INCLUDE_DIRS})
target_compile_definitions(mbed-platform PUBLIC ${MBED_PLATFORM_DEFINES})
target_link_libraries(mbed-platform PUBLIC ${MBED_PLATFORM_LINK_LIBRARIES})

# Suppress IAR Warning[Pe540]: support for exception handling is disabled
if(${TOOLCHAIN} STREQUAL IAR)
  target_compile_options(mbed-platform PUBLIC $<$<COMPILE_LANGUAGE:CXX>:--diag_suppress=Pe540>)
endif()
