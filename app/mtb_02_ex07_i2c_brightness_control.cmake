# This recipe is included from app/community.cmake
# APP_DIR points to the top-level repo directory

psoc6_add_executable(
  NAME
    mtb_02_ex07_i2c_brightness_control
  SOURCES
    ${APP_DIR}/mtb_training/session02/mtb_02_ex07_i2c_brightness_control/main.c
  LINK_LIBRARIES
    mtb-hal-cat1
    retarget-io
)
