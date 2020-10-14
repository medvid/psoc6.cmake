# This recipe is included from app/community.cmake
# APP_DIR points to the top-level repo directory

psoc6_add_executable(
  NAME
    mtb_02_ex09_uart
  SOURCES
    ${APP_DIR}/mtb_training/session02/mtb_02_ex09_uart/main.c
  LINK_LIBRARIES
    mtb-hal-cat1
    retarget-io
)
