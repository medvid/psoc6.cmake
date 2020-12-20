project(mbed-os-example-error-handling)

psoc6_load_application(
  NAME mbed-os-example-error-reporting
  URL  https://github.com/ARMmbed/mbed-os-example-error-handling
  TAG  mbed-os-6.6.0
)
psoc6_add_executable(
  SOURCES
    ${APP_DIR}/main.cpp
  DEFINES
    -DMBED_TEST_SIM_BLOCKDEVICE=HeapBlockDevice
  LINK_LIBRARIES
    mbed-os
)
