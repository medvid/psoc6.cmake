psoc6_load_library(
  NAME CY8CKIT-032
  VERSION 1.0.0
)

set(CY8CKIT_032_SOURCES
  ${CY8CKIT_032_DIR}/cy8ckit_032.h
  ${CY8CKIT_032_DIR}/cy8ckit_032.c
)
set(CY8CKIT_032_INCLUDE_DIRS
  ${CY8CKIT_032_DIR}
)
set(CY8CKIT_032_LINK_LIBRARIES
  mtb-hal-cat1
  bsp
  display-oled-ssd1306
)

add_library(CY8CKIT-032 STATIC EXCLUDE_FROM_ALL ${CY8CKIT_032_SOURCES})
target_include_directories(CY8CKIT-032 PUBLIC ${CY8CKIT_032_INCLUDE_DIRS})
target_link_libraries(CY8CKIT-032 PUBLIC ${CY8CKIT_032_LINK_LIBRARIES})
