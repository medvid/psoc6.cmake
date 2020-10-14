# This recipe is included from app/community.cmake
# APP_DIR points to the top-level repo directory

# This application provides custom design.modus for the below boards
psoc6_check_bsp(
  CY8CKIT-062-BLE
  CY8CKIT-062-WIFI-BT
  CY8CPROTO-062-4343W
)
psoc6_add_executable(
  NAME
    mtb_02_ex02_pwm_blinkled
  SOURCES
    ${APP_DIR}/mtb_training/session02/mtb_02_ex02_pwm_blinkled/main.c
  LINK_LIBRARIES
    mtb-hal-cat1
  DESIGN_MODUS
    ${APP_DIR}/mtb_training/session02/mtb_02_ex02_pwm_blinkled/design_deps/${BSP_NAME}/design.modus
)
