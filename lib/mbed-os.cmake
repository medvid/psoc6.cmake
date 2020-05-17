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
  ${MBED_OS_DIR}/platform/source/mbed_alloc_wrappers.cpp
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
  ${MBED_OS_DIR}/platform/cxxsupport
  ${MBED_OS_DIR}/platform/source
  ${MBED_OS_DIR}/platform/source/TARGET_CORTEX_M
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
  # BUG: mbed_alloc_wrapper.cpp uses TOOLCHAIN_GCC
  list(APPEND MBED_PLATFORM_DEFINES TOOLCHAIN_GCC_ARM TOOLCHAIN_GCC)
elseif(${TOOLCHAIN} STREQUAL ARM)
  list(APPEND MBED_PLATFORM_DEFINES TOOLCHAIN_ARM)
elseif(${TOOLCHAIN} STREQUAL IAR)
  list(APPEND MBED_PLATFORM_DEFINES TOOLCHAIN_IAR)
else()
  message(FATAL_ERROR "mbed-os: TOOLCHAIN ${TOOLCHAIN} is not supported.")
endif()

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
  ${MBED_OS_DIR}/drivers/source/FlashIAP.cpp
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
  DEVICE_FLASH=1
  DEVICE_INTERRUPTIN=1
  DEVICE_SERIAL=1
  DEVICE_SLEEP=1
  DEVICE_TRNG=1
  DEVICE_USTICKER=1
  MBED_CRC_TABLE_SIZE=16
  #MBEDTLS_CONFIG_HW_SUPPORT=1
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
  ${MBED_OS_DIR}/rtos/source/Kernel.cpp
  ${MBED_OS_DIR}/rtos/source/Mutex.cpp
  ${MBED_OS_DIR}/rtos/source/ThisThread.cpp
  ${MBED_OS_DIR}/rtos/source/TARGET_CORTEX/mbed_boot.c
  ${MBED_OS_DIR}/rtos/source/TARGET_CORTEX/mbed_rtos_rtx.c
  ${MBED_OS_DIR}/rtos/source/TARGET_CORTEX/mbed_rtx_handlers.c
  ${MBED_OS_DIR}/rtos/source/TARGET_CORTEX/mbed_rtx_idle.cpp
)
set(MBED_RTOS_INCLUDE_DIRS
  ${MBED_OS_DIR}/rtos
  # rtos/mbed_rtos_storage.h includes mbed_rtx_storage.h
  ${MBED_OS_DIR}/rtos/source/TARGET_CORTEX
)
set(MBED_RTOS_DEFINES
  # The size of the main thread's stack
  MBED_CONF_RTOS_MAIN_THREAD_STACK_SIZE=4096

  # The default stack size of new threads
  MBED_CONF_RTOS_THREAD_STACK_SIZE=4096
)
set(MBED_RTOS_LINK_LIBRARIES
  mbed-platform
  mbed-drivers
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
  ${MBED_OS_DIR}/targets/TARGET_Cypress/TARGET_PSOC6/cy_flash_api.c
  ${MBED_OS_DIR}/targets/TARGET_Cypress/TARGET_PSOC6/cy_gpio_api.c
  ${MBED_OS_DIR}/targets/TARGET_Cypress/TARGET_PSOC6/cy_lp_ticker_api.c
  ${MBED_OS_DIR}/targets/TARGET_Cypress/TARGET_PSOC6/cy_serial_api.c
  ${MBED_OS_DIR}/targets/TARGET_Cypress/TARGET_PSOC6/cy_sleep_api.c
  ${MBED_OS_DIR}/targets/TARGET_Cypress/TARGET_PSOC6/cy_trng_api.c
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

set(MBED_BLOCKDEVICE_SOURCES
  ${MBED_OS_DIR}/features/storage/blockdevice/BlockDevice.h
  ${MBED_OS_DIR}/features/storage/blockdevice/BufferedBlockDevice.h
  ${MBED_OS_DIR}/features/storage/blockdevice/BufferedBlockDevice.cpp
  ${MBED_OS_DIR}/features/storage/blockdevice/ChainingBlockDevice.h
  ${MBED_OS_DIR}/features/storage/blockdevice/ChainingBlockDevice.cpp
  ${MBED_OS_DIR}/features/storage/blockdevice/ExhaustibleBlockDevice.h
  ${MBED_OS_DIR}/features/storage/blockdevice/ExhaustibleBlockDevice.cpp
  ${MBED_OS_DIR}/features/storage/blockdevice/FlashSimBlockDevice.h
  ${MBED_OS_DIR}/features/storage/blockdevice/FlashSimBlockDevice.cpp
  ${MBED_OS_DIR}/features/storage/blockdevice/HeapBlockDevice.h
  ${MBED_OS_DIR}/features/storage/blockdevice/HeapBlockDevice.cpp
  ${MBED_OS_DIR}/features/storage/blockdevice/MBRBlockDevice.h
  ${MBED_OS_DIR}/features/storage/blockdevice/MBRBlockDevice.cpp
  ${MBED_OS_DIR}/features/storage/blockdevice/ObservingBlockDevice.h
  ${MBED_OS_DIR}/features/storage/blockdevice/ObservingBlockDevice.cpp
  ${MBED_OS_DIR}/features/storage/blockdevice/ProfilingBlockDevice.h
  ${MBED_OS_DIR}/features/storage/blockdevice/ProfilingBlockDevice.cpp
  ${MBED_OS_DIR}/features/storage/blockdevice/ReadOnlyBlockDevice.h
  ${MBED_OS_DIR}/features/storage/blockdevice/ReadOnlyBlockDevice.cpp
  ${MBED_OS_DIR}/features/storage/blockdevice/SlicingBlockDevice.h
  ${MBED_OS_DIR}/features/storage/blockdevice/SlicingBlockDevice.cpp
)
set(MBED_BLOCKDEVICE_INCLUDE_DIRS
  ${MBED_OS_DIR}/features/storage/blockdevice
)
set(MBED_BLOCKDEVICE_LINK_LIBRARIES
  mbed-platform
)

add_library(mbed-blockdevice STATIC EXCLUDE_FROM_ALL ${MBED_BLOCKDEVICE_SOURCES})
target_include_directories(mbed-blockdevice PUBLIC ${MBED_BLOCKDEVICE_INCLUDE_DIRS})
target_link_libraries(mbed-blockdevice PUBLIC ${MBED_BLOCKDEVICE_LINK_LIBRARIES})

# Mbed OS includes different MbedTLS version, cannot use lib/mbedtls.cmake
# Intentionally using mbed-tls / MBED_TLS naming to avoid name clash
set(MBED_TLS_SOURCES
  ${MBED_OS_DIR}/features/mbedtls/inc/mbedtls/aes.h
  ${MBED_OS_DIR}/features/mbedtls/inc/mbedtls/aesni.h
  ${MBED_OS_DIR}/features/mbedtls/inc/mbedtls/arc4.h
  ${MBED_OS_DIR}/features/mbedtls/inc/mbedtls/aria.h
  ${MBED_OS_DIR}/features/mbedtls/inc/mbedtls/asn1.h
  ${MBED_OS_DIR}/features/mbedtls/inc/mbedtls/asn1write.h
  ${MBED_OS_DIR}/features/mbedtls/inc/mbedtls/base64.h
  ${MBED_OS_DIR}/features/mbedtls/inc/mbedtls/bignum.h
  ${MBED_OS_DIR}/features/mbedtls/inc/mbedtls/blowfish.h
  ${MBED_OS_DIR}/features/mbedtls/inc/mbedtls/bn_mul.h
  ${MBED_OS_DIR}/features/mbedtls/inc/mbedtls/camellia.h
  ${MBED_OS_DIR}/features/mbedtls/inc/mbedtls/ccm.h
  ${MBED_OS_DIR}/features/mbedtls/inc/mbedtls/certs.h
  ${MBED_OS_DIR}/features/mbedtls/inc/mbedtls/chacha20.h
  ${MBED_OS_DIR}/features/mbedtls/inc/mbedtls/chachapoly.h
  ${MBED_OS_DIR}/features/mbedtls/inc/mbedtls/check_config.h
  ${MBED_OS_DIR}/features/mbedtls/inc/mbedtls/cipher.h
  ${MBED_OS_DIR}/features/mbedtls/inc/mbedtls/cipher_internal.h
  ${MBED_OS_DIR}/features/mbedtls/inc/mbedtls/cmac.h
  ${MBED_OS_DIR}/features/mbedtls/inc/mbedtls/compat-1.3.h
  ${MBED_OS_DIR}/features/mbedtls/inc/mbedtls/config.h
  ${MBED_OS_DIR}/features/mbedtls/inc/mbedtls/config-no-entropy.h
  ${MBED_OS_DIR}/features/mbedtls/inc/mbedtls/ctr_drbg.h
  ${MBED_OS_DIR}/features/mbedtls/inc/mbedtls/debug.h
  ${MBED_OS_DIR}/features/mbedtls/inc/mbedtls/des.h
  ${MBED_OS_DIR}/features/mbedtls/inc/mbedtls/dhm.h
  ${MBED_OS_DIR}/features/mbedtls/inc/mbedtls/ecdh.h
  ${MBED_OS_DIR}/features/mbedtls/inc/mbedtls/ecdsa.h
  ${MBED_OS_DIR}/features/mbedtls/inc/mbedtls/ecjpake.h
  ${MBED_OS_DIR}/features/mbedtls/inc/mbedtls/ecp.h
  ${MBED_OS_DIR}/features/mbedtls/inc/mbedtls/ecp_internal.h
  ${MBED_OS_DIR}/features/mbedtls/inc/mbedtls/entropy.h
  ${MBED_OS_DIR}/features/mbedtls/inc/mbedtls/entropy_poll.h
  ${MBED_OS_DIR}/features/mbedtls/inc/mbedtls/error.h
  ${MBED_OS_DIR}/features/mbedtls/inc/mbedtls/gcm.h
  ${MBED_OS_DIR}/features/mbedtls/inc/mbedtls/havege.h
  ${MBED_OS_DIR}/features/mbedtls/inc/mbedtls/hkdf.h
  ${MBED_OS_DIR}/features/mbedtls/inc/mbedtls/hmac_drbg.h
  ${MBED_OS_DIR}/features/mbedtls/inc/mbedtls/md2.h
  ${MBED_OS_DIR}/features/mbedtls/inc/mbedtls/md4.h
  ${MBED_OS_DIR}/features/mbedtls/inc/mbedtls/md5.h
  ${MBED_OS_DIR}/features/mbedtls/inc/mbedtls/md.h
  ${MBED_OS_DIR}/features/mbedtls/inc/mbedtls/md_internal.h
  ${MBED_OS_DIR}/features/mbedtls/inc/mbedtls/memory_buffer_alloc.h
  ${MBED_OS_DIR}/features/mbedtls/inc/mbedtls/net.h
  ${MBED_OS_DIR}/features/mbedtls/inc/mbedtls/net_sockets.h
  ${MBED_OS_DIR}/features/mbedtls/inc/mbedtls/nist_kw.h
  ${MBED_OS_DIR}/features/mbedtls/inc/mbedtls/oid.h
  ${MBED_OS_DIR}/features/mbedtls/inc/mbedtls/padlock.h
  ${MBED_OS_DIR}/features/mbedtls/inc/mbedtls/pem.h
  ${MBED_OS_DIR}/features/mbedtls/inc/mbedtls/pkcs11.h
  ${MBED_OS_DIR}/features/mbedtls/inc/mbedtls/pkcs12.h
  ${MBED_OS_DIR}/features/mbedtls/inc/mbedtls/pkcs5.h
  ${MBED_OS_DIR}/features/mbedtls/inc/mbedtls/pk.h
  ${MBED_OS_DIR}/features/mbedtls/inc/mbedtls/pk_internal.h
  ${MBED_OS_DIR}/features/mbedtls/inc/mbedtls/platform.h
  ${MBED_OS_DIR}/features/mbedtls/inc/mbedtls/platform_time.h
  ${MBED_OS_DIR}/features/mbedtls/inc/mbedtls/platform_util.h
  ${MBED_OS_DIR}/features/mbedtls/inc/mbedtls/poly1305.h
  ${MBED_OS_DIR}/features/mbedtls/inc/mbedtls/psa_util.h
  ${MBED_OS_DIR}/features/mbedtls/inc/mbedtls/ripemd160.h
  ${MBED_OS_DIR}/features/mbedtls/inc/mbedtls/rsa.h
  ${MBED_OS_DIR}/features/mbedtls/inc/mbedtls/rsa_internal.h
  ${MBED_OS_DIR}/features/mbedtls/inc/mbedtls/sha1.h
  ${MBED_OS_DIR}/features/mbedtls/inc/mbedtls/sha256.h
  ${MBED_OS_DIR}/features/mbedtls/inc/mbedtls/sha512.h
  ${MBED_OS_DIR}/features/mbedtls/inc/mbedtls/ssl_cache.h
  ${MBED_OS_DIR}/features/mbedtls/inc/mbedtls/ssl_ciphersuites.h
  ${MBED_OS_DIR}/features/mbedtls/inc/mbedtls/ssl_cookie.h
  ${MBED_OS_DIR}/features/mbedtls/inc/mbedtls/ssl.h
  ${MBED_OS_DIR}/features/mbedtls/inc/mbedtls/ssl_internal.h
  ${MBED_OS_DIR}/features/mbedtls/inc/mbedtls/ssl_ticket.h
  ${MBED_OS_DIR}/features/mbedtls/inc/mbedtls/threading.h
  ${MBED_OS_DIR}/features/mbedtls/inc/mbedtls/timing.h
  ${MBED_OS_DIR}/features/mbedtls/inc/mbedtls/version.h
  ${MBED_OS_DIR}/features/mbedtls/inc/mbedtls/x509_crl.h
  ${MBED_OS_DIR}/features/mbedtls/inc/mbedtls/x509_crt.h
  ${MBED_OS_DIR}/features/mbedtls/inc/mbedtls/x509_csr.h
  ${MBED_OS_DIR}/features/mbedtls/inc/mbedtls/x509.h
  ${MBED_OS_DIR}/features/mbedtls/inc/mbedtls/xtea.h
  ${MBED_OS_DIR}/features/mbedtls/src/aes.c
  ${MBED_OS_DIR}/features/mbedtls/src/aesni.c
  ${MBED_OS_DIR}/features/mbedtls/src/arc4.c
  ${MBED_OS_DIR}/features/mbedtls/src/aria.c
  ${MBED_OS_DIR}/features/mbedtls/src/asn1parse.c
  ${MBED_OS_DIR}/features/mbedtls/src/asn1write.c
  ${MBED_OS_DIR}/features/mbedtls/src/base64.c
  ${MBED_OS_DIR}/features/mbedtls/src/bignum.c
  ${MBED_OS_DIR}/features/mbedtls/src/blowfish.c
  ${MBED_OS_DIR}/features/mbedtls/src/camellia.c
  ${MBED_OS_DIR}/features/mbedtls/src/ccm.c
  ${MBED_OS_DIR}/features/mbedtls/src/certs.c
  ${MBED_OS_DIR}/features/mbedtls/src/chacha20.c
  ${MBED_OS_DIR}/features/mbedtls/src/chachapoly.c
  ${MBED_OS_DIR}/features/mbedtls/src/cipher.c
  ${MBED_OS_DIR}/features/mbedtls/src/cipher_wrap.c
  ${MBED_OS_DIR}/features/mbedtls/src/cmac.c
  ${MBED_OS_DIR}/features/mbedtls/src/ctr_drbg.c
  ${MBED_OS_DIR}/features/mbedtls/src/debug.c
  ${MBED_OS_DIR}/features/mbedtls/src/des.c
  ${MBED_OS_DIR}/features/mbedtls/src/dhm.c
  ${MBED_OS_DIR}/features/mbedtls/src/ecdh.c
  ${MBED_OS_DIR}/features/mbedtls/src/ecdsa.c
  ${MBED_OS_DIR}/features/mbedtls/src/ecjpake.c
  ${MBED_OS_DIR}/features/mbedtls/src/ecp.c
  ${MBED_OS_DIR}/features/mbedtls/src/ecp_curves.c
  ${MBED_OS_DIR}/features/mbedtls/src/entropy.c
  ${MBED_OS_DIR}/features/mbedtls/src/entropy_poll.c
  ${MBED_OS_DIR}/features/mbedtls/src/error.c
  ${MBED_OS_DIR}/features/mbedtls/src/gcm.c
  ${MBED_OS_DIR}/features/mbedtls/src/havege.c
  ${MBED_OS_DIR}/features/mbedtls/src/hkdf.c
  ${MBED_OS_DIR}/features/mbedtls/src/hmac_drbg.c
  ${MBED_OS_DIR}/features/mbedtls/src/md2.c
  ${MBED_OS_DIR}/features/mbedtls/src/md4.c
  ${MBED_OS_DIR}/features/mbedtls/src/md5.c
  ${MBED_OS_DIR}/features/mbedtls/src/md.c
  ${MBED_OS_DIR}/features/mbedtls/src/memory_buffer_alloc.c
  ${MBED_OS_DIR}/features/mbedtls/src/net_sockets.c
  ${MBED_OS_DIR}/features/mbedtls/src/nist_kw.c
  ${MBED_OS_DIR}/features/mbedtls/src/oid.c
  ${MBED_OS_DIR}/features/mbedtls/src/padlock.c
  ${MBED_OS_DIR}/features/mbedtls/src/pem.c
  ${MBED_OS_DIR}/features/mbedtls/src/pk.c
  ${MBED_OS_DIR}/features/mbedtls/src/pkcs11.c
  ${MBED_OS_DIR}/features/mbedtls/src/pkcs12.c
  ${MBED_OS_DIR}/features/mbedtls/src/pkcs5.c
  ${MBED_OS_DIR}/features/mbedtls/src/pkparse.c
  ${MBED_OS_DIR}/features/mbedtls/src/pk_wrap.c
  ${MBED_OS_DIR}/features/mbedtls/src/pkwrite.c
  ${MBED_OS_DIR}/features/mbedtls/src/platform.c
  ${MBED_OS_DIR}/features/mbedtls/src/platform_util.c
  ${MBED_OS_DIR}/features/mbedtls/src/poly1305.c
  ${MBED_OS_DIR}/features/mbedtls/src/ripemd160.c
  ${MBED_OS_DIR}/features/mbedtls/src/rsa.c
  ${MBED_OS_DIR}/features/mbedtls/src/rsa_internal.c
  ${MBED_OS_DIR}/features/mbedtls/src/sha1.c
  ${MBED_OS_DIR}/features/mbedtls/src/sha256.c
  ${MBED_OS_DIR}/features/mbedtls/src/sha512.c
  ${MBED_OS_DIR}/features/mbedtls/src/ssl_cache.c
  ${MBED_OS_DIR}/features/mbedtls/src/ssl_ciphersuites.c
  ${MBED_OS_DIR}/features/mbedtls/src/ssl_cli.c
  ${MBED_OS_DIR}/features/mbedtls/src/ssl_cookie.c
  ${MBED_OS_DIR}/features/mbedtls/src/ssl_msg.c
  ${MBED_OS_DIR}/features/mbedtls/src/ssl_srv.c
  ${MBED_OS_DIR}/features/mbedtls/src/ssl_ticket.c
  ${MBED_OS_DIR}/features/mbedtls/src/ssl_tls.c
  ${MBED_OS_DIR}/features/mbedtls/src/threading.c
  ${MBED_OS_DIR}/features/mbedtls/src/timing.c
  ${MBED_OS_DIR}/features/mbedtls/src/version.c
  ${MBED_OS_DIR}/features/mbedtls/src/version_features.c
  ${MBED_OS_DIR}/features/mbedtls/src/x509.c
  ${MBED_OS_DIR}/features/mbedtls/src/x509_create.c
  ${MBED_OS_DIR}/features/mbedtls/src/x509_crl.c
  ${MBED_OS_DIR}/features/mbedtls/src/x509_crt.c
  ${MBED_OS_DIR}/features/mbedtls/src/x509_csr.c
  ${MBED_OS_DIR}/features/mbedtls/src/x509write_crt.c
  ${MBED_OS_DIR}/features/mbedtls/src/x509write_csr.c
  ${MBED_OS_DIR}/features/mbedtls/src/xtea.c
)
set(MBED_TLS_INCLUDE_DIRS
  ${MBED_OS_DIR}/features/mbedtls
  ${MBED_OS_DIR}/features/mbedtls/inc
  # BUG: config.h should not be included directly
  ${MBED_OS_DIR}/features/mbedtls/inc/mbedtls
  # TODO: enable HW acceleration
  #${MBED_OS_DIR}/features/mbedtls/targets/TARGET_Cypress/TARGET_MXCRYPTO
)
set(MBED_TLS_DEFINES
  -DMBEDTLS_USER_CONFIG_FILE="${PORT_DIR}/mbedtls_user_config.h"
)
set(MBED_TLS_LINK_LIBRARIES
  mbed-target
)

add_library(mbed-tls STATIC EXCLUDE_FROM_ALL ${MBED_TLS_SOURCES})
target_include_directories(mbed-tls PUBLIC ${MBED_TLS_INCLUDE_DIRS})
target_compile_definitions(mbed-tls PUBLIC ${MBED_TLS_DEFINES})
target_link_libraries(mbed-tls PUBLIC ${MBED_TLS_LINK_LIBRARIES})

set(MBED_TRACE_SOURCES
  ${MBED_OS_DIR}/features/frameworks/mbed-trace/mbed-trace/mbed_trace.h
  ${MBED_OS_DIR}/features/frameworks/mbed-trace/source/mbed_trace.c
)
set(MBED_TRACE_INCLUDE_DIRS
  ${MBED_OS_DIR}/features/frameworks/mbed-trace
  ${MBED_OS_DIR}/features/frameworks/mbed-trace/mbed-trace
)
set(MBED_TRACE_DEFINES
  # Uncomment to actually enable tracing
  #MBED_CONF_MBED_TRACE_ENABLE
  MBED_CONF_MBED_TRACE_FEA_IPV6=0
)
set(MBED_TRACE_LINK_LIBRARIES
  mbed-platform
)

add_library(mbed-trace STATIC EXCLUDE_FROM_ALL ${MBED_TRACE_SOURCES})
target_include_directories(mbed-trace PUBLIC ${MBED_TRACE_INCLUDE_DIRS})
target_compile_definitions(mbed-trace PUBLIC ${MBED_TRACE_DEFINES})
target_link_libraries(mbed-trace PUBLIC ${MBED_TRACE_LINK_LIBRARIES})

set(MBED_LITTLEFS_SOURCES
  ${MBED_OS_DIR}/features/storage/filesystem/littlefs/LittleFileSystem.h
  ${MBED_OS_DIR}/features/storage/filesystem/littlefs/LittleFileSystem.cpp
  ${MBED_OS_DIR}/features/storage/filesystem/littlefs/littlefs/lfs.h
  ${MBED_OS_DIR}/features/storage/filesystem/littlefs/littlefs/lfs.c
  ${MBED_OS_DIR}/features/storage/filesystem/littlefs/littlefs/lfs_util.h
  ${MBED_OS_DIR}/features/storage/filesystem/littlefs/littlefs/lfs_util.h
  # FIXME: dirent.h:72:15: error: unknown type name 'DIR'
  #${MBED_OS_DIR}/features/storage/filesystem/littlefs/littlefs/emubd/lfs_emubd.h
  #${MBED_OS_DIR}/features/storage/filesystem/littlefs/littlefs/emubd/lfs_emubd.c
)
set(MBED_LITTLEFS_INCLUDE_DIRS
  ${MBED_OS_DIR}/features/storage/filesystem/littlefs
  ${MBED_OS_DIR}/features/storage/filesystem/littlefs/littlefs
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
  mbed-drivers
)

add_library(mbed-littlefs STATIC EXCLUDE_FROM_ALL ${MBED_LITTLEFS_SOURCES})
target_include_directories(mbed-littlefs PUBLIC ${MBED_LITTLEFS_INCLUDE_DIRS})
target_compile_definitions(mbed-littlefs PUBLIC ${MBED_LITTLEFS_DEFINES})
target_link_libraries(mbed-littlefs PUBLIC ${MBED_LITTLEFS_LINK_LIBRARIES})

set(MBED_FATFS_SOURCES
  ${MBED_OS_DIR}/features/storage/filesystem/fat/FATFileSystem.h
  ${MBED_OS_DIR}/features/storage/filesystem/fat/FATFileSystem.cpp
  ${MBED_OS_DIR}/features/storage/filesystem/fat/ChaN/diskio.h
  ${MBED_OS_DIR}/features/storage/filesystem/fat/ChaN/ff.h
  ${MBED_OS_DIR}/features/storage/filesystem/fat/ChaN/ff.cpp
  ${MBED_OS_DIR}/features/storage/filesystem/fat/ChaN/ffconf.h
  ${MBED_OS_DIR}/features/storage/filesystem/fat/ChaN/ffunicode.cpp
  ${MBED_OS_DIR}/features/storage/filesystem/fat/ChaN/integer.h
)
set(MBED_FATFS_INCLUDE_DIRS
  ${MBED_OS_DIR}/features/storage/filesystem/fat
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
  MBED_CONF_FAT_CHAN_FF_NORTC_MON=1
  MBED_CONF_FAT_CHAN_FF_NORTC_MDAY=1
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

set(MBED_FLASHIAP_SOURCES
  ${MBED_OS_DIR}/components/storage/blockdevice/COMPONENT_FLASHIAP/FlashIAPBlockDevice.h
  ${MBED_OS_DIR}/components/storage/blockdevice/COMPONENT_FLASHIAP/FlashIAPBlockDevice.cpp
  ${MBED_OS_DIR}/components/storage/blockdevice/COMPONENT_FLASHIAP/COMMON/fslittle_debug.h
  ${MBED_OS_DIR}/components/storage/blockdevice/COMPONENT_FLASHIAP/COMMON/fslittle_test.h
  ${MBED_OS_DIR}/components/storage/blockdevice/COMPONENT_FLASHIAP/COMMON/fslittle_test.c
)
set(MBED_FLASHIAP_INCLUDE_DIRS
  ${MBED_OS_DIR}/components/storage/blockdevice/COMPONENT_FLASHIAP
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

set(MBED_KVSTORE_SOURCES
  ${MBED_OS_DIR}/features/storage/kvstore/include/KVStore.h
  ${MBED_OS_DIR}/features/storage/kvstore/conf/kv_config.h
  ${MBED_OS_DIR}/features/storage/kvstore/conf/kv_config.cpp
  ${MBED_OS_DIR}/features/storage/kvstore/direct_access_devicekey/DirectAccessDevicekey.h
  ${MBED_OS_DIR}/features/storage/kvstore/direct_access_devicekey/DirectAccessDevicekey.cpp
  ${MBED_OS_DIR}/features/storage/kvstore/filesystemstore/FileSystemStore.h
  ${MBED_OS_DIR}/features/storage/kvstore/filesystemstore/FileSystemStore.cpp
  ${MBED_OS_DIR}/features/storage/kvstore/global_api/kvstore_global_api.h
  ${MBED_OS_DIR}/features/storage/kvstore/global_api/kvstore_global_api.cpp
  ${MBED_OS_DIR}/features/storage/kvstore/kv_map/KVMap.h
  ${MBED_OS_DIR}/features/storage/kvstore/kv_map/KVMap.cpp
  ${MBED_OS_DIR}/features/storage/kvstore/securestore/SecureStore.h
  ${MBED_OS_DIR}/features/storage/kvstore/securestore/SecureStore.cpp
  ${MBED_OS_DIR}/features/storage/kvstore/tdbstore/TDBStore.h
  ${MBED_OS_DIR}/features/storage/kvstore/tdbstore/TDBStore.cpp
)
set(MBED_KVSTORE_INCLUDE_DIRS
  ${MBED_OS_DIR}/features/storage/kvstore/conf
  ${MBED_OS_DIR}/features/storage/kvstore/include
  ${MBED_OS_DIR}/features/storage/kvstore/kv_map
  ${MBED_OS_DIR}/features/storage/kvstore/tdbstore
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

set(MBED_QCBOR_SOURCES
  ${MBED_OS_DIR}/components/TARGET_PSA/services/attestation/qcbor/inc/UsefulBuf.h
  ${MBED_OS_DIR}/components/TARGET_PSA/services/attestation/qcbor/inc/qcbor.h
  ${MBED_OS_DIR}/components/TARGET_PSA/services/attestation/qcbor/inc/useful_buf.h
  ${MBED_OS_DIR}/components/TARGET_PSA/services/attestation/qcbor/src/UsefulBuf.c
  ${MBED_OS_DIR}/components/TARGET_PSA/services/attestation/qcbor/src/ieee754.c
  ${MBED_OS_DIR}/components/TARGET_PSA/services/attestation/qcbor/src/ieee754.h
  ${MBED_OS_DIR}/components/TARGET_PSA/services/attestation/qcbor/src/qcbor_decode.c
  ${MBED_OS_DIR}/components/TARGET_PSA/services/attestation/qcbor/src/qcbor_encode.c
)
set(MBED_QCBOR_INCLUDE_DIRS
  ${MBED_OS_DIR}/components/TARGET_PSA/services/attestation/qcbor/inc/
)

add_library(mbed-qcbor STATIC EXCLUDE_FROM_ALL ${MBED_QCBOR_SOURCES})
target_include_directories(mbed-qcbor PUBLIC ${MBED_QCBOR_INCLUDE_DIRS})

set(MBED_TCOSE_SOURCES
  ${MBED_OS_DIR}/components/TARGET_PSA/services/attestation/COMPONENT_PSA_SRV_IMPL/tfm_impl/t_cose/inc/t_cose_common.h
  ${MBED_OS_DIR}/components/TARGET_PSA/services/attestation/COMPONENT_PSA_SRV_IMPL/tfm_impl/t_cose/inc/t_cose_sign1_sign.h
  ${MBED_OS_DIR}/components/TARGET_PSA/services/attestation/COMPONENT_PSA_SRV_IMPL/tfm_impl/t_cose/src/t_cose_crypto.h
  ${MBED_OS_DIR}/components/TARGET_PSA/services/attestation/COMPONENT_PSA_SRV_IMPL/tfm_impl/t_cose/src/t_cose_defines.h
  ${MBED_OS_DIR}/components/TARGET_PSA/services/attestation/COMPONENT_PSA_SRV_IMPL/tfm_impl/t_cose/src/t_cose_sign1_sign.c
  ${MBED_OS_DIR}/components/TARGET_PSA/services/attestation/COMPONENT_PSA_SRV_IMPL/tfm_impl/t_cose/src/t_cose_util.h
  ${MBED_OS_DIR}/components/TARGET_PSA/services/attestation/COMPONENT_PSA_SRV_IMPL/tfm_impl/t_cose/src/t_cose_util.c
)
set(MBED_TCOSE_INCLUDE_DIRS
  ${MBED_OS_DIR}/components/TARGET_PSA/services/attestation/COMPONENT_PSA_SRV_IMPL/tfm_impl/t_cose/inc
  ${MBED_OS_DIR}/components/TARGET_PSA/services/attestation/COMPONENT_PSA_SRV_IMPL/tfm_impl/t_cose/src
)
set(MBED_TCOSE_LINK_LIBRARIES
  mbed-qcbor
)

add_library(mbed-tcose STATIC EXCLUDE_FROM_ALL ${MBED_TCOSE_SOURCES})
target_include_directories(mbed-tcose PUBLIC ${MBED_TCOSE_INCLUDE_DIRS})
target_link_libraries(mbed-tcose PUBLIC ${MBED_TCOSE_LINK_LIBRARIES})

set(MBED_PSA_SOURCES
  ${MBED_OS_DIR}/components/TARGET_PSA/inc/psa/client.h
  ${MBED_OS_DIR}/components/TARGET_PSA/inc/psa/error.h
  ${MBED_OS_DIR}/components/TARGET_PSA/inc/psa/internal_trusted_storage.h
  ${MBED_OS_DIR}/components/TARGET_PSA/inc/psa/lifecycle.h
  ${MBED_OS_DIR}/components/TARGET_PSA/inc/psa/protected_storage.h
  ${MBED_OS_DIR}/components/TARGET_PSA/inc/psa/service.h
  ${MBED_OS_DIR}/components/TARGET_PSA/inc/psa/storage_common.h
  ${MBED_OS_DIR}/components/TARGET_PSA/inc/psa/tfm_platform_api.h
  ${MBED_OS_DIR}/components/TARGET_PSA/inc/psa_manifest/sid.h
  ${MBED_OS_DIR}/components/TARGET_PSA/services/attestation/attestation.h
  ${MBED_OS_DIR}/components/TARGET_PSA/services/attestation/psa_attest_inject_key.h
  ${MBED_OS_DIR}/components/TARGET_PSA/services/attestation/psa_initial_attestation_api.h
  ${MBED_OS_DIR}/components/TARGET_PSA/services/attestation/COMPONENT_PSA_SRV_EMUL/psa_attest_inject_key.c
  ${MBED_OS_DIR}/components/TARGET_PSA/services/attestation/COMPONENT_PSA_SRV_EMUL/psa_initial_attestation_api.c
  ${MBED_OS_DIR}/components/TARGET_PSA/services/attestation/COMPONENT_PSA_SRV_IMPL/attest_boot_status_loader.c
  ${MBED_OS_DIR}/components/TARGET_PSA/services/attestation/COMPONENT_PSA_SRV_IMPL/attest_crypto.c
  ${MBED_OS_DIR}/components/TARGET_PSA/services/attestation/COMPONENT_PSA_SRV_IMPL/attest_crypto_keys.c
  ${MBED_OS_DIR}/components/TARGET_PSA/services/attestation/COMPONENT_PSA_SRV_IMPL/attest_iat_claims_loader.c
  ${MBED_OS_DIR}/components/TARGET_PSA/services/attestation/COMPONENT_PSA_SRV_IMPL/attestation_bootloader_data.h
  ${MBED_OS_DIR}/components/TARGET_PSA/services/attestation/COMPONENT_PSA_SRV_IMPL/attestation_bootloader_data.c
  ${MBED_OS_DIR}/components/TARGET_PSA/services/attestation/COMPONENT_PSA_SRV_IMPL/psa_attestation_stubs.c
  ${MBED_OS_DIR}/components/TARGET_PSA/services/attestation/COMPONENT_PSA_SRV_IMPL/psa_inject_attestation_key_impl.h
  ${MBED_OS_DIR}/components/TARGET_PSA/services/attestation/COMPONENT_PSA_SRV_IMPL/psa_inject_attestation_key_impl.c
  ${MBED_OS_DIR}/components/TARGET_PSA/services/attestation/COMPONENT_PSA_SRV_IMPL/tfm_impl/attest_eat_defines.h
  ${MBED_OS_DIR}/components/TARGET_PSA/services/attestation/COMPONENT_PSA_SRV_IMPL/tfm_impl/attest_token.h
  ${MBED_OS_DIR}/components/TARGET_PSA/services/attestation/COMPONENT_PSA_SRV_IMPL/tfm_impl/attest_token.c
  ${MBED_OS_DIR}/components/TARGET_PSA/services/attestation/COMPONENT_PSA_SRV_IMPL/tfm_impl/attestation_core.c
  ${MBED_OS_DIR}/components/TARGET_PSA/services/attestation/COMPONENT_PSA_SRV_IMPL/tfm_impl/tfm_attest_hal.h
  ${MBED_OS_DIR}/components/TARGET_PSA/services/attestation/COMPONENT_PSA_SRV_IMPL/tfm_impl/tfm_boot_status.h
  ${MBED_OS_DIR}/components/TARGET_PSA/services/attestation/COMPONENT_PSA_SRV_IMPL/tfm_impl/tfm_plat_boot_seed.h
  ${MBED_OS_DIR}/components/TARGET_PSA/services/attestation/COMPONENT_PSA_SRV_IMPL/tfm_impl/tfm_plat_crypto_keys.h
  ${MBED_OS_DIR}/components/TARGET_PSA/services/attestation/COMPONENT_PSA_SRV_IMPL/tfm_impl/tfm_plat_defs.h
  ${MBED_OS_DIR}/components/TARGET_PSA/services/attestation/COMPONENT_PSA_SRV_IMPL/tfm_impl/tfm_plat_device_id.h
  ${MBED_OS_DIR}/components/TARGET_PSA/services/inc/autogen_sid.h
  ${MBED_OS_DIR}/components/TARGET_PSA/services/inc/mbed_spm_partitions.h
  ${MBED_OS_DIR}/components/TARGET_PSA/services/platform/COMPONENT_PSA_SRV_EMUL/platform_emul.c
  ${MBED_OS_DIR}/components/TARGET_PSA/services/platform/COMPONENT_PSA_SRV_IMPL/platform_srv_impl.h
  ${MBED_OS_DIR}/components/TARGET_PSA/services/platform/COMPONENT_PSA_SRV_IMPL/platform_srv_impl.c
  ${MBED_OS_DIR}/components/TARGET_PSA/services/storage/common/psa_storage_common_impl.cpp
  ${MBED_OS_DIR}/components/TARGET_PSA/services/storage/its/COMPONENT_PSA_SRV_EMUL/psa_prot_internal_storage.cpp
  ${MBED_OS_DIR}/components/TARGET_PSA/services/storage/its/COMPONENT_PSA_SRV_IMPL/pits_impl.h
  ${MBED_OS_DIR}/components/TARGET_PSA/services/storage/its/COMPONENT_PSA_SRV_IMPL/pits_impl.cpp
  ${MBED_OS_DIR}/features/mbedtls/platform/COMPONENT_PSA_SRV_IMPL/psa_crypto.c
)
set(MBED_PSA_INCLUDE_DIRS
  ${MBED_OS_DIR}/features/mbedtls/platform/COMPONENT_PSA_SRV_IMPL/COMPONENT_NSPE
  ${MBED_OS_DIR}/components/TARGET_PSA/inc
  ${MBED_OS_DIR}/components/TARGET_PSA/inc/psa
  ${MBED_OS_DIR}/components/TARGET_PSA/services/attestation/
  ${MBED_OS_DIR}/components/TARGET_PSA/services/attestation/COMPONENT_PSA_SRV_IMPL
  ${MBED_OS_DIR}/components/TARGET_PSA/services/attestation/COMPONENT_PSA_SRV_IMPL/tfm_impl
  ${MBED_OS_DIR}/components/TARGET_PSA/services/inc
  ${MBED_OS_DIR}/components/TARGET_PSA/services/platform/COMPONENT_PSA_SRV_IMPL
  ${MBED_OS_DIR}/components/TARGET_PSA/services/storage/common
  ${MBED_OS_DIR}/components/TARGET_PSA/services/storage/its
  ${MBED_OS_DIR}/components/TARGET_PSA/services/storage/its/COMPONENT_PSA_SRV_IMPL
  ${MBED_OS_DIR}/components/TARGET_PSA/TARGET_TFM
  ${MBED_OS_DIR}/components/TARGET_PSA/TARGET_TFM/interface/include
)
set(MBED_PSA_DEFINES
  TARGET_PSA
)
set(MBED_PSA_LINK_LIBRARIES
  mbed-platform
  mbed-tls
  mbed-kvstore
  mbed-tcose
)

add_library(mbed-psa STATIC EXCLUDE_FROM_ALL ${MBED_PSA_SOURCES})
target_include_directories(mbed-psa PUBLIC ${MBED_PSA_INCLUDE_DIRS})
target_compile_definitions(mbed-psa PUBLIC ${MBED_PSA_DEFINES})
target_link_libraries(mbed-psa PUBLIC ${MBED_PSA_LINK_LIBRARIES})

# t_cose implementation depends on APIs provided by attest_crypto.c
target_link_libraries(mbed-tcose PRIVATE mbed-psa)

set(MBED_TLS_PLATFORM_SOURCES
  ${MBED_OS_DIR}/features/mbedtls/inc/psa/crypto.h
  ${MBED_OS_DIR}/features/mbedtls/inc/psa/crypto_accel_driver.h
  ${MBED_OS_DIR}/features/mbedtls/inc/psa/crypto_compat.h
  ${MBED_OS_DIR}/features/mbedtls/inc/psa/crypto_driver_common.h
  ${MBED_OS_DIR}/features/mbedtls/inc/psa/crypto_entropy_driver.h
  ${MBED_OS_DIR}/features/mbedtls/inc/psa/crypto_extra.h
  ${MBED_OS_DIR}/features/mbedtls/inc/psa/crypto_platform.h
  ${MBED_OS_DIR}/features/mbedtls/inc/psa/crypto_se_driver.h
  ${MBED_OS_DIR}/features/mbedtls/inc/psa/crypto_sizes.h
  ${MBED_OS_DIR}/features/mbedtls/inc/psa/crypto_types.h
  ${MBED_OS_DIR}/features/mbedtls/inc/psa/crypto_values.h
  ${MBED_OS_DIR}/features/mbedtls/platform/inc/platform_alt.h
  ${MBED_OS_DIR}/features/mbedtls/platform/inc/platform_mbed.h
  ${MBED_OS_DIR}/features/mbedtls/platform/inc/shared_rng.h
  ${MBED_OS_DIR}/features/mbedtls/platform/src/mbed_trng.cpp
  ${MBED_OS_DIR}/features/mbedtls/platform/src/platform_alt.cpp
  ${MBED_OS_DIR}/features/mbedtls/platform/src/shared_rng.cpp
  ${MBED_OS_DIR}/features/mbedtls/platform/TARGET_PSA/COMPONENT_NSPE/src/psa_hrng.c
  #${MBED_OS_DIR}/features/mbedtls/platform/TARGET_PSA/COMPONENT_PSA_SRV_IMPL/inc/default_random_seed.h
  #${MBED_OS_DIR}/features/mbedtls/platform/TARGET_PSA/COMPONENT_PSA_SRV_IMPL/src/default_random_seed.cpp
  ${MBED_OS_DIR}/features/mbedtls/platform/COMPONENT_PSA_SRV_IMPL/psa_crypto.c
  ${MBED_OS_DIR}/features/mbedtls/platform/COMPONENT_PSA_SRV_IMPL/psa_crypto_core.h
  ${MBED_OS_DIR}/features/mbedtls/platform/COMPONENT_PSA_SRV_IMPL/psa_crypto_invasive.h
  ${MBED_OS_DIR}/features/mbedtls/platform/COMPONENT_PSA_SRV_IMPL/psa_crypto_its.h
  ${MBED_OS_DIR}/features/mbedtls/platform/COMPONENT_PSA_SRV_IMPL/psa_crypto_se.c
  ${MBED_OS_DIR}/features/mbedtls/platform/COMPONENT_PSA_SRV_IMPL/psa_crypto_se.h
  ${MBED_OS_DIR}/features/mbedtls/platform/COMPONENT_PSA_SRV_IMPL/psa_crypto_service_integration.h
  ${MBED_OS_DIR}/features/mbedtls/platform/COMPONENT_PSA_SRV_IMPL/psa_crypto_slot_management.c
  ${MBED_OS_DIR}/features/mbedtls/platform/COMPONENT_PSA_SRV_IMPL/psa_crypto_slot_management.h
  ${MBED_OS_DIR}/features/mbedtls/platform/COMPONENT_PSA_SRV_IMPL/psa_crypto_storage.c
  ${MBED_OS_DIR}/features/mbedtls/platform/COMPONENT_PSA_SRV_IMPL/psa_crypto_storage.h
  #${MBED_OS_DIR}/features/mbedtls/platform/COMPONENT_PSA_SRV_IMPL/psa_its_file.c
)
set(MBED_TLS_PLATFORM_INCLUDE_DIRS
  ${MBED_OS_DIR}/features/mbedtls/inc/psa
  ${MBED_OS_DIR}/features/mbedtls/platform/inc
  ${MBED_OS_DIR}/features/mbedtls/platform/TARGET_PSA/COMPONENT_PSA_SRV_IMPL/inc
  ${MBED_OS_DIR}/features/mbedtls/platform/COMPONENT_PSA_SRV_IMPL
)
set(MBED_TLS_PLATFORM_DEFINES
  # TBD
)
set(MBED_TLS_PLATFORM_LINK_LIBRARIES
  mbed-psa
)

add_library(mbed-tls-platform STATIC EXCLUDE_FROM_ALL ${MBED_TLS_PLATFORM_SOURCES})
target_include_directories(mbed-tls-platform PUBLIC ${MBED_TLS_PLATFORM_INCLUDE_DIRS})
target_compile_definitions(mbed-tls-platform PUBLIC ${MBED_TLS_PLATFORM_DEFINES})
target_link_libraries(mbed-tls-platform PUBLIC ${MBED_TLS_PLATFORM_LINK_LIBRARIES})
