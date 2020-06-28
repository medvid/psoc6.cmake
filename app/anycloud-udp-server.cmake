project(anycloud-udp-server)

psoc6_load_application(
  NAME mtb-example-anycloud-udp-server
  VERSION 1.0.0
)
psoc6_add_executable(
  SOURCES
    ${APP_DIR}/main.c
    ${APP_DIR}/udp_server.h
    ${APP_DIR}/udp_server.c
  LINK_LIBRARIES
    retarget-io
    wifi-connection-manager
)
