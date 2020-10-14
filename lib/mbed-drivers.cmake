set(MBED_DRIVERS_DIR ${MBED_OS_DIR}/drivers)
set(MBED_DRIVERS_SOURCES
  ${MBED_DRIVERS_DIR}/AnalogIn.h
  ${MBED_DRIVERS_DIR}/AnalogOut.h
  ${MBED_DRIVERS_DIR}/BufferedSerial.h
  ${MBED_DRIVERS_DIR}/BusIn.h
  ${MBED_DRIVERS_DIR}/BusInOut.h
  ${MBED_DRIVERS_DIR}/BusOut.h
  ${MBED_DRIVERS_DIR}/CAN.h
  ${MBED_DRIVERS_DIR}/DigitalIn.h
  ${MBED_DRIVERS_DIR}/DigitalInOut.h
  ${MBED_DRIVERS_DIR}/DigitalOut.h
  ${MBED_DRIVERS_DIR}/FlashIAP.h
  ${MBED_DRIVERS_DIR}/HighResClock.h
  ${MBED_DRIVERS_DIR}/I2C.h
  ${MBED_DRIVERS_DIR}/I2CSlave.h
  ${MBED_DRIVERS_DIR}/InterruptIn.h
  ${MBED_DRIVERS_DIR}/LowPowerClock.h
  ${MBED_DRIVERS_DIR}/LowPowerTicker.h
  ${MBED_DRIVERS_DIR}/LowPowerTimeout.h
  ${MBED_DRIVERS_DIR}/LowPowerTimer.h
  ${MBED_DRIVERS_DIR}/MbedCRC.h
  ${MBED_DRIVERS_DIR}/PortIn.h
  ${MBED_DRIVERS_DIR}/PortInOut.h
  ${MBED_DRIVERS_DIR}/PortOut.h
  ${MBED_DRIVERS_DIR}/PwmOut.h
  ${MBED_DRIVERS_DIR}/QSPI.h
  ${MBED_DRIVERS_DIR}/RealTimeClock.h
  ${MBED_DRIVERS_DIR}/ResetReason.h
  ${MBED_DRIVERS_DIR}/SerialBase.h
  ${MBED_DRIVERS_DIR}/SerialWireOutput.h
  ${MBED_DRIVERS_DIR}/SPI.h
  ${MBED_DRIVERS_DIR}/SPISlave.h
  ${MBED_DRIVERS_DIR}/TickerDataClock.h
  ${MBED_DRIVERS_DIR}/Ticker.h
  ${MBED_DRIVERS_DIR}/Timeout.h
  ${MBED_DRIVERS_DIR}/TimerEvent.h
  ${MBED_DRIVERS_DIR}/Timer.h
  ${MBED_DRIVERS_DIR}/UnbufferedSerial.h
  #${MBED_DRIVERS_DIR}/USBAudio.h
  #${MBED_DRIVERS_DIR}/USBCDC_ECM.h
  #${MBED_DRIVERS_DIR}/USBCDC.h
  #${MBED_DRIVERS_DIR}/USBHID.h
  #${MBED_DRIVERS_DIR}/USBKeyboard.h
  #${MBED_DRIVERS_DIR}/USBMIDI.h
  #${MBED_DRIVERS_DIR}/USBMouse.h
  #${MBED_DRIVERS_DIR}/USBMouseKeyboard.h
  #${MBED_DRIVERS_DIR}/USBMSD.h
  #${MBED_DRIVERS_DIR}/USBSerial.h
  ${MBED_DRIVERS_DIR}/Watchdog.h
  ${MBED_DRIVERS_DIR}/internal/AsyncOp.h
  ${MBED_DRIVERS_DIR}/internal/ByteBuffer.h
  ${MBED_DRIVERS_DIR}/internal/EndpointResolver.h
  ${MBED_DRIVERS_DIR}/internal/LinkedListBase.h
  ${MBED_DRIVERS_DIR}/internal/LinkedList.h
  ${MBED_DRIVERS_DIR}/internal/LinkEntry.h
  ${MBED_DRIVERS_DIR}/internal/MIDIMessage.h
  ${MBED_DRIVERS_DIR}/internal/OperationListBase.h
  ${MBED_DRIVERS_DIR}/internal/OperationList.h
  ${MBED_DRIVERS_DIR}/internal/PolledQueue.h
  ${MBED_DRIVERS_DIR}/internal/SFDP.h
  ${MBED_DRIVERS_DIR}/internal/TaskBase.h
  ${MBED_DRIVERS_DIR}/internal/Task.h
  ${MBED_DRIVERS_DIR}/internal/TaskQueue.h
  #${MBED_DRIVERS_DIR}/internal/USBAudio_Types.h
  #${MBED_DRIVERS_DIR}/internal/USBDescriptor.h
  #${MBED_DRIVERS_DIR}/internal/USBDevice.h
  #${MBED_DRIVERS_DIR}/internal/USBDevice_Types.h
  #${MBED_DRIVERS_DIR}/internal/USBHID_Types.h
  ${MBED_DRIVERS_DIR}/source/AnalogIn.cpp
  ${MBED_DRIVERS_DIR}/source/AnalogOut.cpp
  ${MBED_DRIVERS_DIR}/source/BufferedSerial.cpp
  ${MBED_DRIVERS_DIR}/source/BusIn.cpp
  ${MBED_DRIVERS_DIR}/source/BusInOut.cpp
  ${MBED_DRIVERS_DIR}/source/BusOut.cpp
  ${MBED_DRIVERS_DIR}/source/CAN.cpp
  ${MBED_DRIVERS_DIR}/source/DigitalIn.cpp
  ${MBED_DRIVERS_DIR}/source/DigitalInOut.cpp
  ${MBED_DRIVERS_DIR}/source/DigitalOut.cpp
  ${MBED_DRIVERS_DIR}/source/FlashIAP.cpp
  ${MBED_DRIVERS_DIR}/source/I2C.cpp
  ${MBED_DRIVERS_DIR}/source/I2CSlave.cpp
  ${MBED_DRIVERS_DIR}/source/InterruptIn.cpp
  ${MBED_DRIVERS_DIR}/source/MbedCRC.cpp
  ${MBED_DRIVERS_DIR}/source/PortIn.cpp
  ${MBED_DRIVERS_DIR}/source/PortInOut.cpp
  ${MBED_DRIVERS_DIR}/source/PortOut.cpp
  ${MBED_DRIVERS_DIR}/source/PwmOut.cpp
  ${MBED_DRIVERS_DIR}/source/QSPI.cpp
  ${MBED_DRIVERS_DIR}/source/ResetReason.cpp
  ${MBED_DRIVERS_DIR}/source/SerialBase.cpp
  ${MBED_DRIVERS_DIR}/source/SerialWireOutput.cpp
  ${MBED_DRIVERS_DIR}/source/SFDP.cpp
  ${MBED_DRIVERS_DIR}/source/SPI.cpp
  ${MBED_DRIVERS_DIR}/source/SPISlave.cpp
  ${MBED_DRIVERS_DIR}/source/Ticker.cpp
  ${MBED_DRIVERS_DIR}/source/Timeout.cpp
  ${MBED_DRIVERS_DIR}/source/Timer.cpp
  ${MBED_DRIVERS_DIR}/source/TimerEvent.cpp
  ${MBED_DRIVERS_DIR}/source/UnbufferedSerial.cpp
  ${MBED_DRIVERS_DIR}/source/Watchdog.cpp
  #${MBED_DRIVERS_DIR}/source/usb/AsyncOp.cpp
  #${MBED_DRIVERS_DIR}/source/usb/ByteBuffer.cpp
  #${MBED_DRIVERS_DIR}/source/usb/EndpointResolver.cpp
  #${MBED_DRIVERS_DIR}/source/usb/LinkedListBase.cpp
  #${MBED_DRIVERS_DIR}/source/usb/OperationListBase.cpp
  #${MBED_DRIVERS_DIR}/source/usb/PolledQueue.cpp
  #${MBED_DRIVERS_DIR}/source/usb/TaskBase.cpp
  #${MBED_DRIVERS_DIR}/source/usb/USBAudio.cpp
  #{MBED_DRIVERS_DIR}/source/usb/USBCDC.cpp
  #${MBED_DRIVERS_DIR}/source/usb/USBCDC_ECM.cpp
  #${MBED_DRIVERS_DIR}/source/usb/USBDevice.cpp
  #${MBED_DRIVERS_DIR}/source/usb/USBHID.cpp
  #${MBED_DRIVERS_DIR}/source/usb/USBKeyboard.cpp
  #${MBED_DRIVERS_DIR}/source/usb/USBMIDI.cpp
  #${MBED_DRIVERS_DIR}/source/usb/USBMouse.cpp
  #${MBED_DRIVERS_DIR}/source/usb/USBMouseKeyboard.cpp
  #${MBED_DRIVERS_DIR}/source/usb/USBMSD.cpp
  #${MBED_DRIVERS_DIR}/source/usb/USBSerial.cpp
)
set(MBED_DRIVERS_INCLUDE_DIRS
  ${MBED_DRIVERS_DIR}
)
set(MBED_DRIVERS_DEFINES
  DEVICE_ANALOGIN=1
  #DEVICE_ANALOGOUT=1
  DEVICE_CRC=1
  DEVICE_FLASH=1
  DEVICE_I2C=1
  DEVICE_I2C_ASYNCH=1
  DEVICE_I2CSLAVE=1
  DEVICE_INTERRUPTIN=1
  DEVICE_LPTICKER=1
  DEVICE_PORTIN=1
  DEVICE_PORTOUT=1
  DEVICE_PORTINOUT=1
  DEVICE_PWMOUT=1
  DEVICE_QSPI=1
  DEVICE_RESET_REASON=1
  DEVICE_RTC=1
  DEVICE_SERIAL=1
  DEVICE_SERIAL_FC=1
  DEVICE_SERIAL_ASYNCH=1
  DEVICE_SLEEP=1
  DEVICE_SPI=1
  DEVICE_SPI_ASYNCH=1
  DEVICE_SPISLAVE=1
  DEVICE_STDIO_MESSAGES=1
  DEVICE_TRNG=1
  #DEVICE_USBDEVICE=1
  DEVICE_USTICKER=1
  DEVICE_WATCHDOG=1

  # TODO
  MBED_TICKLESS=1

  # Default TX buffer size for a BufferedSerial instance (unit Bytes))
  MBED_CONF_DRIVERS_UART_SERIAL_TXBUF_SIZE=256

  # Default RX buffer size for a BufferedSerial instance (unit Bytes))
  MBED_CONF_DRIVERS_UART_SERIAL_RXBUF_SIZE=256

  # Number of entries in each of MbedCRC's pre-computed software tables.
  # Higher values increase speed, but also increase image size.
  # The value has no effect if the target performs the CRC in hardware.
  # Permitted values are 0, 16 or 256.
  MBED_CRC_TABLE_SIZE=16

  # The maximum number of SPI peripherals used at the same time.
  # Determines RAM allocated for SPI peripheral management.
  # If null, limit determined by hardware.
  #MBED_CONF_DRIVERS_SPI_COUNT_MAX

  # QSPI data I/O 0 pin
  MBED_CONF_DRIVERS_QSPI_IO0=QSPI_FLASH1_IO0

  # QSPI data I/O 1 pin
  MBED_CONF_DRIVERS_QSPI_IO1=QSPI_FLASH1_IO1

  # QSPI data I/O 2 pin
  MBED_CONF_DRIVERS_QSPI_IO2=QSPI_FLASH1_IO2

  # QSPI data I/O 3 pin
  MBED_CONF_DRIVERS_QSPI_IO3=QSPI_FLASH1_IO3

  # QSPI clock pin
  MBED_CONF_DRIVERS_QSPI_SCK=QSPI_FLASH1_SCK

  # QSPI chip select pin
  MBED_CONF_DRIVERS_QSPI_CSN=QSPI_FLASH1_CSN

  # Default reference voltage for ADC (float)
  MBED_CONF_TARGET_DEFAULT_ADC_VREF=3.3F
)
set(MBED_DRIVERS_LINK_LIBRARIES
  mbed-platform
  mtb-hal-cat1
)

add_library(mbed-drivers STATIC EXCLUDE_FROM_ALL ${MBED_DRIVERS_SOURCES})
target_include_directories(mbed-drivers PUBLIC ${MBED_DRIVERS_INCLUDE_DIRS})
target_compile_definitions(mbed-drivers PUBLIC ${MBED_DRIVERS_DEFINES})
target_link_libraries(mbed-drivers PUBLIC ${MBED_DRIVERS_LINK_LIBRARIES})
