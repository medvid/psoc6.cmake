project(mbed-os-example-template)

psoc6_load_application(
  NAME mbed-os-example-template
  VERSION 5.15.0
  URL https://github.com/ARMmbed/mbed-os-example-template
  TAG mbed-os-5.15.0
)
psoc6_add_executable(
  SOURCES
    ${APP_DIR}/main.cpp
  LINK_LIBRARIES
    mbed-target
)
