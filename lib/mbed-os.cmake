psoc6_load_library(
  NAME mbed-os
  VERSION 6.0.0-beta-1
  URL https://github.com/ARMmbed/mbed-os
  TAG mbed-os-6.0.0-beta-1
)

set(MBED_PLATFORM_SOURCES
  ${MBED_OS_DIR}/platform/source/CriticalSectionLock.cpp
  ${MBED_OS_DIR}/platform/source/FileHandle.cpp
  ${MBED_OS_DIR}/platform/source/SysTimer.cpp
  ${MBED_OS_DIR}/platform/source/mbed_assert.c
  ${MBED_OS_DIR}/platform/source/mbed_atomic_impl.c
  ${MBED_OS_DIR}/platform/source/mbed_board.c
  ${MBED_OS_DIR}/platform/source/mbed_critical.c
  ${MBED_OS_DIR}/platform/source/mbed_error.c
  ${MBED_OS_DIR}/platform/source/mbed_error_hist.c
  ${MBED_OS_DIR}/platform/source/mbed_os_timer.cpp
  ${MBED_OS_DIR}/platform/source/mbed_power_mgmt.c
  ${MBED_OS_DIR}/platform/source/mbed_sdk_boot.c
  ${MBED_OS_DIR}/platform/source/mbed_stats.c
  ${MBED_OS_DIR}/platform/source/mbed_thread.cpp
  ${MBED_OS_DIR}/platform/source/mbed_retarget.cpp
  ${MBED_OS_DIR}/platform/source/mbed_wait_api_no_rtos.c
  ${MBED_OS_DIR}/platform/source/TARGET_CORTEX_M/mbed_fault_handler.c
)
set(MBED_PLATFORM_INCLUDE_DIRS
  ${MBED_OS_DIR}
  ${MBED_OS_DIR}/platform
  ${MBED_OS_DIR}/platform/source
  ${MBED_OS_DIR}/platform/cxxsupport
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
)
set(MBED_PLATFORM_LINK_LIBRARIES
  psoc6pdl
)

if(${OS} STREQUAL RTX)
  list(APPEND MBED_PLATFORM_DEFINES
    MBED_CONF_RTOS_PRESENT=1
  )
  list(APPEND MBED_PLATFORM_LINK_LIBRARIES
    cmsis-rtx
  )
endif()

add_library(mbed-platform STATIC EXCLUDE_FROM_ALL ${MBED_PLATFORM_SOURCES})
target_include_directories(mbed-platform PUBLIC ${MBED_PLATFORM_INCLUDE_DIRS})
target_compile_definitions(mbed-platform PUBLIC ${MBED_PLATFORM_DEFINES})
target_link_libraries(mbed-platform PUBLIC ${MBED_PLATFORM_LINK_LIBRARIES})

set(MBED_DRIVERS_SOURCES
  ${MBED_OS_DIR}/drivers/source/BufferedSerial.cpp
  ${MBED_OS_DIR}/drivers/source/InterruptIn.cpp
  ${MBED_OS_DIR}/drivers/source/MbedCRC.cpp
  ${MBED_OS_DIR}/drivers/source/SerialBase.cpp
  ${MBED_OS_DIR}/drivers/source/Ticker.cpp
  ${MBED_OS_DIR}/drivers/source/Timeout.cpp
  ${MBED_OS_DIR}/drivers/source/TimerEvent.cpp
)
set(MBED_DRIVERS_INCLUDE_DIRS
  ${MBED_OS_DIR}/drivers
)
set(MBED_DRIVERS_DEFINES
  DEVICE_CRC=1
  DEVICE_INTERRUPTIN=1
  DEVICE_SERIAL=1
  DEVICE_SLEEP=1
  DEVICE_USTICKER=1
  MBED_CRC_TABLE_SIZE=16
)
set(MBED_DRIVERS_LINK_LIBRARIES
  mbed-platform
)

add_library(mbed-drivers STATIC EXCLUDE_FROM_ALL ${MBED_DRIVERS_SOURCES})
target_include_directories(mbed-drivers PUBLIC ${MBED_DRIVERS_INCLUDE_DIRS})
target_compile_definitions(mbed-drivers PUBLIC ${MBED_DRIVERS_DEFINES})
target_link_libraries(mbed-drivers PUBLIC ${MBED_DRIVERS_LINK_LIBRARIES})

set(MBED_HAL_SOURCES
  ${MBED_OS_DIR}/hal/mbed_critical_section_api.c
  ${MBED_OS_DIR}/hal/mbed_gpio.c
  ${MBED_OS_DIR}/hal/mbed_lp_ticker_api.c
  ${MBED_OS_DIR}/hal/mbed_lp_ticker_wrapper.cpp
  ${MBED_OS_DIR}/hal/mbed_ticker_api.c
  ${MBED_OS_DIR}/hal/mbed_us_ticker_api.c
  ${MBED_OS_DIR}/hal/static_pinmap.cpp
)
set(MBED_HAL_INCLUDE_DIRS
  ${MBED_OS_DIR}/hal
)
set(MBED_HAL_DEFINES
  # TBD
)
set(MBED_HAL_LINK_LIBRARIES
  mbed-drivers
)

add_library(mbed-hal STATIC EXCLUDE_FROM_ALL ${MBED_HAL_SOURCES})
target_include_directories(mbed-hal PUBLIC ${MBED_HAL_INCLUDE_DIRS})
target_compile_definitions(mbed-hal PUBLIC ${MBED_HAL_DEFINES})
target_link_libraries(mbed-hal PUBLIC ${MBED_HAL_LINK_LIBRARIES})

# platform layer depends on core_util_critical_section_enter provided by the HAL layer
target_link_libraries(mbed-platform PRIVATE mbed-hal)

set(MBED_RTOS_SOURCES
  ${MBED_OS_DIR}/rtos/source/ThisThread.cpp
  ${MBED_OS_DIR}/rtos/source/TARGET_CORTEX/mbed_boot.c
  ${MBED_OS_DIR}/rtos/source/TARGET_CORTEX/mbed_rtos_rtx.c
)
set(MBED_RTOS_INCLUDE_DIRS
  ${MBED_OS_DIR}/rtos
  # rtos/mbed_rtos_storage.h includes mbed_rtx_storage.h
  ${MBED_OS_DIR}/rtos/source/TARGET_CORTEX
)
set(MBED_RTOS_DEFINES
  MBED_CONF_RTOS_MAIN_THREAD_STACK_SIZE=4096
)
set(MBED_RTOS_LINK_LIBRARIES
  mbed-platform
  cmsis-rtx
)

if(${TOOLCHAIN} STREQUAL GCC)
  list(APPEND MBED_RTOS_SOURCES
    ${MBED_OS_DIR}/rtos/source/TARGET_CORTEX/TOOLCHAIN_GCC_ARM/mbed_boot_gcc_arm.c
  )
  # TODO: ARM / IAR
endif()

add_library(mbed-rtos STATIC EXCLUDE_FROM_ALL ${MBED_RTOS_SOURCES})
target_include_directories(mbed-rtos PUBLIC ${MBED_RTOS_INCLUDE_DIRS})
target_compile_definitions(mbed-rtos PUBLIC ${MBED_RTOS_DEFINES})
target_link_libraries(mbed-rtos PUBLIC ${MBED_RTOS_LINK_LIBRARIES})

if(${OS} STREQUAL RTX)
  # mbed_thread.cpp calls rtos::ThisThread::sleep_for
  # mbed_retarget.cpp calls singleton_mutex_id
  target_link_libraries(mbed-platform PRIVATE mbed-rtos)
endif()

set(MBED_TARGET_SOURCES
  ${MBED_OS_DIR}/targets/TARGET_Cypress/TARGET_PSOC6/cy_crc_api.c
  ${MBED_OS_DIR}/targets/TARGET_Cypress/TARGET_PSOC6/cy_gpio_api.c
  ${MBED_OS_DIR}/targets/TARGET_Cypress/TARGET_PSOC6/cy_lp_ticker_api.c
  ${MBED_OS_DIR}/targets/TARGET_Cypress/TARGET_PSOC6/cy_serial_api.c
  ${MBED_OS_DIR}/targets/TARGET_Cypress/TARGET_PSOC6/cy_sleep_api.c
  ${MBED_OS_DIR}/targets/TARGET_Cypress/TARGET_PSOC6/cy_us_ticker_api.c
  ${MBED_OS_DIR}/targets/TARGET_Cypress/TARGET_PSOC6/mbed_overrides.c
)
set(MBED_TARGET_INCLUDE_DIRS
  # BUG: targets/TARGET_Cypress/TARGET_PSOC6/mbed_overrides.c includes rtos/source/rtos_idle.h
  ${MBED_OS_DIR}/rtos/source
)
set(MBED_TARGET_DEFINES
  # TBD
)
set(MBED_TARGET_LINK_LIBRARIES
  mbed-hal
)

add_library(mbed-target STATIC EXCLUDE_FROM_ALL ${MBED_TARGET_SOURCES})
target_include_directories(mbed-target PUBLIC ${MBED_TARGET_INCLUDE_DIRS})
target_compile_definitions(mbed-target PUBLIC ${MBED_TARGET_DEFINES})
target_link_libraries(mbed-target PUBLIC ${MBED_TARGET_LINK_LIBRARIES})
