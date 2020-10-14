psoc6_load_library(
  NAME usbdev
  VERSION 2.0.0
)

set(USBDEV_SOURCES
  ${USBDEV_DIR}/cy_usb_dev.h
  ${USBDEV_DIR}/cy_usb_dev.c
  ${USBDEV_DIR}/cy_usb_dev_descr.h
  ${USBDEV_DIR}/cy_usb_dev_audio.h
  ${USBDEV_DIR}/cy_usb_dev_audio.c
  ${USBDEV_DIR}/cy_usb_dev_audio_descr.h
  ${USBDEV_DIR}/cy_usb_dev_cdc.h
  ${USBDEV_DIR}/cy_usb_dev_cdc.c
  ${USBDEV_DIR}/cy_usb_dev_cdc_descr.h
  ${USBDEV_DIR}/cy_usb_dev_hid.h
  ${USBDEV_DIR}/cy_usb_dev_hid.c
  ${USBDEV_DIR}/cy_usb_dev_hid_descr.h
)
set(USBDEV_INCLUDE_DIRS
  ${USBDEV_DIR}
)
set(USBDEV_LINK_LIBRARIES
  mtb-pdl-cat1
)

add_library(usbdev STATIC EXCLUDE_FROM_ALL ${USBDEV_SOURCES})
target_include_directories(usbdev PUBLIC ${USBDEV_INCLUDE_DIRS})
target_link_libraries(usbdev PUBLIC ${USBDEV_LINK_LIBRARIES})
