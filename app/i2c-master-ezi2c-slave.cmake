project(i2c-master-ezi2c-slave)

psoc6_load_application(
  NAME mtb-example-psoc6-i2c-master-ezi2c-slave
  VERSION 1.2.0
)
psoc6_add_executable(
  SOURCES
    ${APP_DIR}/main.c
    ${APP_DIR}/resource_map.h
  LINK_LIBRARIES
    psoc6hal
    retarget-io
)
