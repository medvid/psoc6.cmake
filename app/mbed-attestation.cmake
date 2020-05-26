project(mbed-attestation)

psoc6_load_application(
  NAME mbed-os-example-attestation
  URL  https://github.com/ARMmbed/mbed-os-example-attestation
  TAG  mbed-os-5.15.0
)
psoc6_add_executable(
  SOURCES
    ${APP_DIR}/main.cpp
  LINK_LIBRARIES
    mbed-target
    mbed-tls-platform
)
