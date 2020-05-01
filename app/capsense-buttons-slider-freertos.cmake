project(capsense-buttons-slider-freertos)

psoc6_load_application(
  NAME mtb-example-psoc6-capsense-buttons-slider-freertos
  VERSION 1.1.0
)
psoc6_add_executable(
  SOURCES
    ${APP_DIR}/main.c
    ${APP_DIR}/capsense_task.h
    ${APP_DIR}/capsense_task.c
    ${APP_DIR}/led_task.h
    ${APP_DIR}/led_task.c
    ${BSP_CAPSENSE_GENERATED_SOURCES}
  LINK_LIBRARIES
    capsense
    psoc6hal
    freertos
)
