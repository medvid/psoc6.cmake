project(anycloud-tcp-server)

psoc6_load_application(
  NAME mtb-example-anycloud-tcp-server
  VERSION 1.1.0
)
psoc6_add_executable(
  SOURCES
    ${APP_DIR}/main.c
    ${APP_DIR}/tcp_server.h
    ${APP_DIR}/tcp_server.c
  LINK_LIBRARIES
    retarget-io
    wifi-connection-manager
)
