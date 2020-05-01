psoc6_load_library(
  NAME csdadc
  VERSION 2.0.0
)

set(CSDADC_SOURCES
  ${CSDADC_DIR}/cy_csdadc.h
  ${CSDADC_DIR}/cy_csdadc.c
)
set(CSDADC_INCLUDE_DIRS
  ${CSDADC_DIR}
)
set(CSDADC_LINK_LIBRARIES
  psoc6pdl
)

add_library(csdadc STATIC EXCLUDE_FROM_ALL ${CSDADC_SOURCES})
target_include_directories(csdadc PUBLIC ${CSDADC_INCLUDE_DIRS})
target_link_libraries(csdadc PUBLIC ${CSDADC_LINK_LIBRARIES})
