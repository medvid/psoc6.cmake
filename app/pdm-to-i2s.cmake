project(pdm-to-i2s)

psoc6_load_application(
  NAME mtb-example-psoc6-pdm-to-i2s
  VERSION 1.2.0
)
psoc6_add_executable(
  SOURCES
    ${APP_DIR}/main.c
    ${APP_DIR}/COMPONENT_AK4954A/ak4954a.h
    ${APP_DIR}/COMPONENT_AK4954A/ak4954a.c
  INCLUDE_DIRS
    ${APP_DIR}/COMPONENT_AK4954A
  LINK_LIBRARIES
    mtb-hal-cat1
)
