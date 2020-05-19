project(mbed-error-handling)

psoc6_load_application(
  NAME mbed-os-example-error-reporting
  VERSION 5.15.0
  URL https://github.com/ARMmbed/mbed-os-example-error-handling
  TAG mbed-os-5.15.0
)
psoc6_add_executable(
  SOURCES
    ${APP_DIR}/main.cpp
  DEFINES
    -DMBED_TEST_SIM_BLOCKDEVICE=HeapBlockDevice
  LINK_LIBRARIES
    mbed-littlefs
    mbed-blockdevice
    mbed-target
)
