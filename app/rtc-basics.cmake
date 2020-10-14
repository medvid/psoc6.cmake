project(rtc-basics)

psoc6_load_application(
  NAME mtb-example-psoc6-rtc-basics
  VERSION 1.2.0
)
psoc6_add_executable(
  SOURCES
    ${APP_DIR}/main.c
  LINK_LIBRARIES
    mtb-hal-cat1
    retarget-io
)
