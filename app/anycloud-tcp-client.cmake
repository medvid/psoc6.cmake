project(anycloud-tcp-client)

psoc6_load_application(
  NAME mtb-example-anycloud-tcp-client
  VERSION 1.1.0
)
psoc6_add_executable(
  SOURCES
    ${APP_DIR}/main.c
    ${APP_DIR}/tcp_client.h
    ${APP_DIR}/tcp_client.c
  LINK_LIBRARIES
    retarget-io
    wifi-connection-manager
)
