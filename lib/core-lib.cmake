psoc6_load_library(
  NAME core-lib
  VERSION 1.1.3
)

set(CORE_LIB_SOURCES
  ${CORE_LIB_DIR}/include/cy_result.h
  ${CORE_LIB_DIR}/include/cy_utils.h
)
set(CORE_LIB_INCLUDE_DIRS
  ${CORE_LIB_DIR}/include
)

add_library(core-lib INTERFACE)
target_sources(core-lib INTERFACE ${CORE_LIB_SOURCES})
target_include_directories(core-lib INTERFACE ${CORE_LIB_INCLUDE_DIRS})
