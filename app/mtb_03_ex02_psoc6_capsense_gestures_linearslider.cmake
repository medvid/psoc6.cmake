# This recipe is included from app/community.cmake
# APP_DIR points to the top-level repo directory

psoc6_add_executable(
  NAME
    mtb_03_ex02_psoc6_capsense_gestures_linearslider
  SOURCES
    ${APP_DIR}/mtb_training/session03/mtb_03_ex02_psoc6_capsense_gestures_linearslider/main.c
  LINK_LIBRARIES
    psoc6hal
    retarget-io
    capsense
  DESIGN_MODUS
    ${APP_DIR}/mtb_training/session03/mtb_03_ex02_psoc6_capsense_gestures_linearslider/COMPONENT_CUSTOM_DESIGN_MODUS/TARGET_${BSP_NAME}/design.modus
  DESIGN_CAPSENSE
    ${APP_DIR}/mtb_training/session03/mtb_03_ex02_psoc6_capsense_gestures_linearslider/COMPONENT_CUSTOM_DESIGN_MODUS/TARGET_${BSP_NAME}/design.cycapsense
)
