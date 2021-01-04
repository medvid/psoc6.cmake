project(i2c-master)

psoc6_load_application(
  NAME mtb-example-psoc6-i2c-master
  VERSION 2.0.0
)
psoc6_add_executable(
  SOURCES
    ${APP_DIR}/main.c
    ${APP_DIR}/resource_map.h
  LINK_LIBRARIES
    mtb-hal-cat1
    retarget-io
)
