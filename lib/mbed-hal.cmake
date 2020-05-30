set(MBED_HAL_DIR ${MBED_OS_DIR}/hal)
set(MBED_HAL_SOURCES
  ${MBED_HAL_DIR}/analogin_api.h
  ${MBED_HAL_DIR}/analogout_api.h
  ${MBED_HAL_DIR}/buffer.h
  ${MBED_HAL_DIR}/can_api.h
  ${MBED_HAL_DIR}/can_helper.h
  ${MBED_HAL_DIR}/crc_api.h
  ${MBED_HAL_DIR}/critical_section_api.h
  ${MBED_HAL_DIR}/dma_api.h
  ${MBED_HAL_DIR}/flash_api.h
  ${MBED_HAL_DIR}/gpio_api.h
  ${MBED_HAL_DIR}/gpio_irq_api.h
  ${MBED_HAL_DIR}/i2c_api.h
  ${MBED_HAL_DIR}/itm_api.h
  ${MBED_HAL_DIR}/LowPowerTickerWrapper.h
  ${MBED_HAL_DIR}/LowPowerTickerWrapper.cpp
  ${MBED_HAL_DIR}/lp_ticker_api.h
  ${MBED_HAL_DIR}/mbed_compat.c
  ${MBED_HAL_DIR}/mbed_critical_section_api.c
  ${MBED_HAL_DIR}/mbed_flash_api.c
  ${MBED_HAL_DIR}/mbed_gpio.c
  ${MBED_HAL_DIR}/mbed_gpio_irq.c
  ${MBED_HAL_DIR}/mbed_itm_api.c
  ${MBED_HAL_DIR}/mbed_lp_ticker_api.c
  ${MBED_HAL_DIR}/mbed_lp_ticker_wrapper.cpp
  ${MBED_HAL_DIR}/mbed_lp_ticker_wrapper.h
  ${MBED_HAL_DIR}/mbed_pinmap_common.c
  ${MBED_HAL_DIR}/mbed_pinmap_default.cpp
  ${MBED_HAL_DIR}/mbed_ticker_api.c
  ${MBED_HAL_DIR}/mbed_us_ticker_api.c
  ${MBED_HAL_DIR}/mpu_api.h
  ${MBED_HAL_DIR}/pinmap.h
  ${MBED_HAL_DIR}/port_api.h
  ${MBED_HAL_DIR}/pwmout_api.h
  ${MBED_HAL_DIR}/qspi_api.h
  ${MBED_HAL_DIR}/reset_reason_api.h
  ${MBED_HAL_DIR}/rtc_api.h
  ${MBED_HAL_DIR}/serial_api.h
  ${MBED_HAL_DIR}/sleep_api.h
  ${MBED_HAL_DIR}/spi_api.h
  ${MBED_HAL_DIR}/static_pinmap.h
  ${MBED_HAL_DIR}/static_pinmap.cpp
  ${MBED_HAL_DIR}/ticker_api.h
  ${MBED_HAL_DIR}/trng_api.h
  ${MBED_HAL_DIR}/us_ticker_api.h
  ${MBED_HAL_DIR}/watchdog_api.h
)
set(MBED_HAL_INCLUDE_DIRS
  ${MBED_HAL_DIR}
)
set(MBED_HAL_LINK_LIBRARIES
  mbed-drivers
)

add_library(mbed-hal STATIC EXCLUDE_FROM_ALL ${MBED_HAL_SOURCES})
target_include_directories(mbed-hal PUBLIC ${MBED_HAL_INCLUDE_DIRS})
target_link_libraries(mbed-hal PUBLIC ${MBED_HAL_LINK_LIBRARIES})

# mbed_critical.c depends on the HAL layer providing core_util_critical_section_enter/_exit
target_link_libraries(mbed-platform PRIVATE mbed-hal)
