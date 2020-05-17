project(mbed-crash-reporting)

psoc6_load_application(
  NAME mbed-os-example-crash-reporting
  VERSION 5.15.0
  URL https://github.com/ARMmbed/mbed-os-example-crash-reporting
  TAG mbed-os-5.15.0
)
psoc6_add_executable(
  SOURCES
    ${APP_DIR}/main.cpp
  LINK_LIBRARIES
    mbed-target
)
