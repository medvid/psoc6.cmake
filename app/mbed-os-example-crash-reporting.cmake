project(mbed-os-example-crash-reporting)

psoc6_load_application(
  NAME mbed-os-example-crash-reporting
  URL  https://github.com/ARMmbed/mbed-os-example-crash-reporting
  TAG  mbed-os-6.6.0
)
psoc6_add_executable(
  SOURCES
    ${APP_DIR}/main.cpp
  LINK_LIBRARIES
    mbed-os
)
