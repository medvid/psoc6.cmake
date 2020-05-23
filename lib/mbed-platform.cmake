set(MBED_PLATFORM_DIR ${MBED_OS_DIR}/platform)
set(MBED_PLATFORM_SOURCES
  ${MBED_PLATFORM_DIR}/source/CriticalSectionLock.cpp
  ${MBED_PLATFORM_DIR}/source/FileBase.cpp
  ${MBED_PLATFORM_DIR}/source/FileHandle.cpp
  ${MBED_PLATFORM_DIR}/source/FilePath.cpp
  ${MBED_PLATFORM_DIR}/source/FileSystemHandle.cpp
  ${MBED_PLATFORM_DIR}/source/LocalFileSystem.cpp
  ${MBED_PLATFORM_DIR}/source/SysTimer.cpp
  ${MBED_PLATFORM_DIR}/source/Stream.cpp
  ${MBED_PLATFORM_DIR}/source/mbed_alloc_wrappers.cpp
  ${MBED_PLATFORM_DIR}/source/mbed_assert.c
  ${MBED_PLATFORM_DIR}/source/mbed_atomic_impl.c
  ${MBED_PLATFORM_DIR}/source/mbed_board.c
  ${MBED_PLATFORM_DIR}/source/mbed_critical.c
  ${MBED_PLATFORM_DIR}/source/mbed_error.c
  ${MBED_PLATFORM_DIR}/source/mbed_error_hist.c
  ${MBED_PLATFORM_DIR}/source/mbed_os_timer.cpp
  ${MBED_PLATFORM_DIR}/source/mbed_poll.cpp
  ${MBED_PLATFORM_DIR}/source/mbed_power_mgmt.c
  ${MBED_PLATFORM_DIR}/source/mbed_sdk_boot.c
  ${MBED_PLATFORM_DIR}/source/mbed_stats.c
  ${MBED_PLATFORM_DIR}/source/mbed_thread.cpp
  ${MBED_PLATFORM_DIR}/source/mbed_retarget.cpp
  ${MBED_PLATFORM_DIR}/source/mbed_wait_api_no_rtos.c
  ${MBED_PLATFORM_DIR}/source/TARGET_CORTEX_M/mbed_fault_handler.c
)
set(MBED_PLATFORM_INCLUDE_DIRS
  ${MBED_OS_DIR}
  ${MBED_PLATFORM_DIR}
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
  TARGET_CORTEX_M=1
  MBED_SYS_STATS_ENABLED=1
  MBED_ALL_STATS_ENABLED=1
  # Referenced from platform/source/SysTimer.cpp
  # TODO: check if CY_CFG_PWR_DEEPSLEEP_LATENCY is always available
  MBED_CONF_TARGET_DEEP_SLEEP_LATENCY=CY_CFG_PWR_DEEPSLEEP_LATENCY
  MBED_CONF_TARGET_CONSOLE_UART=1
  MBED_CONF_PLATFORM_STDIO_BUFFERED_SERIAL=1
  MBED_CONF_PLATFORM_STDIO_BAUD_RATE=115200
  MBED_CONF_PLATFORM_DEFAULT_SERIAL_BAUD_RATE=115200

  # Enable for error history tracking.
  MBED_CONF_PLATFORM_ERROR_HIST_ENABLED=1

  #Set the number of most recent errors the system keeps in its history,
  # needs ERROR_HIST_ENABLED set to true for this to work.
  MBED_CONF_PLATFORM_ERROR_HIST_SIZE=4

  # Enables crash context capture when the system enters a fatal error/crash.
  # This feature requires linker script modification
  # https://os.mbed.com/docs/mbed-os/v5.15/apis/error-handling.html
  MBED_CONF_PLATFORM_CRASH_CAPTURE_ENABLED=0
)
set(MBED_PLATFORM_LINK_LIBRARIES
  psoc6pdl
)

if(${TOOLCHAIN} STREQUAL GCC)
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
