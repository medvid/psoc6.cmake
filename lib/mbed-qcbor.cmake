set(MBED_QCBOR_DIR ${MBED_OS_DIR}/components/TARGET_PSA/services/attestation/qcbor)
set(MBED_QCBOR_SOURCES
  ${MBED_QCBOR_DIR}/inc/UsefulBuf.h
  ${MBED_QCBOR_DIR}/inc/qcbor.h
  ${MBED_QCBOR_DIR}/inc/useful_buf.h
  ${MBED_QCBOR_DIR}/src/UsefulBuf.c
  ${MBED_QCBOR_DIR}/src/ieee754.c
  ${MBED_QCBOR_DIR}/src/ieee754.h
  ${MBED_QCBOR_DIR}/src/qcbor_decode.c
  ${MBED_QCBOR_DIR}/src/qcbor_encode.c
)
set(MBED_QCBOR_INCLUDE_DIRS
  ${MBED_QCBOR_DIR}/inc
)

add_library(mbed-qcbor STATIC EXCLUDE_FROM_ALL ${MBED_QCBOR_SOURCES})
target_include_directories(mbed-qcbor PUBLIC ${MBED_QCBOR_INCLUDE_DIRS})
