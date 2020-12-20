# This recipe is included from app/community.cmake
# APP_DIR points to the top-level repo directory

psoc6_add_executable(
  NAME
    oled-freertos
  SOURCES
    ${APP_DIR}/sensor_interfacing/mtb-example-psoc6-oled-freertos/source/dht_task.h
    ${APP_DIR}/sensor_interfacing/mtb-example-psoc6-oled-freertos/source/dht_task.c
    ${APP_DIR}/sensor_interfacing/mtb-example-psoc6-oled-freertos/source/main.h
    ${APP_DIR}/sensor_interfacing/mtb-example-psoc6-oled-freertos/source/main.c
    ${APP_DIR}/sensor_interfacing/mtb-example-psoc6-oled-freertos/source/oled_task.h
    ${APP_DIR}/sensor_interfacing/mtb-example-psoc6-oled-freertos/source/oled_task.c
    ${APP_DIR}/sensor_interfacing/mtb-example-psoc6-oled-freertos/source/print_task.h
    ${APP_DIR}/sensor_interfacing/mtb-example-psoc6-oled-freertos/source/print_task.c
  LINK_LIBRARIES
    emwin-osts
    mtb-hal-cat1
    retarget-io
    freertos
    abstraction-rtos
    display-oled-ssd1306
)
