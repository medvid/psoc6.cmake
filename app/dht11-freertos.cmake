# This recipe is included from app/community.cmake
# APP_DIR points to the top-level repo directory

psoc6_check_bsp(
  CY8CPROTO-062-4343W
)

psoc6_add_executable(
  NAME
    dht11-freertos
  SOURCES
    ${APP_DIR}/sensor_interfacing/mtb-example-psoc6-dht11-freertos/source/dht_task.h
    ${APP_DIR}/sensor_interfacing/mtb-example-psoc6-dht11-freertos/source/dht_task.c
    ${APP_DIR}/sensor_interfacing/mtb-example-psoc6-dht11-freertos/source/main.h
    ${APP_DIR}/sensor_interfacing/mtb-example-psoc6-dht11-freertos/source/main.c
    ${APP_DIR}/sensor_interfacing/mtb-example-psoc6-dht11-freertos/source/print_task.h
    ${APP_DIR}/sensor_interfacing/mtb-example-psoc6-dht11-freertos/source/print_task.c
  INCLUDE_DIRS
    ${APP_DIR}/sensor_interfacing/mtb-example-psoc6-dht11-freertos/source
  LINK_LIBRARIES
    mtb-hal-cat1
    retarget-io
    freertos
)
