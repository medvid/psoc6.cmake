# This recipe is included from app/community.cmake
# APP_DIR points to the top-level repo directory

psoc6_check_bsp(
  CY8CKIT-062-WIFI-BT
  CY8CKIT-062S2-43012
  CY8CPROTO-062-4343W
)

psoc6_add_executable(
  NAME
    mtb_04_ex01_capsense_led_tcp
  SOURCES
    ${APP_DIR}/mtb_training/session04/mtb_ex04_ex01_capsense_led_tcp/source/main.c
    ${APP_DIR}/mtb_training/session04/mtb_ex04_ex01_capsense_led_tcp/source/capsense_task.h
    ${APP_DIR}/mtb_training/session04/mtb_ex04_ex01_capsense_led_tcp/source/capsense_task.c
    ${APP_DIR}/mtb_training/session04/mtb_ex04_ex01_capsense_led_tcp/source/led_task.h
    ${APP_DIR}/mtb_training/session04/mtb_ex04_ex01_capsense_led_tcp/source/led_task.c
    ${APP_DIR}/mtb_training/session04/mtb_ex04_ex01_capsense_led_tcp/source/tcp_client.h
    ${APP_DIR}/mtb_training/session04/mtb_ex04_ex01_capsense_led_tcp/source/tcp_client.c
  LINK_LIBRARIES
    psoc6hal
    retarget-io
    capsense
    wifi-connection-manager
)
