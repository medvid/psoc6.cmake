# This application provides custom design.modus for the below boards
psoc6_check_bsp(
  CY8CKIT-062-WIFI-BT
  CY8CKIT-062S2-43012
  CY8CPROTO-062-4343W
  CYW9P62S1-43012EVB-01
  CYW9P62S1-43438EVB-01
)

project(usb-audio-device-freertos)

psoc6_load_application(
  NAME mtb-example-psoc6-usb-audio-device-freertos
  VERSION 1.2.0
)
psoc6_add_executable(
  SOURCES
    ${APP_DIR}/include/audio.h
    ${APP_DIR}/include/audio_app.h
    ${APP_DIR}/include/audio_feed.h
    ${APP_DIR}/include/audio_in.h
    ${APP_DIR}/include/audio_out.h
    ${APP_DIR}/include/rtos.h
    ${APP_DIR}/include/touch.h
    ${APP_DIR}/include/usb_comm.h
    ${APP_DIR}/source/audio_app.c
    ${APP_DIR}/source/audio_feed.c
    ${APP_DIR}/source/audio_in.c
    ${APP_DIR}/source/audio_out.c
    ${APP_DIR}/source/main.c
    ${APP_DIR}/source/touch.c
    ${APP_DIR}/source/usb_comm.c
    ${APP_DIR}/COMPONENT_AK4954A/ak4954a.h
    ${APP_DIR}/COMPONENT_AK4954A/ak4954a.c
  INCLUDE_DIRS
    ${APP_DIR}/include
    ${APP_DIR}/COMPONENT_AK4954A
  LINK_LIBRARIES
    usbdev
    mtb-hal-cat1
    freertos
    abstraction-rtos
    clib-support
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
