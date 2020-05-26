psoc6_load_library(
  NAME aws-iot
  URL  https://github.com/aws/aws-iot-device-sdk-embedded-C
  TAG  4c750b6f3f5a103fa35549aac96a4ad7f2c7afce
)

set(AWS_IOT_BASE_SOURCES
  ${AWS_IOT_DIR}/libraries/standard/common/include/iot_error.h
  ${AWS_IOT_DIR}/libraries/standard/common/include/iot_init.h
  ${AWS_IOT_DIR}/libraries/standard/common/include/iot_linear_containers.h
  ${AWS_IOT_DIR}/libraries/standard/common/include/iot_logging.h
  ${AWS_IOT_DIR}/libraries/standard/common/include/iot_logging_setup.h
  ${AWS_IOT_DIR}/libraries/standard/common/include/iot_static_memory.h
  ${AWS_IOT_DIR}/libraries/standard/common/include/iot_taskpool.h
  ${AWS_IOT_DIR}/libraries/standard/common/include/types/iot_taskpool_types.h
  ${AWS_IOT_DIR}/libraries/standard/common/src/iot_init.c
  ${AWS_IOT_DIR}/libraries/standard/common/src/iot_logging.c
  ${AWS_IOT_DIR}/libraries/standard/common/src/iot_static_memory_common.c
  ${AWS_IOT_DIR}/libraries/standard/common/src/iot_taskpool.c
  ${AWS_IOT_DIR}/libraries/standard/common/src/iot_taskpool_static_memory.c
  ${AWS_IOT_DIR}/libraries/standard/common/src/private/iot_taskpool_internal.h
  ${AWS_IOT_DIR}/ports/common/include/atomic/iot_atomic_gcc.h
  ${AWS_IOT_DIR}/ports/common/include/atomic/iot_atomic_generic.h
  ${AWS_IOT_DIR}/ports/common/include/iot_atomic.h
)
set(AWS_IOT_BASE_INCLUDE_DIRS
  ${AWS_IOT_DIR}/libraries
  ${AWS_IOT_DIR}/libraries/platform
  ${AWS_IOT_DIR}/libraries/standard/common/include
  ${AWS_IOT_DIR}/ports/common/include
)

add_library(aws-iot-base STATIC EXCLUDE_FROM_ALL ${AWS_IOT_BASE_SOURCES})
target_include_directories(aws-iot-base PUBLIC ${AWS_IOT_BASE_INCLUDE_DIRS})
target_link_libraries(aws-iot-base PUBLIC ${AWS_IOT_BASE_LINK_LIBRARIES})

set(AWS_IOT_MQTT_SOURCES
  ${AWS_IOT_DIR}/libraries/standard/mqtt/include/iot_mqtt.h
  ${AWS_IOT_DIR}/libraries/standard/mqtt/include/iot_mqtt_lightweight.h
  ${AWS_IOT_DIR}/libraries/standard/mqtt/include/iot_mqtt_protocol.h
  ${AWS_IOT_DIR}/libraries/standard/mqtt/include/types/iot_mqtt_types.h
  ${AWS_IOT_DIR}/libraries/standard/mqtt/src/iot_mqtt_api.c
  ${AWS_IOT_DIR}/libraries/standard/mqtt/src/iot_mqtt_helper.c
  ${AWS_IOT_DIR}/libraries/standard/mqtt/src/iot_mqtt_lightweight_api.c
  ${AWS_IOT_DIR}/libraries/standard/mqtt/src/iot_mqtt_network.c
  ${AWS_IOT_DIR}/libraries/standard/mqtt/src/iot_mqtt_operation.c
  ${AWS_IOT_DIR}/libraries/standard/mqtt/src/iot_mqtt_serialize.c
  ${AWS_IOT_DIR}/libraries/standard/mqtt/src/iot_mqtt_static_memory.c
  ${AWS_IOT_DIR}/libraries/standard/mqtt/src/iot_mqtt_subscription.c
  ${AWS_IOT_DIR}/libraries/standard/mqtt/src/iot_mqtt_validate.c
  ${AWS_IOT_DIR}/libraries/standard/mqtt/src/private/iot_mqtt_helper.h
  ${AWS_IOT_DIR}/libraries/standard/mqtt/src/private/iot_mqtt_internal.h
)
set(AWS_IOT_MQTT_INCLUDE_DIRS
  ${AWS_IOT_DIR}/libraries/standard/mqtt/include
  # BUG: always include "types/iot_mqtt_types.h"
  ${AWS_IOT_DIR}/libraries/standard/mqtt/include/types
)
set(AWS_IOT_MQTT_LINK_LIBRARIES
  aws-iot-base
)

add_library(aws-iot-mqtt STATIC EXCLUDE_FROM_ALL ${AWS_IOT_MQTT_SOURCES})
target_include_directories(aws-iot-mqtt PUBLIC ${AWS_IOT_MQTT_INCLUDE_DIRS})
target_link_libraries(aws-iot-mqtt PUBLIC ${AWS_IOT_MQTT_LINK_LIBRARIES})
