psoc6_load_library(
  NAME CY8CKIT-028-EPD
  VERSION 1.0.0
)

set(CY8CKIT_028_EPD_SOURCES
  ${CY8CKIT_028_EPD_DIR}/cy8ckit_028_epd.h
  ${CY8CKIT_028_EPD_DIR}/cy8ckit_028_epd.c
  ${CY8CKIT_028_EPD_DIR}/cy8ckit_028_epd_pins.h
  ${CY8CKIT_028_EPD_DIR}/microphone_spk0838ht4hb.h
)
set(CY8CKIT_028_EPD_INCLUDE_DIRS
  ${CY8CKIT_028_EPD_DIR}
  ${CY8CKIT_028_EPD_DIR}/drivers
)
set(CY8CKIT_028_EPD_LINK_LIBRARIES
  mtb-hal-cat1
  bsp
  display-eink-e2271cs021
  sensor-motion-bmi160
  thermistor
)

add_library(CY8CKIT-028-EPD STATIC EXCLUDE_FROM_ALL ${CY8CKIT_028_EPD_SOURCES})
target_include_directories(CY8CKIT-028-EPD PUBLIC ${CY8CKIT_028_EPD_INCLUDE_DIRS})
target_link_libraries(CY8CKIT-028-EPD PUBLIC ${CY8CKIT_028_EPD_LINK_LIBRARIES})
