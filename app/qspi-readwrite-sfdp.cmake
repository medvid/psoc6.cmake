# This applications relies on BSP providing design.cyqspi
if(NOT TARGET bsp_design_qspi)
  return()
endif()

project(qspi-readwrite-sfdp)

psoc6_load_application(
  NAME mtb-example-psoc6-qspi-readwrite-sfdp
  VERSION 1.1.0
)
psoc6_add_executable(
  SOURCES
    ${APP_DIR}/main.c
    ${APP_DIR}/mem_config/mem_config_sfdp.h
    ${APP_DIR}/mem_config/mem_config_sfdp.c
  INCLUDE_DIRS
    ${APP_DIR}/mem_config
  LINK_LIBRARIES
    mtb-hal-cat1
    serial-flash
    retarget-io
)
