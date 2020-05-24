set(MBED_CLIENT_RANDLIB_DIR ${MBED_OS_DIR}/features/frameworks/mbed-client-randlib)
set(MBED_CLIENT_RANDLIB_SOURCES
  ${MBED_CLIENT_RANDLIB_DIR}/mbed-client-randlib/randLIB.h
  ${MBED_CLIENT_RANDLIB_DIR}/mbed-client-randlib/platform/arm_hal_random.h
  ${MBED_CLIENT_RANDLIB_DIR}/source/randLIB.c
)
set(MBED_CLIENT_RANDLIB_INCLUDE_DIRS
  ${MBED_CLIENT_RANDLIB_DIR}/mbed-client-randlib
  ${MBED_CLIENT_RANDLIB_DIR}/mbed-client-randlib/platform
)

add_library(mbed-client-randlib STATIC EXCLUDE_FROM_ALL ${MBED_CLIENT_RANDLIB_SOURCES})
target_include_directories(mbed-client-randlib PUBLIC ${MBED_CLIENT_RANDLIB_INCLUDE_DIRS})
