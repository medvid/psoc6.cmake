project(anycloud-mqtt-client)

psoc6_load_application(
  NAME mtb-example-anycloud-mqtt-client
  VERSION 1.1.0
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
    # Note: global FreeRTOSConfig.h takes preference over app-specific one
    ${CMAKE_SOURCE_DIR}/configs
    ${APP_DIR}/configs
  LINK_LIBRARIES
    retarget-io
    wifi-connection-manager
    mqtt
)
