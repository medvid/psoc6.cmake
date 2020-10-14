psoc6_load_library(
  NAME template
  VERSION 1.0.0
)

set(TEMPLATE_SOURCES
  ${TEMPLATE_DIR}/template.h
  ${TEMPLATE_DIR}/template.c
)
set(TEMPLATE_INCLUDE_DIRS
  ${TEMPLATE_DIR}
)
set(TEMPLATE_LINK_LIBRARIES
  mtb-hal-cat1
)

add_library(template STATIC EXCLUDE_FROM_ALL ${TEMPLATE_SOURCES})
target_include_directories(template PUBLIC ${TEMPLATE_INCLUDE_DIRS})
target_link_libraries(template PUBLIC ${TEMPLATE_LINK_LIBRARIES})
