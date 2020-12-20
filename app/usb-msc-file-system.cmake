# This application provides custom design.modus for the below boards
psoc6_check_bsp(
  CY8CKIT-062S2-43012
  CY8CKIT-064B0S2-4343W
  CY8CPROTO-062-4343W
)

project(usb-msc-file-system)

psoc6_load_application(
  NAME mtb-example-psoc6-usb-msc-file-system
  VERSION 2.0.0
)
psoc6_add_executable(
  SOURCES
    ${APP_DIR}/main.c
    ${APP_DIR}/audio_fs.h
    ${APP_DIR}/audio_fs.c
    ${APP_DIR}/sd_card.h
    ${APP_DIR}/sd_card.c
    ${APP_DIR}/usb_msc/cy_usb_dev_msc.h
    ${APP_DIR}/usb_msc/cy_usb_dev_msc.c
    ${APP_DIR}/usb_msc/usb_comm.h
    ${APP_DIR}/usb_msc/usb_comm.c
    ${APP_DIR}/usb_msc/usb_scsi.h
    ${APP_DIR}/usb_msc/usb_scsi.c
    # TODO: lib/fatfs.cmake
    ${APP_DIR}/fatfs/diskio.h
    ${APP_DIR}/fatfs/diskio.c
    ${APP_DIR}/fatfs/ff.h
    ${APP_DIR}/fatfs/ff.c
    ${APP_DIR}/fatfs/ffconf.h
    ${APP_DIR}/fatfs/ffsystem.c
    ${APP_DIR}/fatfs/ffunicode.c
  INCLUDE_DIRS
    ${APP_DIR}
    ${APP_DIR}/usb_msc
    ${APP_DIR}/fatfs
  LINK_LIBRARIES
    usbdev
    mtb-hal-cat1
    retarget-io
  DESIGN_MODUS
    ${APP_DIR}/COMPONENT_CUSTOM_DESIGN_MODUS/TARGET_${BSP_NAME}/design.modus
  DESIGN_USBDEV
    ${APP_DIR}/COMPONENT_CUSTOM_DESIGN_MODUS/TARGET_${BSP_NAME}/design.cyusbdev
)
