project(hello-world)

psoc6_load_application(
  NAME mtb-example-psoc6-hello-world
  VERSION 2.0.1
)
psoc6_add_executable(
  SOURCES
    ${APP_DIR}/main.c
  LINK_LIBRARIES
    mtb-hal-cat1
    retarget-io
)
