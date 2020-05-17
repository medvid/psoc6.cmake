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

# Mbed OS includes different MbedTLS version, cannot use lib/mbedtls
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
  ${MBED_OS_DIR}/features/mbedtls/inc/psa
  ${MBED_OS_DIR}/features/mbedtls/platform/COMPONENT_PSA_SRV_IMPL/COMPONENT_NSPE
)
set(MBED_TLS_DEFINES
  -DMBEDTLS_USER_CONFIG_FILE="${PORT_DIR}/mbedtls_user_config.h"
)
set(MBED_TLS_LINK_LIBRARIES
  mbed-platform
)

add_library(mbed-tls STATIC EXCLUDE_FROM_ALL ${MBED_TLS_SOURCES})
target_include_directories(mbed-tls PUBLIC ${MBED_TLS_INCLUDE_DIRS})
target_compile_definitions(mbed-tls PUBLIC ${MBED_TLS_DEFINES})
target_link_libraries(mbed-tls PUBLIC ${MBED_TLS_LINK_LIBRARIES})

set(MBED_TLS_PLATFORM_SOURCES
  ${MBED_OS_DIR}/features/mbedtls/platform/inc/platform_alt.h
  ${MBED_OS_DIR}/features/mbedtls/platform/inc/platform_mbed.h
  ${MBED_OS_DIR}/features/mbedtls/platform/inc/shared_rng.h
  ${MBED_OS_DIR}/features/mbedtls/platform/src/mbed_trng.cpp
  ${MBED_OS_DIR}/features/mbedtls/platform/src/platform_alt.cpp
  ${MBED_OS_DIR}/features/mbedtls/platform/src/shared_rng.cpp
  ${MBED_OS_DIR}/features/mbedtls/platform/TARGET_PSA/COMPONENT_NSPE/src/psa_hrng.c
  ${MBED_OS_DIR}/features/mbedtls/platform/TARGET_PSA/COMPONENT_PSA_SRV_IMPL/inc/default_random_seed.h
  ${MBED_OS_DIR}/features/mbedtls/platform/TARGET_PSA/COMPONENT_PSA_SRV_IMPL/src/default_random_seed.cpp
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
  ${MBED_OS_DIR}/features/mbedtls/platform/COMPONENT_PSA_SRV_IMPL/psa_its_file.c
  ${MBED_OS_DIR}/features/mbedtls/platform/COMPONENT_PSA_SRV_IMPL/COMPONENT_NSPE/crypto_struct.h
)
set(MBED_TLS_PLATFORM_INCLUDE_DIRS
  ${MBED_OS_DIR}/features/mbedtls/platform/inc
  ${MBED_OS_DIR}/features/mbedtls/platform/TARGET_PSA/COMPONENT_PSA_SRV_IMPL/inc
  ${MBED_OS_DIR}/features/mbedtls/platform/COMPONENT_PSA_SRV_IMPL
  ${MBED_OS_DIR}/components/TARGET_PSA/inc
  ${MBED_OS_DIR}/components/TARGET_PSA/inc/psa
  ${MBED_OS_DIR}/components/TARGET_PSA/services/storage/its
)
set(MBED_TLS_PLATFORM_DEFINES
  # TBD
)
set(MBED_TLS_PLATFORM_LINK_LIBRARIES
  mbed-tls
)

add_library(mbed-tls-platform STATIC EXCLUDE_FROM_ALL ${MBED_TLS_PLATFORM_SOURCES})
target_include_directories(mbed-tls-platform PUBLIC ${MBED_TLS_PLATFORM_INCLUDE_DIRS})
target_compile_definitions(mbed-tls-platform PUBLIC ${MBED_TLS_PLATFORM_DEFINES})
target_link_libraries(mbed-tls-platform PUBLIC ${MBED_TLS_PLATFORM_LINK_LIBRARIES})
