psoc6_check_bsp(CY8CKIT-062-WIFI-BT CY8CPROTO-062-4343W)

project(usb-hid-mouse)

psoc6_load_application(
  NAME mtb-example-psoc6-usb-hid-mouse
  VERSION 1.2.0
)
psoc6_add_executable(
  SOURCES
    ${APP_DIR}/main.c
  LINK_LIBRARIES
    usbdev
    psoc6hal
  DESIGN_MODUS
    ${APP_DIR}/COMPONENT_CUSTOM_DESIGN_MODUS/TARGET_${BSP_NAME}/design.modus
  DESIGN_USBDEV
    ${APP_DIR}/COMPONENT_CUSTOM_DESIGN_MODUS/TARGET_${BSP_NAME}/design.cyusbdev
)
