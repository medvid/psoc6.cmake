project(anycloud-wifi-scan)

psoc6_load_application(
  NAME mtb-example-anycloud-wifi-scan
  VERSION 1.0.0
)
psoc6_add_executable(
  SOURCES
    ${APP_DIR}/main.c
    ${APP_DIR}/scan_task.h
    ${APP_DIR}/scan_task.c
  LINK_LIBRARIES
    retarget-io
    wifi-connection-manager
)
