# BUG: CYBSP_USER_BTN
return()

# This application provides custom design.modus for the below boards
psoc6_check_bsp(
  CY8CKIT-062-WIFI-BT
  CY8CKIT-062S2-43012
  CY8CPROTO-062-4343W
  CY8CPROTO-062S3-4343W
  CYW9P62S1-43012EVB-01
  CYW9P62S1-43438EVB-01
)

project(usb-msc-logger)

psoc6_load_application(
  NAME mtb-example-psoc6-usb-msc-logger
  VERSION 1.0.0
)
psoc6_add_executable(
  SOURCES
    ${APP_DIR}/main.c
    ${APP_DIR}/config.h
    ${APP_DIR}/cy_usb_dev_msc.h
    ${APP_DIR}/cy_usb_dev_msc.c
    ${APP_DIR}/file_system.h
    ${APP_DIR}/file_system.c
    ${APP_DIR}/usb_comm.h
    ${APP_DIR}/usb_comm.c
    ${APP_DIR}/usb_scsi.h
    ${APP_DIR}/usb_scsi.c
  LINK_LIBRARIES
    usbdev
    mtb-hal-cat1
  DESIGN_MODUS
    ${APP_DIR}/COMPONENT_CUSTOM_DESIGN_MODUS/TARGET_${BSP_NAME}/design.modus
  DESIGN_USBDEV
    ${APP_DIR}/COMPONENT_CUSTOM_DESIGN_MODUS/TARGET_${BSP_NAME}/design.cyusbdev
)
