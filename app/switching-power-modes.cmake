project(switching-power-modes)

psoc6_load_application(
  NAME mtb-example-psoc6-switching-power-modes
  VERSION 2.0.0
)
psoc6_add_executable(
  SOURCES
    ${APP_DIR}/main.c
  LINK_LIBRARIES
    mtb-hal-cat1
)
