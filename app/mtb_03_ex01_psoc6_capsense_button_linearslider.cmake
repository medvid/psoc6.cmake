# This recipe is included from app/community.cmake
# APP_DIR points to the top-level repo directory

psoc6_add_executable(
  NAME
    mtb_03_ex01_psoc6_capsense_button_linearslider
  SOURCES
    ${APP_DIR}/mtb_training/session03/mtb_03_ex01_psoc6_capsense_button_linearslider/main.c
    ${APP_DIR}/mtb_training/session03/mtb_03_ex01_psoc6_capsense_button_linearslider/led.h
    ${APP_DIR}/mtb_training/session03/mtb_03_ex01_psoc6_capsense_button_linearslider/led.c
  INCLUDE_DIRS
    ${APP_DIR}/mtb_training/session03/mtb_03_ex01_psoc6_capsense_button_linearslider
  LINK_LIBRARIES
    psoc6hal
    retarget-io
    capsense
)
