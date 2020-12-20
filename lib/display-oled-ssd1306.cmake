psoc6_load_library(
  NAME display-oled-ssd1306
  VERSION 1.0.1
)

# TODO: split emwin and u8g2 backends as two separate libraries
set(DISPLAY_OLED_SSD1306_SOURCES
  ${DISPLAY_OLED_SSD1306_DIR}/mtb_ssd1306.h
  ${DISPLAY_OLED_SSD1306_DIR}/mtb_ssd1306.c
  ${DISPLAY_OLED_SSD1306_DIR}/mtb_ssd1306_i2c.h
  ${DISPLAY_OLED_SSD1306_DIR}/configs/emwin/GUIConf.c
  ${DISPLAY_OLED_SSD1306_DIR}/configs/emwin/GUI_X.c
  ${DISPLAY_OLED_SSD1306_DIR}/configs/emwin/LCDConf.h
  ${DISPLAY_OLED_SSD1306_DIR}/configs/emwin/LCDConf.c
  ${DISPLAY_OLED_SSD1306_DIR}/configs/emwin/emwin.h
)
set(DISPLAY_OLED_SSD1306_DEFINES
  EMWIN_ENABLED
)
set(DISPLAY_OLED_SSD1306_INCLUDE_DIRS
  ${DISPLAY_OLED_SSD1306_DIR}
  ${DISPLAY_OLED_SSD1306_DIR}/configs/emwin
  ${EMWIN_INCLUDE_DIRS}
)
set(DISPLAY_OLED_SSD1306_LINK_LIBRARIES
  mtb-hal-cat1
)

if(NOT ${OS} STREQUAL NOOS)
  list(APPEND DISPLAY_OLED_SSD1306_LINK_LIBRARIES abstraction-rtos)
endif()

add_library(display-oled-ssd1306 STATIC EXCLUDE_FROM_ALL ${DISPLAY_OLED_SSD1306_SOURCES})
target_compile_definitions(display-oled-ssd1306 PRIVATE ${DISPLAY_OLED_SSD1306_DEFINES})
target_include_directories(display-oled-ssd1306 PUBLIC ${DISPLAY_OLED_SSD1306_INCLUDE_DIRS})
target_link_libraries(display-oled-ssd1306 PUBLIC ${DISPLAY_OLED_SSD1306_LINK_LIBRARIES})
