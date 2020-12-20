psoc6_load_library(
  NAME display-tft-st7789v
  VERSION 1.0.1
)

set(DISPLAY_TFT_ST7789V_SOURCES
  ${DISPLAY_TFT_ST7789V_DIR}/mtb_st7789v.h
  ${DISPLAY_TFT_ST7789V_DIR}/mtb_st7789v.c
  ${DISPLAY_TFT_ST7789V_DIR}/configs/emwin/GUIConf.c
  ${DISPLAY_TFT_ST7789V_DIR}/configs/emwin/GUI_X.c
  ${DISPLAY_TFT_ST7789V_DIR}/configs/emwin/LCDConf.h
  ${DISPLAY_TFT_ST7789V_DIR}/configs/emwin/LCDConf.c
  ${DISPLAY_TFT_ST7789V_DIR}/configs/emwin/emwin.h
)
set(DISPLAY_TFT_ST7789V_INCLUDE_DIRS
  ${DISPLAY_TFT_ST7789V_DIR}
  ${DISPLAY_TFT_ST7789V_DIR}/configs/emwin/emwin.h
  ${EMWIN_INCLUDE_DIRS}
)
set(DISPLAY_TFT_ST7789V_LINK_LIBRARIES
  mtb-hal-cat1
)

add_library(display-tft-st7789v STATIC EXCLUDE_FROM_ALL ${DISPLAY_TFT_ST7789V_SOURCES})
target_include_directories(display-tft-st7789v PUBLIC ${DISPLAY_TFT_ST7789V_INCLUDE_DIRS})
target_link_libraries(display-tft-st7789v PUBLIC ${DISPLAY_TFT_ST7789V_LINK_LIBRARIES})
