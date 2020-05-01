psoc6_load_library(
  NAME retarget-io
  VERSION 1.1.0
)

set(RETARGET_IO_SOURCES
  ${RETARGET_IO_DIR}/cy_retarget_io.h
  ${RETARGET_IO_DIR}/cy_retarget_io.c
)
set(RETARGET_IO_INCLUDE_DIRS
  ${RETARGET_IO_DIR}
)
set(RETARGET_IO_LINK_LIBRARIES
  psoc6hal
)

add_library(retarget-io STATIC EXCLUDE_FROM_ALL ${RETARGET_IO_SOURCES})
target_include_directories(retarget-io PUBLIC ${RETARGET_IO_INCLUDE_DIRS})
target_link_libraries(retarget-io PUBLIC ${RETARGET_IO_LINK_LIBRARIES})
