# This application provides custom design.modus for the below boards
psoc6_check_bsp(
  CY8CKIT-062S4
)

project(low-power-sar-adc-thermistor-als)

psoc6_load_application(
  NAME mtb-example-psoc6-low-power-sar-adc-thermistor-als
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
  GENERATED_SOURCES
    cycfg.h
    cycfg.c
    cycfg_notices.h
    cycfg_peripherals.h
    cycfg_peripherals.c
    cycfg_pins.h
    cycfg_pins.c
    cycfg_routing.h
    cycfg_routing.c
    cycfg_system.h
    cycfg_system.c
)
