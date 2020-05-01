project(qspi-readwrite)

psoc6_load_application(
  NAME mtb-example-psoc6-qspi-readwrite
  VERSION 1.1.0
)
psoc6_add_executable(
  SOURCES
    ${APP_DIR}/main.c
    ${BSP_QSPI_GENERATED_SOURCES}
  LINK_LIBRARIES
    psoc6hal
    retarget-io
    serial-flash
)
