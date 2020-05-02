project(spi-master)

psoc6_load_application(
  NAME mtb-example-psoc6-spi-master
  VERSION 1.1.0
)
psoc6_add_executable(
  SOURCES
    ${APP_DIR}/main.c
    ${APP_DIR}/resource_map.h
  LINK_LIBRARIES
    psoc6hal
    retarget-io
)
