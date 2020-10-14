psoc6_load_library(
  NAME rgb-led
  VERSION 1.1.1
)

set(RGB_LED_SOURCES
  ${RGB_LED_DIR}/cy_rgb_led.h
  ${RGB_LED_DIR}/cy_rgb_led.c
)
set(RGB_LED_INCLUDE_DIRS
  ${RGB_LED_DIR}
)
set(RGB_LED_LINK_LIBRARIES
  mtb-hal-cat1
)

add_library(rgb-led STATIC EXCLUDE_FROM_ALL ${RGB_LED_SOURCES})
target_include_directories(rgb-led PUBLIC ${RGB_LED_INCLUDE_DIRS})
target_link_libraries(rgb-led PUBLIC ${RGB_LED_LINK_LIBRARIES})
