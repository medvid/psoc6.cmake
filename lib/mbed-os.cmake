psoc6_load_library(
  NAME mbed-os
  URL  https://github.com/ARMmbed/mbed-os
  TAG  mbed-os-6.6.0
)

add_library(mbed-core INTERFACE EXCLUDE_FROM_ALL)

add_library(mbed-os STATIC EXCLUDE_FROM_ALL
  ${MBED_OS_DIR}/targets/TARGET_Cypress/TARGET_PSOC6/cy_analogin_api.c
  ${MBED_OS_DIR}/targets/TARGET_Cypress/TARGET_PSOC6/cy_analogout_api.c
  ${MBED_OS_DIR}/targets/TARGET_Cypress/TARGET_PSOC6/cy_crc_api.c
  ${MBED_OS_DIR}/targets/TARGET_Cypress/TARGET_PSOC6/cy_flash_api.c
  ${MBED_OS_DIR}/targets/TARGET_Cypress/TARGET_PSOC6/cy_gpio_api.c
  ${MBED_OS_DIR}/targets/TARGET_Cypress/TARGET_PSOC6/cy_gpio_irq_api.c
  ${MBED_OS_DIR}/targets/TARGET_Cypress/TARGET_PSOC6/cy_i2c_api.c
  ${MBED_OS_DIR}/targets/TARGET_Cypress/TARGET_PSOC6/cy_lp_ticker_api.c
  ${MBED_OS_DIR}/targets/TARGET_Cypress/TARGET_PSOC6/cy_port_api.c
  ${MBED_OS_DIR}/targets/TARGET_Cypress/TARGET_PSOC6/cy_pwmout_api.c
  ${MBED_OS_DIR}/targets/TARGET_Cypress/TARGET_PSOC6/cy_qspi_api.c
  ${MBED_OS_DIR}/targets/TARGET_Cypress/TARGET_PSOC6/cy_reset_reason_api.c
  ${MBED_OS_DIR}/targets/TARGET_Cypress/TARGET_PSOC6/cy_rtc_api.c
  ${MBED_OS_DIR}/targets/TARGET_Cypress/TARGET_PSOC6/cy_serial_api.c
  ${MBED_OS_DIR}/targets/TARGET_Cypress/TARGET_PSOC6/cy_sleep_api.c
  ${MBED_OS_DIR}/targets/TARGET_Cypress/TARGET_PSOC6/cy_spi_api.c
  ${MBED_OS_DIR}/targets/TARGET_Cypress/TARGET_PSOC6/cy_trng_api.c
  ${MBED_OS_DIR}/targets/TARGET_Cypress/TARGET_PSOC6/cy_us_ticker_api.c
  ${MBED_OS_DIR}/targets/TARGET_Cypress/TARGET_PSOC6/cy_usb_phy.cpp
  ${MBED_OS_DIR}/targets/TARGET_Cypress/TARGET_PSOC6/cy_watchdog_api.c
  ${MBED_OS_DIR}/targets/TARGET_Cypress/TARGET_PSOC6/mbed_overrides.c
  ${MBED_OS_DIR}/targets/TARGET_Cypress/TARGET_PSOC6/pinmap.c
)

# Add compile definitions for backward compatibility with the toolchain
# supported. New source files should instead check for __GNUC__ and __clang__
# for the GCC_ARM and ARM toolchains respectively.
if(${MBED_TOOLCHAIN} STREQUAL "GCC_ARM")
  target_compile_definitions(mbed-core
    INTERFACE
      TOOLCHAIN_GCC_ARM
      TOOLCHAIN_GCC
  )
elseif(${MBED_TOOLCHAIN} STREQUAL "ARM")
  target_compile_definitions(mbed-core
    INTERFACE
      TOOLCHAIN_ARM
  )
elseif(${MBED_TOOLCHAIN} STREQUAL "IAR")
  target_compile_definitions(mbed-core
    INTERFACE
      TOOLCHAIN_IAR
  )
endif()

# Include mbed.h
target_include_directories(mbed-core
  INTERFACE
    ${MBED_OS_DIR}
)

# These targets are made visible here so their source files which
# are spread in different directories can be referenced and can be linked against
# by libraries that depend on them.
# TODO CMake: Should the source files be moved?
add_library(mbed-device_key INTERFACE)
add_library(mbed-rtos INTERFACE)

add_subdirectory(${MBED_OS_DIR}/cmsis/device)
add_subdirectory(${MBED_OS_DIR}/drivers)
add_subdirectory(${MBED_OS_DIR}/hal)
add_subdirectory(${MBED_OS_DIR}/platform)
add_subdirectory(${MBED_OS_DIR}/rtos)

# The directories below contain optional target libraries
add_subdirectory(${MBED_OS_DIR}/events EXCLUDE_FROM_ALL)
add_subdirectory(${MBED_OS_DIR}/connectivity EXCLUDE_FROM_ALL)
add_subdirectory(${MBED_OS_DIR}/storage EXCLUDE_FROM_ALL)
add_subdirectory(${MBED_OS_DIR}/drivers/device_key EXCLUDE_FROM_ALL)
add_subdirectory(${MBED_OS_DIR}/drivers/usb EXCLUDE_FROM_ALL)
add_subdirectory(${MBED_OS_DIR}/features EXCLUDE_FROM_ALL)
add_subdirectory(${MBED_OS_DIR}/platform/FEATURE_EXPERIMENTAL_API EXCLUDE_FROM_ALL)
add_subdirectory(${MBED_OS_DIR}/cmsis/device/rtos EXCLUDE_FROM_ALL)

target_compile_definitions(mbed-os
  PUBLIC
    ${MBED_TARGET_DEFINITIONS}
    ${MBED_CONFIG_DEFINITIONS}
)
target_include_directories(mbed-os
  INTERFACE
    ${MBED_OS_DIR}
    ${MBED_OS_DIR}/connectivity/cellular/include/cellular/framework/API
    ${MBED_OS_DIR}/connectivity/cellular/include/cellular/framework/common
    ${MBED_OS_DIR}/connectivity/cellular/include/cellular/framework/device
    ${MBED_OS_DIR}/connectivity/libraries/nanostack-libservice/mbed-client-libservice
    ${MBED_OS_DIR}/connectivity/mbedtls
    ${MBED_OS_DIR}/connectivity/mbedtls/include
    ${MBED_OS_DIR}/connectivity/mbedtls/include/mbedtls # BUG
    ${MBED_OS_DIR}/connectivity/netsocket/include
    ${MBED_OS_DIR}/connectivity/netsocket/include/netsocket # BUG
    ${MBED_OS_DIR}/cmsis/device/rtos/include
    ${MBED_OS_DIR}/drivers/include
    ${MBED_OS_DIR}/drivers/include/drivers
    ${MBED_OS_DIR}/drivers/device_key/include/device_key
    ${MBED_OS_DIR}/events/include
    ${MBED_OS_DIR}/hal/include
    ${MBED_OS_DIR}/hal/include/hal
    ${MBED_OS_DIR}/rtos/include
    ${MBED_OS_DIR}/rtos/include/rtos
    ${MBED_OS_DIR}/rtos/include/rtos/internal
    ${MBED_OS_DIR}/storage/blockdevice/include
    ${MBED_OS_DIR}/storage/blockdevice/include/blockdevice # BUG
    ${MBED_OS_DIR}/storage/filesystem/include
    ${MBED_OS_DIR}/storage/filesystem/littlefs/include/littlefs
    ${MBED_OS_DIR}/storage/kvstore/include/kvstore
    ${MBED_OS_DIR}/storage/kvstore/kvstore_global_api/include/kvstore_global_api
    ${MBED_OS_DIR}/platform/include
    ${MBED_OS_DIR}/platform/include/platform
    ${MBED_OS_DIR}/platform/include/platform/internal
    ${MBED_OS_DIR}/platform/cxxsupport
    ${MBED_OS_DIR}/platform/mbed-trace/include/mbed-trace
    ${MBED_OS_DIR}/platform/FEATURE_EXPERIMENTAL_API/FEATURE_PSA/TARGET_MBED_PSA_SRV/inc
    ${MBED_OS_DIR}/platform/FEATURE_EXPERIMENTAL_API/FEATURE_PSA/TARGET_MBED_PSA_SRV/mbedtls
    ${MBED_OS_DIR}/platform/FEATURE_EXPERIMENTAL_API/FEATURE_PSA/TARGET_MBED_PSA_SRV/services/attestation
    ${MBED_OS_DIR}/targets/TARGET_Cypress/TARGET_PSOC6
  PUBLIC
    ${MBED_OS_DIR}/connectivity/drivers/mbedtls/TARGET_Cypress/TARGET_MXCRYPTO
    ${MBED_OS_DIR}/connectivity/drivers/mbedtls/TARGET_Cypress/TARGET_MXCRYPTO/TARGET_MXCRYPTO_01
)
target_link_libraries(mbed-storage-kv-config
  INTERFACE
    mbed-storage-qspif
)
target_link_libraries(mbed-os
  PRIVATE
    mbed-core
    mbed-rtos
    mbed-wifi
    mbed-psa
  PUBLIC
    bsp
    serial-flash
    cmsis-rtx
    cmsis-rtos2
)
