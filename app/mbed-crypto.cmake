project(mbed-crypto)

psoc6_load_application(
  NAME mbed-os-example-mbed-crypto
  URL  https://github.com/ARMmbed/mbed-os-example-mbed-crypto
  TAG  mbed-os-5.15.0
)
psoc6_add_executable(
  SOURCES
    ${APP_DIR}/getting-started/main.cpp
  LINK_LIBRARIES
    mbed-target
    mbed-tls-platform
)
