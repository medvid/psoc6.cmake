set(MBED_TCOSE_DIR ${MBED_OS_DIR}/features/FEATURE_EXPERIMENTAL_API/FEATURE_PSA/TARGET_MBED_PSA_SRV/services/attestation/tfm_impl/t_cose)
set(MBED_TCOSE_SOURCES
  ${MBED_TCOSE_DIR}/inc/t_cose_common.h
  ${MBED_TCOSE_DIR}/inc/t_cose_sign1_sign.h
  ${MBED_TCOSE_DIR}/src/t_cose_crypto.h
  ${MBED_TCOSE_DIR}/src/t_cose_defines.h
  ${MBED_TCOSE_DIR}/src/t_cose_sign1_sign.c
  ${MBED_TCOSE_DIR}/src/t_cose_util.h
  ${MBED_TCOSE_DIR}/src/t_cose_util.c
)
set(MBED_TCOSE_INCLUDE_DIRS
  ${MBED_TCOSE_DIR}/inc
  ${MBED_TCOSE_DIR}/src
)
set(MBED_TCOSE_LINK_LIBRARIES
  mbed-qcbor
)

add_library(mbed-tcose STATIC EXCLUDE_FROM_ALL ${MBED_TCOSE_SOURCES})
target_include_directories(mbed-tcose PUBLIC ${MBED_TCOSE_INCLUDE_DIRS})
target_link_libraries(mbed-tcose PUBLIC ${MBED_TCOSE_LINK_LIBRARIES})
