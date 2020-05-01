psoc6_load_library(
  NAME csdidac
  VERSION 2.0.0
)

set(CSDIDAC_SOURCES
  ${CSDIDAC_DIR}/cy_csdidac.h
  ${CSDIDAC_DIR}/cy_csdidac.c
)
set(CSDIDAC_INCLUDE_DIRS
  ${CSDIDAC_DIR}
)
set(CSDIDAC_LINK_LIBRARIES
  psoc6pdl
)

add_library(csdidac STATIC EXCLUDE_FROM_ALL ${CSDIDAC_SOURCES})
target_include_directories(csdidac PUBLIC ${CSDIDAC_INCLUDE_DIRS})
target_link_libraries(csdidac PUBLIC ${CSDIDAC_LINK_LIBRARIES})
