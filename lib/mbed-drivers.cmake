set(MBED_DRIVERS_DIR ${MBED_OS_DIR}/drivers)
set(MBED_DRIVERS_SOURCES
  ${MBED_DRIVERS_DIR}/source/BufferedSerial.cpp
  ${MBED_DRIVERS_DIR}/source/FlashIAP.cpp
  ${MBED_DRIVERS_DIR}/source/InterruptIn.cpp
  ${MBED_DRIVERS_DIR}/source/MbedCRC.cpp
  ${MBED_DRIVERS_DIR}/source/SerialBase.cpp
  ${MBED_DRIVERS_DIR}/source/Ticker.cpp
  ${MBED_DRIVERS_DIR}/source/Timeout.cpp
  ${MBED_DRIVERS_DIR}/source/TimerEvent.cpp
)
set(MBED_DRIVERS_INCLUDE_DIRS
  ${MBED_DRIVERS_DIR}
)
set(MBED_DRIVERS_DEFINES
  DEVICE_CRC=1
  DEVICE_FLASH=1
  DEVICE_INTERRUPTIN=1
  DEVICE_LPTICKER=1
  DEVICE_SERIAL=1
  DEVICE_SLEEP=1
  DEVICE_TRNG=1
  DEVICE_USTICKER=1
  MBED_CRC_TABLE_SIZE=16
  #MBEDTLS_CONFIG_HW_SUPPORT=1
)
set(MBED_DRIVERS_LINK_LIBRARIES
  mbed-platform
)

add_library(mbed-drivers STATIC EXCLUDE_FROM_ALL ${MBED_DRIVERS_SOURCES})
target_include_directories(mbed-drivers PUBLIC ${MBED_DRIVERS_INCLUDE_DIRS})
target_compile_definitions(mbed-drivers PUBLIC ${MBED_DRIVERS_DEFINES})
target_link_libraries(mbed-drivers PUBLIC ${MBED_DRIVERS_LINK_LIBRARIES})
