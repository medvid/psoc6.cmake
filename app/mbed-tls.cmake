project(mbed-tls)

psoc6_load_application(
  NAME mbed-os-example-tls
  URL  https://github.com/ARMmbed/mbed-os-example-tls
  # Using compatible HelloHttpsClient.cpp from master
  TAG  aacaf72
)
psoc6_add_executable(
  NAME
    mbed-tls-authcrypt
  SOURCES
    ${APP_DIR}/authcrypt/main.cpp
    ${APP_DIR}/authcrypt/authcrypt.h
    ${APP_DIR}/authcrypt/authcrypt.cpp
  LINK_LIBRARIES
    mbed-target
    mbed-tls-platform
)
psoc6_add_executable(
  NAME
    mbed-tls-benchmark
  SOURCES
    ${APP_DIR}/benchmark/main.cpp
  LINK_LIBRARIES
    mbed-target
    mbed-tls-platform
)
psoc6_add_executable(
  NAME
    mbed-tls-hashing
  SOURCES
    ${APP_DIR}/hashing/main.cpp
  LINK_LIBRARIES
    mbed-target
    mbed-tls
)
psoc6_add_executable(
  NAME
    mbed-tls-client
  SOURCES
    ${APP_DIR}/tls-client/main.cpp
    ${APP_DIR}/tls-client/HelloHttpsClient.h
    ${APP_DIR}/tls-client/HelloHttpsClient.cpp
  LINK_LIBRARIES
    mbed-target
    mbed-tls-platform
    mbed-netsocket
)
