psoc6_load_library(
  NAME bmi160_driver
  URL  https://github.com/BoschSensortec/BMI160_driver
  TAG  bmi160_v3.8.1
)

set(BMI160_DRIVER_SOURCES
  ${BMI160_DRIVER_DIR}/bmi160.h
  ${BMI160_DRIVER_DIR}/bmi160.c
)
set(BMI160_DRIVER_INCLUDE_DIRS
  ${BMI160_DRIVER_DIR}
)
set(BMI160_DRIVER_LINK_LIBRARIES
  psoc6hal
)

add_library(bmi160_driver STATIC EXCLUDE_FROM_ALL ${BMI160_DRIVER_SOURCES})
target_include_directories(bmi160_driver PUBLIC ${BMI160_DRIVER_INCLUDE_DIRS})
target_link_libraries(bmi160_driver PUBLIC ${BMI160_DRIVER_LINK_LIBRARIES})
