# This application provides custom design.modus for the below boards
psoc6_check_bsp(
  CY8CKIT-062S2-43012
  CY8CPROTO-062-4343W
)

project(anycloud-offload-tcp-keepalive)

psoc6_load_application(
  NAME mtb-example-anycloud-offload-tcp-keepalive
  VERSION 1.0.0
)
psoc6_add_executable(
  SOURCES
    ${APP_DIR}/main.c
    ${APP_DIR}/tcp_keepalive_offload.h
    ${APP_DIR}/tcp_keepalive_offload.c
    ${APP_DIR}/app_config.h
  DEFINES
    -DTARGET_${MBED_BSP_NAME}
  LINK_LIBRARIES
    retarget-io
    lpa
  DESIGN_MODUS
    ${APP_DIR}/COMPONENT_CUSTOM_DESIGN_MODUS/TARGET_${BSP_NAME}/design.modus
  GENERATED_SOURCES
    cycfg.h
    cycfg.c
    cycfg_clocks.h
    cycfg_clocks.c
    cycfg_connectivity_wifi.h
    cycfg_connectivity_wifi.c
    cycfg_dmas.h
    cycfg_dmas.c
    cycfg_notices.h
    cycfg_peripherals.h
    cycfg_peripherals.c
    cycfg_pins.h
    cycfg_pins.c
    cycfg_routing.h
    cycfg_system.h
    cycfg_system.c
)
