project(mbed-os-example-kvstore)

psoc6_load_application(
  NAME mbed-os-example-kvstore
  URL  https://github.com/ARMmbed/mbed-os-example-kvstore
  TAG  mbed-os-5.12.4
)
psoc6_add_executable(
  SOURCES
    ${APP_DIR}/main.cpp
  LINK_LIBRARIES
    mbed-target
    mbed-kvstore
)
