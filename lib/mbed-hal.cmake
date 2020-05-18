set(MBED_HAL_DIR ${MBED_OS_DIR}/hal)
set(MBED_HAL_SOURCES
  ${MBED_HAL_DIR}/mbed_critical_section_api.c
  ${MBED_HAL_DIR}/mbed_gpio.c
  ${MBED_HAL_DIR}/mbed_lp_ticker_api.c
  ${MBED_HAL_DIR}/mbed_lp_ticker_wrapper.cpp
  ${MBED_HAL_DIR}/mbed_ticker_api.c
  ${MBED_HAL_DIR}/mbed_us_ticker_api.c
  ${MBED_HAL_DIR}/static_pinmap.cpp
)
set(MBED_HAL_INCLUDE_DIRS
  ${MBED_HAL_DIR}
)
set(MBED_HAL_DEFINES
  # TBD
)
set(MBED_HAL_LINK_LIBRARIES
  mbed-drivers
)

add_library(mbed-hal STATIC EXCLUDE_FROM_ALL ${MBED_HAL_SOURCES})
target_include_directories(mbed-hal PUBLIC ${MBED_HAL_INCLUDE_DIRS})
target_compile_definitions(mbed-hal PUBLIC ${MBED_HAL_DEFINES})
target_link_libraries(mbed-hal PUBLIC ${MBED_HAL_LINK_LIBRARIES})

# mbed_critical.c depends on the HAL layer providing core_util_critical_section_enter/_exit
target_link_libraries(mbed-platform PRIVATE mbed-hal)
