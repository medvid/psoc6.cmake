set(MBED_TARGET_DIR ${MBED_OS_DIR}/targets/TARGET_Cypress/TARGET_PSOC6)
set(MBED_TARGET_SOURCES
  ${MBED_TARGET_DIR}/cy_analogin_api.c
  ${MBED_TARGET_DIR}/cy_analogout_api.c
  ${MBED_TARGET_DIR}/cy_crc_api.c
  ${MBED_TARGET_DIR}/cy_flash_api.c
  ${MBED_TARGET_DIR}/cy_gpio_api.c
  ${MBED_TARGET_DIR}/cy_gpio_irq_api.c
  ${MBED_TARGET_DIR}/cy_i2c_api.c
  ${MBED_TARGET_DIR}/cy_lp_ticker_api.c
  ${MBED_TARGET_DIR}/cy_port_api.c
  ${MBED_TARGET_DIR}/cy_pwmout_api.c
  ${MBED_TARGET_DIR}/cy_qspi_api.c
  ${MBED_TARGET_DIR}/cy_reset_reason_api.c
  ${MBED_TARGET_DIR}/cy_rtc_api.c
  ${MBED_TARGET_DIR}/cy_serial_api.c
  ${MBED_TARGET_DIR}/cy_sleep_api.c
  ${MBED_TARGET_DIR}/cy_spi_api.c
  ${MBED_TARGET_DIR}/cy_trng_api.c
  #${MBED_TARGET_DIR}/cy_usb_phy.cpp
  #${MBED_TARGET_DIR}/cy_usb_phy_hw.h
  ${MBED_TARGET_DIR}/cy_us_ticker_api.c
  ${MBED_TARGET_DIR}/cy_watchdog_api.c
  ${MBED_TARGET_DIR}/device.h
  ${MBED_TARGET_DIR}/gpio_object.h
  ${MBED_TARGET_DIR}/mbed_overrides.c
  ${MBED_TARGET_DIR}/mbed_rtx.h
  ${MBED_TARGET_DIR}/objects.h
  ${MBED_TARGET_DIR}/PeripheralNames.h
  ${MBED_TARGET_DIR}/PeripheralPins.h
  ${MBED_TARGET_DIR}/pinmap.c
  ${MBED_TARGET_DIR}/PinNames.h
  ${MBED_TARGET_DIR}/PinNamesTypes.h
  ${MBED_TARGET_DIR}/PortNames.h
  ${MBED_TARGET_DIR}/TARGET_${MBED_BSP_NAME}/PeripheralPins.c
)
set(MBED_TARGET_INCLUDE_DIRS
  # BUG: targets/TARGET_Cypress/TARGET_PSOC6/mbed_overrides.c includes rtos/source/rtos_idle.h
  ${MBED_RTOS_DIR}/source
)
set(MBED_TARGET_LINK_LIBRARIES
  mbed-hal
)

add_library(mbed-target STATIC EXCLUDE_FROM_ALL ${MBED_TARGET_SOURCES})
target_include_directories(mbed-target PUBLIC ${MBED_TARGET_INCLUDE_DIRS})
target_compile_definitions(mbed-target PUBLIC ${MBED_TARGET_DEFINES})
target_link_libraries(mbed-target PUBLIC ${MBED_TARGET_LINK_LIBRARIES})
