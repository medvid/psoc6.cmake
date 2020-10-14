# This recipe is included from app/community.cmake
# APP_DIR points to the top-level repo directory

psoc6_check_bsp(
  CY8CKIT-062-WIFI-BT
)

psoc6_add_executable(
  NAME
    mtb_05_ex02_deep_sleep
  SOURCES
    ${APP_DIR}/mtb_training/session05/mtb_05_ex02_deep_sleep/main.c
  LINK_LIBRARIES
    mtb-hal-cat1
)
