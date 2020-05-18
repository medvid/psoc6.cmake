set(MBED_PSA_DIR ${MBED_OS_DIR}/components/TARGET_PSA)
set(MBED_PSA_SOURCES
  ${MBED_PSA_DIR}/inc/psa/client.h
  ${MBED_PSA_DIR}/inc/psa/error.h
  ${MBED_PSA_DIR}/inc/psa/internal_trusted_storage.h
  ${MBED_PSA_DIR}/inc/psa/lifecycle.h
  ${MBED_PSA_DIR}/inc/psa/protected_storage.h
  ${MBED_PSA_DIR}/inc/psa/service.h
  ${MBED_PSA_DIR}/inc/psa/storage_common.h
  ${MBED_PSA_DIR}/inc/psa/tfm_platform_api.h
  ${MBED_PSA_DIR}/inc/psa_manifest/sid.h
  ${MBED_PSA_DIR}/services/attestation/attestation.h
  ${MBED_PSA_DIR}/services/attestation/psa_attest_inject_key.h
  ${MBED_PSA_DIR}/services/attestation/psa_initial_attestation_api.h
  ${MBED_PSA_DIR}/services/attestation/COMPONENT_PSA_SRV_EMUL/psa_attest_inject_key.c
  ${MBED_PSA_DIR}/services/attestation/COMPONENT_PSA_SRV_EMUL/psa_initial_attestation_api.c
  ${MBED_PSA_DIR}/services/attestation/COMPONENT_PSA_SRV_IMPL/attest_boot_status_loader.c
  ${MBED_PSA_DIR}/services/attestation/COMPONENT_PSA_SRV_IMPL/attest_crypto.c
  ${MBED_PSA_DIR}/services/attestation/COMPONENT_PSA_SRV_IMPL/attest_crypto_keys.c
  ${MBED_PSA_DIR}/services/attestation/COMPONENT_PSA_SRV_IMPL/attest_iat_claims_loader.c
  ${MBED_PSA_DIR}/services/attestation/COMPONENT_PSA_SRV_IMPL/attestation_bootloader_data.h
  ${MBED_PSA_DIR}/services/attestation/COMPONENT_PSA_SRV_IMPL/attestation_bootloader_data.c
  ${MBED_PSA_DIR}/services/attestation/COMPONENT_PSA_SRV_IMPL/psa_attestation_stubs.c
  ${MBED_PSA_DIR}/services/attestation/COMPONENT_PSA_SRV_IMPL/psa_inject_attestation_key_impl.h
  ${MBED_PSA_DIR}/services/attestation/COMPONENT_PSA_SRV_IMPL/psa_inject_attestation_key_impl.c
  ${MBED_PSA_DIR}/services/attestation/COMPONENT_PSA_SRV_IMPL/tfm_impl/attest_eat_defines.h
  ${MBED_PSA_DIR}/services/attestation/COMPONENT_PSA_SRV_IMPL/tfm_impl/attest_token.h
  ${MBED_PSA_DIR}/services/attestation/COMPONENT_PSA_SRV_IMPL/tfm_impl/attest_token.c
  ${MBED_PSA_DIR}/services/attestation/COMPONENT_PSA_SRV_IMPL/tfm_impl/attestation_core.c
  ${MBED_PSA_DIR}/services/attestation/COMPONENT_PSA_SRV_IMPL/tfm_impl/tfm_attest_hal.h
  ${MBED_PSA_DIR}/services/attestation/COMPONENT_PSA_SRV_IMPL/tfm_impl/tfm_boot_status.h
  ${MBED_PSA_DIR}/services/attestation/COMPONENT_PSA_SRV_IMPL/tfm_impl/tfm_plat_boot_seed.h
  ${MBED_PSA_DIR}/services/attestation/COMPONENT_PSA_SRV_IMPL/tfm_impl/tfm_plat_crypto_keys.h
  ${MBED_PSA_DIR}/services/attestation/COMPONENT_PSA_SRV_IMPL/tfm_impl/tfm_plat_defs.h
  ${MBED_PSA_DIR}/services/attestation/COMPONENT_PSA_SRV_IMPL/tfm_impl/tfm_plat_device_id.h
  ${MBED_PSA_DIR}/services/inc/autogen_sid.h
  ${MBED_PSA_DIR}/services/inc/mbed_spm_partitions.h
  ${MBED_PSA_DIR}/services/platform/COMPONENT_PSA_SRV_EMUL/platform_emul.c
  ${MBED_PSA_DIR}/services/platform/COMPONENT_PSA_SRV_IMPL/platform_srv_impl.h
  ${MBED_PSA_DIR}/services/platform/COMPONENT_PSA_SRV_IMPL/platform_srv_impl.c
  ${MBED_PSA_DIR}/services/storage/common/psa_storage_common_impl.cpp
  ${MBED_PSA_DIR}/services/storage/its/COMPONENT_PSA_SRV_EMUL/psa_prot_internal_storage.cpp
  ${MBED_PSA_DIR}/services/storage/its/COMPONENT_PSA_SRV_IMPL/pits_impl.h
  ${MBED_PSA_DIR}/services/storage/its/COMPONENT_PSA_SRV_IMPL/pits_impl.cpp
  ${MBED_TLS_DIR}/platform/COMPONENT_PSA_SRV_IMPL/psa_crypto.c
)
set(MBED_PSA_INCLUDE_DIRS
  ${MBED_TLS_DIR}/platform/COMPONENT_PSA_SRV_IMPL/COMPONENT_NSPE
  ${MBED_PSA_DIR}/inc
  ${MBED_PSA_DIR}/inc/psa
  ${MBED_PSA_DIR}/services/attestation/
  ${MBED_PSA_DIR}/services/attestation/COMPONENT_PSA_SRV_IMPL
  ${MBED_PSA_DIR}/services/attestation/COMPONENT_PSA_SRV_IMPL/tfm_impl
  ${MBED_PSA_DIR}/services/inc
  ${MBED_PSA_DIR}/services/platform/COMPONENT_PSA_SRV_IMPL
  ${MBED_PSA_DIR}/services/storage/common
  ${MBED_PSA_DIR}/services/storage/its
  ${MBED_PSA_DIR}/services/storage/its/COMPONENT_PSA_SRV_IMPL
  ${MBED_PSA_DIR}/TARGET_TFM
  ${MBED_PSA_DIR}/TARGET_TFM/interface/include
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
