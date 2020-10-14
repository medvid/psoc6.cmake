# This recipe is included from app/community.cmake
# APP_DIR points to the top-level repo directory

# This application provides custom design.modus for the below boards
psoc6_check_bsp(
  CY8CKIT-062-BLE
  CY8CKIT-062-WIFI-BT
  CY8CKIT-062S2-43012
  # BUG: GeneratedSource doesn't provide CYBSP_LED_RGB_RED/GREEN/BLUE
  #CY8CPROTO-062-4343W
  CY8CPROTO-062S3-4343W
  CYW9P62S1-43012EVB-01
  CYW9P62S1-43438EVB-01
)

psoc6_add_executable(
  NAME
    mtb_03_ex02_psoc6_capsense_gestures_linearslider
  SOURCES
    ${APP_DIR}/mtb_training/session03/mtb_03_ex02_psoc6_capsense_gestures_linearslider/main.c
  LINK_LIBRARIES
    mtb-hal-cat1
    retarget-io
    capsense
  DESIGN_MODUS
    ${APP_DIR}/mtb_training/session03/mtb_03_ex02_psoc6_capsense_gestures_linearslider/COMPONENT_CUSTOM_DESIGN_MODUS/TARGET_${BSP_NAME}/design.modus
  DESIGN_CAPSENSE
    ${APP_DIR}/mtb_training/session03/mtb_03_ex02_psoc6_capsense_gestures_linearslider/COMPONENT_CUSTOM_DESIGN_MODUS/TARGET_${BSP_NAME}/design.cycapsense
)
