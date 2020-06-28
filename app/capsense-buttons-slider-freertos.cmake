# This applications relies on BSP providing design.cycapsense
if(NOT TARGET bsp_design_capsense)
  return()
endif()

project(capsense-buttons-slider-freertos)

psoc6_load_application(
  NAME mtb-example-psoc6-capsense-buttons-slider-freertos
  VERSION 1.2.0
)
psoc6_add_executable(
  SOURCES
    ${APP_DIR}/main.c
    ${APP_DIR}/capsense_task.h
    ${APP_DIR}/capsense_task.c
    ${APP_DIR}/led_task.h
    ${APP_DIR}/led_task.c
  LINK_LIBRARIES
    capsense
    psoc6hal
    freertos
)
