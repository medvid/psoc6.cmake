set(MBED_PSA_DIR ${MBED_OS_DIR}/features/FEATURE_EXPERIMENTAL_API/FEATURE_PSA)
set(MBED_PSA_SOURCES
  ${MBED_PSA_DIR}/inc/psa/tfm_platform_api.h
  ${MBED_PSA_DIR}/src/psa_hrng.c
  ${MBED_PSA_DIR}/TARGET_TFM/include/cmsis_nvic_virtual.h
  ${MBED_PSA_DIR}/TARGET_TFM/include/ns_ipc_config.h
  ${MBED_PSA_DIR}/TARGET_TFM/include/platform_multicore.h
  ${MBED_PSA_DIR}/TARGET_TFM/include/tfm_api.h
  ${MBED_PSA_DIR}/TARGET_TFM/include/tfm_crypto_defs.h
  ${MBED_PSA_DIR}/TARGET_TFM/include/tfm_mailbox.h
  ${MBED_PSA_DIR}/TARGET_TFM/include/tfm_multi_core_api.h
  ${MBED_PSA_DIR}/TARGET_TFM/include/tfm_ns_interface.h
  ${MBED_PSA_DIR}/TARGET_TFM/include/tfm_ns_mailbox.h
  ${MBED_PSA_DIR}/TARGET_TFM/include/tfm_ns_svc.h
  ${MBED_PSA_DIR}/TARGET_TFM/include/tfm_platform_api.h
  ${MBED_PSA_DIR}/TARGET_TFM/include/tfm_veneers.h
  ${MBED_PSA_DIR}/TARGET_TFM/include/psa/client.h
  ${MBED_PSA_DIR}/TARGET_TFM/include/psa/crypto_compat.h
  ${MBED_PSA_DIR}/TARGET_TFM/include/psa/crypto_extra.h
  ${MBED_PSA_DIR}/TARGET_TFM/include/psa/crypto.h
  ${MBED_PSA_DIR}/TARGET_TFM/include/psa/crypto_platform.h
  ${MBED_PSA_DIR}/TARGET_TFM/include/psa/crypto_sizes.h
  ${MBED_PSA_DIR}/TARGET_TFM/include/psa/crypto_struct.h
  ${MBED_PSA_DIR}/TARGET_TFM/include/psa/crypto_types.h
  ${MBED_PSA_DIR}/TARGET_TFM/include/psa/crypto_values.h
  ${MBED_PSA_DIR}/TARGET_TFM/include/psa/error.h
  ${MBED_PSA_DIR}/TARGET_TFM/include/psa/initial_attestation.h
  ${MBED_PSA_DIR}/TARGET_TFM/include/psa/internal_trusted_storage.h
  ${MBED_PSA_DIR}/TARGET_TFM/include/psa/protected_storage.h
  ${MBED_PSA_DIR}/TARGET_TFM/include/psa/storage_common.h
  ${MBED_PSA_DIR}/TARGET_TFM/include/psa_manifest/sid.h
  ${MBED_PSA_DIR}/TARGET_TFM/src/tfm_crypto_ipc_api.c
  ${MBED_PSA_DIR}/TARGET_TFM/src/tfm_initial_attestation_ipc_api.c
  ${MBED_PSA_DIR}/TARGET_TFM/src/tfm_its_ipc_api.c
  ${MBED_PSA_DIR}/TARGET_TFM/src/tfm_platform_ipc_api.c
  ${MBED_PSA_DIR}/TARGET_TFM/src/tfm_sst_ipc_api.c
  ${MBED_PSA_DIR}/TARGET_TFM/TARGET_TFM_DUALCPU/src/platform_multicore.c
  ${MBED_PSA_DIR}/TARGET_TFM/TARGET_TFM_DUALCPU/src/platform_ns_mailbox.c
  ${MBED_PSA_DIR}/TARGET_TFM/TARGET_TFM_DUALCPU/src/tfm_mbed_boot.c
  ${MBED_PSA_DIR}/TARGET_TFM/TARGET_TFM_DUALCPU/src/tfm_multi_core_api.c
  ${MBED_PSA_DIR}/TARGET_TFM/TARGET_TFM_DUALCPU/src/tfm_multi_core_psa_ns_api.c
  ${MBED_PSA_DIR}/TARGET_TFM/TARGET_TFM_DUALCPU/src/tfm_ns_mailbox.c
)
set(MBED_PSA_INCLUDE_DIRS
  ${MBED_PSA_DIR}/TARGET_TFM/include
  ${MBED_PSA_DIR}/TARGET_TFM/include/psa
)
set(MBED_PSA_LINK_LIBRARIES
  mbed-platform
  mbed-tls
)

add_library(mbed-psa STATIC EXCLUDE_FROM_ALL ${MBED_PSA_SOURCES})
target_include_directories(mbed-psa PUBLIC ${MBED_PSA_INCLUDE_DIRS})
target_link_libraries(mbed-psa PUBLIC ${MBED_PSA_LINK_LIBRARIES})
