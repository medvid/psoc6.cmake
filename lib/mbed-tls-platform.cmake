set(MBED_TLS_PLATFORM_SOURCES
  ${MBED_TLS_DIR}/platform/inc/platform_alt.h
  ${MBED_TLS_DIR}/platform/inc/platform_mbed.h
  ${MBED_TLS_DIR}/platform/inc/shared_rng.h
  ${MBED_TLS_DIR}/platform/src/mbed_trng.cpp
  ${MBED_TLS_DIR}/platform/src/platform_alt.cpp
  ${MBED_TLS_DIR}/platform/src/shared_rng.cpp
)
set(MBED_TLS_PLATFORM_INCLUDE_DIRS
  ${MBED_TLS_DIR}
  ${MBED_TLS_DIR}/inc
  # BUG: shared_rng.h includes config.h
  ${MBED_TLS_DIR}/inc/mbedtls
  ${MBED_TLS_DIR}/platform/inc
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
