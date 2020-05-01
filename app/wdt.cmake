project(wdt)

psoc6_load_application(
  NAME mtb-example-psoc6-wdt
  VERSION 1.1.0
)
psoc6_add_executable(
  SOURCES
    ${APP_DIR}/main.c
  LINK_LIBRARIES
    psoc6hal
    retarget-io
)
