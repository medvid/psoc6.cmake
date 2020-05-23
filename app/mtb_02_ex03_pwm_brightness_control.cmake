# This recipe is included from app/community.cmake
# APP_DIR points to the top-level repo directory

psoc6_add_executable(
  NAME
    mtb_02_ex03_pwm_brightness_control
  SOURCES
    ${APP_DIR}/mtb_training/session02/mtb_02_ex03_pwm_brightness_control/main.c
  LINK_LIBRARIES
    psoc6hal
)
