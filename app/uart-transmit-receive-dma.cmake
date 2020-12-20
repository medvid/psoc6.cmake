# This application provides custom design.modus for the below boards
psoc6_check_bsp(
  CY8CKIT-062-BLE
  CY8CKIT-062-WIFI-BT
  CY8CKIT-062S2-43012
  CY8CKIT-064B0S2-4343W
  CY8CPROTO-062-4343W
  CY8CPROTO-062S3-4343W
  CY8CPROTO-063-BLE
  CYW9P62S1-43012EVB-01
  CYW9P62S1-43438EVB-01
)

project(uart-transmit-receive-dma)

psoc6_load_application(
  NAME mtb-example-psoc6-uart-transmit-receive-dma
  VERSION 2.0.0
)
psoc6_add_executable(
  SOURCES
    ${APP_DIR}/source/main.c
    ${APP_DIR}/source/UartDma.h
    ${APP_DIR}/source/UartDma.c
  INCLUDE_DIRS
    ${APP_DIR}/source
  LINK_LIBRARIES
    mtb-hal-cat1
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
