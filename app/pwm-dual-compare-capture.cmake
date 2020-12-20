# This application provides custom design.modus for the below boards
psoc6_check_bsp(
  CY8CKIT-062S4
)

project(pwm-dual-compare-capture)

psoc6_load_application(
  NAME mtb-example-psoc6-pwm-dual-compare-capture
  VERSION 1.0.0
)
psoc6_add_executable(
  SOURCES
    ${APP_DIR}/main.c
  LINK_LIBRARIES
    mtb-hal-cat1
    retarget-io
  DESIGN_MODUS
    ${APP_DIR}/COMPONENT_CUSTOM_DESIGN_MODUS/TARGET_${BSP_NAME}/design.modus
)
