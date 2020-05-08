psoc6_load_library(
  NAME mqtt
  VERSION 1.0.1
)

set(MQTT_SOURCES
  ${MQTT_DIR}/cyport/include/cy_iot_network_secured_socket.h
  ${MQTT_DIR}/cyport/include/cy_iot_platform_types.h
  ${MQTT_DIR}/cyport/include/iot_config.h
  ${MQTT_DIR}/cyport/source/cy_iot_clock.c
  ${MQTT_DIR}/cyport/source/cy_iot_network_secured_socket.c
  ${MQTT_DIR}/cyport/source/cy_iot_threads_common.c
  ${MQTT_DIR}/cyport/source/COMPONENT_FREERTOS/cy_iot_threads.c
)
set(MQTT_INCLUDE_DIRS
  ${MQTT_DIR}/cyport/include
)
set(MQTT_LINK_LIBRARIES
  abstraction-rtos
  wifi-mw-core
  aws-iot-mqtt
)

add_library(mqtt STATIC EXCLUDE_FROM_ALL ${MQTT_SOURCES})
target_include_directories(mqtt PUBLIC ${MQTT_INCLUDE_DIRS})
target_link_libraries(mqtt PUBLIC ${MQTT_LINK_LIBRARIES})

# mqtt provides iot_config.h for aws-iot-base
target_include_directories(aws-iot-base PUBLIC ${MQTT_INCLUDE_DIRS})
# cy_iot_platform_types.h includes cyabs_rtos_impl.h
target_link_libraries(aws-iot-base PUBLIC abstraction-rtos)
