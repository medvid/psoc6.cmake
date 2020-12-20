project(anycloud-udp-client)

psoc6_load_application(
  NAME mtb-example-anycloud-udp-client
  VERSION 2.0.0
)
psoc6_add_executable(
  SOURCES
    ${APP_DIR}/main.c
    ${APP_DIR}/udp_client.h
    ${APP_DIR}/udp_client.c
  LINK_LIBRARIES
    retarget-io
    wifi-connection-manager
)
