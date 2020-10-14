psoc6_load_library(
  NAME sensor-motion-bmi160
  VERSION 1.0.0
)

set(SENSOR_MOTION_BMI160_SOURCES
  ${SENSOR_MOTION_BMI160_DIR}/mtb_bmi160.h
  ${SENSOR_MOTION_BMI160_DIR}/mtb_bmi160.c
)
set(SENSOR_MOTION_BMI160_INCLUDE_DIRS
  ${SENSOR_MOTION_BMI160_DIR}
)
set(SENSOR_MOTION_BMI160_LINK_LIBRARIES
  mtb-hal-cat1
  bmi160_driver
)

add_library(sensor-motion-bmi160 STATIC EXCLUDE_FROM_ALL ${SENSOR_MOTION_BMI160_SOURCES})
target_include_directories(sensor-motion-bmi160 PUBLIC ${SENSOR_MOTION_BMI160_INCLUDE_DIRS})
target_link_libraries(sensor-motion-bmi160 PUBLIC ${SENSOR_MOTION_BMI160_LINK_LIBRARIES})
