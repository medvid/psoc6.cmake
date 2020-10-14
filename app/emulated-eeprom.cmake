project(emulated-eeprom)

psoc6_load_application(
  NAME mtb-example-psoc6-emulated-eeprom
  VERSION 1.1.0
)
psoc6_add_executable(
  SOURCES
    ${APP_DIR}/main.c
  LINK_LIBRARIES
    emeeprom
    mtb-hal-cat1
    retarget-io
)
