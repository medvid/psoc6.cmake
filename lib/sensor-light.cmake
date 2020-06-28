psoc6_load_library(
  NAME sensor-light
  VERSION 1.0.0
)

set(SENSOR_LIGHT_SOURCES
  ${SENSOR_LIGHT_DIR}/mtb_light_sensor.h
  ${SENSOR_LIGHT_DIR}/mtb_light_sensor.c
)
set(SENSOR_LIGHT_INCLUDE_DIRS
  ${SENSOR_LIGHT_DIR}
)
set(SENSOR_LIGHT_LINK_LIBRARIES
  psoc6hal
)

add_library(sensor-light STATIC EXCLUDE_FROM_ALL ${SENSOR_LIGHT_SOURCES})
target_include_directories(sensor-light PUBLIC ${SENSOR_LIGHT_INCLUDE_DIRS})
target_link_libraries(sensor-light PUBLIC ${SENSOR_LIGHT_LINK_LIBRARIES})
