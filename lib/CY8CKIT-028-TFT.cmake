psoc6_load_library(
  NAME CY8CKIT-028-TFT
  VERSION 1.1.0
)

set(CY8CKIT_028_TFT_SOURCES
  ${CY8CKIT_028_TFT_DIR}/cy8ckit_028_tft.h
  ${CY8CKIT_028_TFT_DIR}/cy8ckit_028_tft.c
  ${CY8CKIT_028_TFT_DIR}/cy8ckit_028_tft_pins.h
  ${CY8CKIT_028_TFT_DIR}/cy_tft.h
  ${CY8CKIT_028_TFT_DIR}/microphone_spk0838ht4hb.h
)
set(CY8CKIT_028_TFT_INCLUDE_DIRS
  ${CY8CKIT_028_TFT_DIR}
)
set(CY8CKIT_028_TFT_LINK_LIBRARIES
  mtb-hal-cat1
  bsp
  audio-codec-ak4954a
  display-tft-st7789v
  sensor-light
  sensor-motion-bmi160
)

add_library(CY8CKIT-028-TFT STATIC EXCLUDE_FROM_ALL ${CY8CKIT_028_TFT_SOURCES})
target_include_directories(CY8CKIT-028-TFT PUBLIC ${CY8CKIT_028_TFT_INCLUDE_DIRS})
target_link_libraries(CY8CKIT-028-TFT PUBLIC ${CY8CKIT_028_TFT_LINK_LIBRARIES})
