psoc6_load_library(
  NAME display-eink-e2271cs021
  VERSION 1.0.0
)

set(DISPLAY_EINK_E2271CS021_SOURCES
  ${DISPLAY_EINK_E2271CS021_DIR}/mtb_e2271cs021.h
  ${DISPLAY_EINK_E2271CS021_DIR}/mtb_e2271cs021.c
  ${DISPLAY_EINK_E2271CS021_DIR}/mtb_e2271cs021_display.h
  ${DISPLAY_EINK_E2271CS021_DIR}/mtb_e2271cs021_hw_interface.h
  ${DISPLAY_EINK_E2271CS021_DIR}/mtb_e2271cs021_hw_interface.c
  ${DISPLAY_EINK_E2271CS021_DIR}/mtb_e2271cs021_pervasive_configuration.h
  ${DISPLAY_EINK_E2271CS021_DIR}/mtb_e2271cs021_pervasive_hardware_driver.h
  ${DISPLAY_EINK_E2271CS021_DIR}/mtb_e2271cs021_pervasive_hardware_driver.c
)
set(DISPLAY_EINK_E2271CS021_INCLUDE_DIRS
  ${DISPLAY_EINK_E2271CS021_DIR}
)
set(DISPLAY_EINK_E2271CS021_LINK_LIBRARIES
  psoc6hal
)

add_library(display-eink-e2271cs021 STATIC EXCLUDE_FROM_ALL ${DISPLAY_EINK_E2271CS021_SOURCES})
target_include_directories(display-eink-e2271cs021 PUBLIC ${DISPLAY_EINK_E2271CS021_INCLUDE_DIRS})
target_link_libraries(display-eink-e2271cs021 PUBLIC ${DISPLAY_EINK_E2271CS021_LINK_LIBRARIES})
