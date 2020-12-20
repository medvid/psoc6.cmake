project(mbed-os-example-attestation)

psoc6_load_application(
  NAME mbed-os-example-attestation
  URL  https://github.com/ARMmbed/mbed-os-example-attestation
  TAG  mbed-os-6.6.0
)
psoc6_add_executable(
  SOURCES
    ${APP_DIR}/main.cpp
  LINK_LIBRARIES
    mbed-os
)
