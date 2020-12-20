project(mbed-os-example-tls)

psoc6_load_application(
  NAME mbed-os-example-tls
  URL  https://github.com/ARMmbed/mbed-os-example-tls
  TAG  mbed-os-6.6.0
)
psoc6_add_executable(
  NAME
    mbed-os-example-tls-authcrypt
  SOURCES
    ${APP_DIR}/authcrypt/main.cpp
    ${APP_DIR}/authcrypt/authcrypt.h
    ${APP_DIR}/authcrypt/authcrypt.cpp
  LINK_LIBRARIES
    mbed-os
)
psoc6_add_executable(
  NAME
    mbed-os-example-tls-benchmark
  SOURCES
    ${APP_DIR}/benchmark/main.cpp
  LINK_LIBRARIES
    mbed-os
)
psoc6_add_executable(
  NAME
    mbed-os-example-tls-hashing
  SOURCES
    ${APP_DIR}/hashing/main.cpp
  LINK_LIBRARIES
    mbed-os
)
psoc6_add_executable(
  NAME
    mbed-os-example-tls-client
  SOURCES
    ${APP_DIR}/tls-client/main.cpp
    ${APP_DIR}/tls-client/HelloHttpsClient.h
    ${APP_DIR}/tls-client/HelloHttpsClient.cpp
  LINK_LIBRARIES
    mbed-os
)
