psoc6_check_bsp(CY8CKIT-062-BLE CY8CKIT-062-WIFI-BT)

project(pdm-to-i2s)

psoc6_load_application(
  NAME mtb-example-psoc6-pdm-to-i2s
  VERSION 1.1.0
)
psoc6_add_executable(
  SOURCES
    ${APP_DIR}/main.c
    ${APP_DIR}/ak4954a.h
    ${APP_DIR}/ak4954a.c
  LINK_LIBRARIES
    psoc6hal
    retarget-io
  DESIGN_MODUS
    ${APP_DIR}/COMPONENT_CUSTOM_DESIGN_MODUS/TARGET_${BSP_NAME}/design.modus
  GENERATED_SOURCES
    cycfg.h
    cycfg.c
    cycfg_clocks.h
    cycfg_clocks.c
    cycfg_dmas.h
    cycfg_dmas.c
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
