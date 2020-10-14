psoc6_load_library(
  NAME serial-flash
  VERSION 1.0.1
)

set(SERIAL_FLASH_SOURCES
  ${SERIAL_FLASH_DIR}/cy_serial_flash_qspi.h
  ${SERIAL_FLASH_DIR}/cy_serial_flash_qspi.c
  ${SERIAL_FLASH_DIR}/cy_serial_flash_prog.c
)
set(SERIAL_FLASH_INCLUDE_DIRS
  ${SERIAL_FLASH_DIR}
)
set(SERIAL_FLASH_LINK_LIBRARIES
  mtb-hal-cat1
)

add_library(serial-flash STATIC EXCLUDE_FROM_ALL ${SERIAL_FLASH_SOURCES})
target_include_directories(serial-flash PUBLIC ${SERIAL_FLASH_INCLUDE_DIRS})
target_link_libraries(serial-flash PUBLIC ${SERIAL_FLASH_LINK_LIBRARIES})
