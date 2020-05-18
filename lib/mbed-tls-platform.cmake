set(MBED_TLS_PLATFORM_SOURCES
  ${MBED_TLS_DIR}/inc/psa/crypto.h
  ${MBED_TLS_DIR}/inc/psa/crypto_accel_driver.h
  ${MBED_TLS_DIR}/inc/psa/crypto_compat.h
  ${MBED_TLS_DIR}/inc/psa/crypto_driver_common.h
  ${MBED_TLS_DIR}/inc/psa/crypto_entropy_driver.h
  ${MBED_TLS_DIR}/inc/psa/crypto_extra.h
  ${MBED_TLS_DIR}/inc/psa/crypto_platform.h
  ${MBED_TLS_DIR}/inc/psa/crypto_se_driver.h
  ${MBED_TLS_DIR}/inc/psa/crypto_sizes.h
  ${MBED_TLS_DIR}/inc/psa/crypto_types.h
  ${MBED_TLS_DIR}/inc/psa/crypto_values.h
  ${MBED_TLS_DIR}/platform/inc/platform_alt.h
  ${MBED_TLS_DIR}/platform/inc/platform_mbed.h
  ${MBED_TLS_DIR}/platform/inc/shared_rng.h
  ${MBED_TLS_DIR}/platform/src/mbed_trng.cpp
  ${MBED_TLS_DIR}/platform/src/platform_alt.cpp
  ${MBED_TLS_DIR}/platform/src/shared_rng.cpp
  ${MBED_TLS_DIR}/platform/TARGET_PSA/COMPONENT_NSPE/src/psa_hrng.c
  ${MBED_TLS_DIR}/platform/TARGET_PSA/COMPONENT_PSA_SRV_IMPL/inc/default_random_seed.h
  ${MBED_TLS_DIR}/platform/TARGET_PSA/COMPONENT_PSA_SRV_IMPL/src/default_random_seed.cpp
  ${MBED_TLS_DIR}/platform/COMPONENT_PSA_SRV_IMPL/psa_crypto.c
  ${MBED_TLS_DIR}/platform/COMPONENT_PSA_SRV_IMPL/psa_crypto_core.h
  ${MBED_TLS_DIR}/platform/COMPONENT_PSA_SRV_IMPL/psa_crypto_invasive.h
  ${MBED_TLS_DIR}/platform/COMPONENT_PSA_SRV_IMPL/psa_crypto_its.h
  ${MBED_TLS_DIR}/platform/COMPONENT_PSA_SRV_IMPL/psa_crypto_se.c
  ${MBED_TLS_DIR}/platform/COMPONENT_PSA_SRV_IMPL/psa_crypto_se.h
  ${MBED_TLS_DIR}/platform/COMPONENT_PSA_SRV_IMPL/psa_crypto_service_integration.h
  ${MBED_TLS_DIR}/platform/COMPONENT_PSA_SRV_IMPL/psa_crypto_slot_management.c
  ${MBED_TLS_DIR}/platform/COMPONENT_PSA_SRV_IMPL/psa_crypto_slot_management.h
  ${MBED_TLS_DIR}/platform/COMPONENT_PSA_SRV_IMPL/psa_crypto_storage.c
  ${MBED_TLS_DIR}/platform/COMPONENT_PSA_SRV_IMPL/psa_crypto_storage.h
)
set(MBED_TLS_PLATFORM_INCLUDE_DIRS
  ${MBED_TLS_DIR}/inc/psa
  ${MBED_TLS_DIR}/platform/inc
  ${MBED_TLS_DIR}/platform/TARGET_PSA/COMPONENT_PSA_SRV_IMPL/inc
  ${MBED_TLS_DIR}/platform/COMPONENT_PSA_SRV_IMPL
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
