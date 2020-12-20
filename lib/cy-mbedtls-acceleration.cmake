psoc6_load_library(
  NAME cy-mbedtls-acceleration
  VERSION 1.2.0
)

set(CY_MBEDTLS_ACCELERATION_SOURCES
  ${CY_MBEDTLS_ACCELERATION_DIR}/mbedtls_MXCRYPTO/aes_alt.h
  ${CY_MBEDTLS_ACCELERATION_DIR}/mbedtls_MXCRYPTO/aes_alt.c
  ${CY_MBEDTLS_ACCELERATION_DIR}/mbedtls_MXCRYPTO/crypto_common.h
  ${CY_MBEDTLS_ACCELERATION_DIR}/mbedtls_MXCRYPTO/crypto_common.h
  ${CY_MBEDTLS_ACCELERATION_DIR}/mbedtls_MXCRYPTO/ecdsa_alt.c
  ${CY_MBEDTLS_ACCELERATION_DIR}/mbedtls_MXCRYPTO/ecp_alt.h
  ${CY_MBEDTLS_ACCELERATION_DIR}/mbedtls_MXCRYPTO/ecp_alt.c
  ${CY_MBEDTLS_ACCELERATION_DIR}/mbedtls_MXCRYPTO/ecp_curves_alt.c
  ${CY_MBEDTLS_ACCELERATION_DIR}/mbedtls_MXCRYPTO/sha1_alt.h
  ${CY_MBEDTLS_ACCELERATION_DIR}/mbedtls_MXCRYPTO/sha1_alt.c
  ${CY_MBEDTLS_ACCELERATION_DIR}/mbedtls_MXCRYPTO/sha256_alt.h
  ${CY_MBEDTLS_ACCELERATION_DIR}/mbedtls_MXCRYPTO/sha256_alt.c
  ${CY_MBEDTLS_ACCELERATION_DIR}/mbedtls_MXCRYPTO/sha512_alt.h
  ${CY_MBEDTLS_ACCELERATION_DIR}/mbedtls_MXCRYPTO/sha512_alt.c
)
set(CY_MBEDTLS_ACCELERATION_INCLUDE_DIRS
  ${CY_MBEDTLS_ACCELERATION_DIR}/mbedtls_MXCRYPTO
)
set(CY_MBEDTLS_ACCELERATION_LIBRARIES
  mtb-hal-cat1
  mbedtls
)

add_library(cy-mbedtls-acceleration STATIC ${CY_MBEDTLS_ACCELERATION_SOURCES})
target_include_directories(cy-mbedtls-acceleration PUBLIC ${CY_MBEDTLS_ACCELERATION_INCLUDE_DIRS})
target_link_libraries(cy-mbedtls-acceleration PUBLIC ${CY_MBEDTLS_ACCELERATION_LIBRARIES})

# Macro definition used in mbedtls_user_config.h
target_compile_definitions(mbedtls PUBLIC CY_MBEDTLS_ACCELERATION)
target_link_libraries(mbedtls PUBLIC cy-mbedtls-acceleration)
