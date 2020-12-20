project(dual-cpu-empty-app)

psoc6_load_application(
  NAME mtb-example-psoc6-dual-cpu-empty-app
  VERSION 1.0.0
)
psoc6_add_executable(
  SOURCES
    ${APP_DIR}/cm4_app/main.c
  LINK_LIBRARIES
    mtb-hal-cat1
)
