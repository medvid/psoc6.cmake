project(anycloud-secure-tcp-client)

psoc6_load_application(
  NAME mtb-example-anycloud-secure-tcp-client
  VERSION 1.3.0
)
psoc6_add_executable(
  SOURCES
    ${APP_DIR}/main.c
    ${APP_DIR}/network_credentials.h
    ${APP_DIR}/secure_tcp_client.h
    ${APP_DIR}/secure_tcp_client.c
  LINK_LIBRARIES
    retarget-io
    wifi-connection-manager
)
