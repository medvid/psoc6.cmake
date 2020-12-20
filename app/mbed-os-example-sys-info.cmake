project(mbed-os-example-sys-info)

psoc6_load_application(
  NAME mbed-os-example-sys-info
  URL  https://github.com/ARMmbed/mbed-os-example-sys-info
  TAG  mbed-os-6.6.0
)
psoc6_add_executable(
  SOURCES
    ${APP_DIR}/main.cpp
  LINK_LIBRARIES
    mbed-os
)
