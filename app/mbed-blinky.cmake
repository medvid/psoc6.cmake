project(mbed-blinky)

psoc6_load_application(
  NAME mbed-os-example-blinky
  URL  https://github.com/ARMmbed/mbed-os-example-blinky
  TAG  mbed-os-5.15.0
)
psoc6_add_executable(
  SOURCES
    ${APP_DIR}/main.cpp
  LINK_LIBRARIES
    mbed-target
)
