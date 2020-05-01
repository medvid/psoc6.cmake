psoc6_load_library(
  NAME emeeprom
  VERSION 2.0.0
)

set(EMEEPROM_SOURCES
  ${EMEEPROM_DIR}/cy_em_eeprom.h
  ${EMEEPROM_DIR}/cy_em_eeprom.c
)
set(EMEEPROM_INCLUDE_DIRS
  ${EMEEPROM_DIR}
)
set(EMEEPROM_LINK_LIBRARIES
  psoc6pdl
)

add_library(emeeprom STATIC EXCLUDE_FROM_ALL ${EMEEPROM_SOURCES})
target_include_directories(emeeprom PUBLIC ${EMEEPROM_INCLUDE_DIRS})
target_link_libraries(emeeprom PUBLIC ${EMEEPROM_LINK_LIBRARIES})
