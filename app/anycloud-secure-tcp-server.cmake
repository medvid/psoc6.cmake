project(anycloud-secure-tcp-server)

psoc6_load_application(
  NAME mtb-example-anycloud-secure-tcp-server
  VERSION 1.2.0
)
psoc6_add_executable(
  SOURCES
    ${APP_DIR}/main.c
    ${APP_DIR}/secure_tcp_server.h
    ${APP_DIR}/secure_tcp_server.c
  LINK_LIBRARIES
    retarget-io
    wifi-connection-manager
)
