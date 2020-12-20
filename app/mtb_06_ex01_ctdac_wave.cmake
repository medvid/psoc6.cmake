# This recipe is included from app/community.cmake
# APP_DIR points to the top-level repo directory

psoc6_check_bsp(
  CY8CKIT-062-WIFI-BT
)

psoc6_add_executable(
  NAME
    mtb_06_ex01_ctdac_wave
  SOURCES
    ${APP_DIR}/mtb_training/session06/mtb_06_ex01_ctdac_wave/main.c
  LINK_LIBRARIES
    mtb-hal-cat1
  DESIGN_MODUS
    ${APP_DIR}/mtb_training/session06/mtb_06_ex01_ctdac_wave/design_deps/${BSP_NAME}/design.modus
)
