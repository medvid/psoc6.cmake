psoc6_check_bsp(CY8CKIT-062-WIFI-BT CY8CPROTO-062-4343W)

project(usb-audio-recorder)

psoc6_load_application(
  NAME mtb-example-psoc6-usb-audio-recorder
  VERSION 1.0.0
)
psoc6_add_executable(
  SOURCES
    ${APP_DIR}/main.c
    ${APP_DIR}/audio.h
    ${APP_DIR}/audio_in.h
    ${APP_DIR}/audio_in.c
    ${APP_DIR}/usb_comm.h
    ${APP_DIR}/usb_comm.c
  LINK_LIBRARIES
    usbdev
    psoc6hal
    retarget-io
  DESIGN_MODUS
    ${APP_DIR}/COMPONENT_CUSTOM_DESIGN_MODUS/TARGET_${BSP_NAME}/design.modus
  DESIGN_USBDEV
    ${APP_DIR}/COMPONENT_CUSTOM_DESIGN_MODUS/TARGET_${BSP_NAME}/design.cyusbdev
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
