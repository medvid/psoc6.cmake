project(anycloud-mqtt-client)

psoc6_load_application(
  NAME mtb-example-anycloud-mqtt-client
  VERSION 1.0.0
)
psoc6_add_executable(
  SOURCES
    ${APP_DIR}/source/main.c
    ${APP_DIR}/source/mqtt_client_config.c
    ${APP_DIR}/source/mqtt_task.h
    ${APP_DIR}/source/mqtt_task.c
    ${APP_DIR}/source/publisher_task.h
    ${APP_DIR}/source/publisher_task.c
    ${APP_DIR}/source/subscriber_task.h
    ${APP_DIR}/source/subscriber_task.c
  INCLUDE_DIRS
    ${APP_DIR}/source
    ${CMAKE_SOURCE_DIR}/configs
    ${CMAKE_SOURCE_DIR}/configs/mqtt
  LINK_LIBRARIES
    retarget-io
    wifi-connection-manager
    mqtt
)
