psoc6_load_library(
  NAME thermistor
  VERSION 1.0.0
)

set(THERMISTOR_SOURCES
  ${THERMISTOR_DIR}/mtb_thermistor_ntc_gpio.h
  ${THERMISTOR_DIR}/mtb_thermistor_ntc_gpio.c
)
set(THERMISTOR_INCLUDE_DIRS
  ${THERMISTOR_DIR}
)
set(THERMISTOR_LINK_LIBRARIES
  mtb-hal-cat1
)

add_library(thermistor STATIC EXCLUDE_FROM_ALL ${THERMISTOR_SOURCES})
target_include_directories(thermistor PUBLIC ${THERMISTOR_INCLUDE_DIRS})
target_link_libraries(thermistor PUBLIC ${THERMISTOR_LINK_LIBRARIES})
