project(capsense-buttons-slider)

psoc6_load_application(
  NAME mtb-example-psoc6-capsense-buttons-slider
  VERSION 1.0.0
)
psoc6_add_executable(
  SOURCES
    ${APP_DIR}/main.c
    ${APP_DIR}/led.h
    ${APP_DIR}/led.c
    ${BSP_CAPSENSE_GENERATED_SOURCES}
  LINK_LIBRARIES
    capsense
    psoc6hal
)
