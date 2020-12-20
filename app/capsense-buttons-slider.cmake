# This applications relies on BSP providing design.cycapsense
if(NOT TARGET bsp_design_capsense)
  return()
endif()

project(capsense-buttons-slider)

psoc6_load_application(
  NAME mtb-example-psoc6-capsense-buttons-slider
  VERSION 2.0.0
)
psoc6_add_executable(
  SOURCES
    ${APP_DIR}/main.c
    ${APP_DIR}/led.h
    ${APP_DIR}/led.c
  LINK_LIBRARIES
    capsense
    mtb-hal-cat1
)
