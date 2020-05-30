project(anycloud-wps-enrollee)

psoc6_load_application(
  NAME mtb-example-anycloud-wps-enrollee
  VERSION 1.1.0
)
psoc6_add_executable(
  SOURCES
    ${APP_DIR}/main.c
    ${APP_DIR}/wps_enrollee_task.h
    ${APP_DIR}/wps_enrollee_task.c
  LINK_LIBRARIES
    retarget-io
    wifi-connection-manager
)
