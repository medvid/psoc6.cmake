psoc6_load_library(
  NAME connectivity-utilities
  VERSION 2.1.0
)

set(CONNECTIVITY_UTILITIES_SOURCES
  ${CONNECTIVITY_UTILITIES_DIR}/cy_result_mw.h
  ${CONNECTIVITY_UTILITIES_DIR}/cy_utilities.h
  ${CONNECTIVITY_UTILITIES_DIR}/cy_log/cy_log.h
  ${CONNECTIVITY_UTILITIES_DIR}/cy_log/cy_log.c
  ${CONNECTIVITY_UTILITIES_DIR}/cy_string/cy_string_utils.h
  ${CONNECTIVITY_UTILITIES_DIR}/cy_string/cy_string_utils.c
  ${CONNECTIVITY_UTILITIES_DIR}/JSON_parser/cy_json_parser.h
  ${CONNECTIVITY_UTILITIES_DIR}/JSON_parser/cy_json_parser.c
  ${CONNECTIVITY_UTILITIES_DIR}/linked_list/cy_linked_list.h
  ${CONNECTIVITY_UTILITIES_DIR}/linked_list/cy_linked_list.c
  ${CONNECTIVITY_UTILITIES_DIR}/network/cy_nw_helper.h
  ${CONNECTIVITY_UTILITIES_DIR}/network/COMPONENT_LWIP/cy_nw_helper.c
  # TODO: figure out network/COMPONENT_AFR/cy_nw_helper.c
)
set(CONNECTIVITY_UTILITIES_INCLUDE_DIRS
  ${CONNECTIVITY_UTILITIES_DIR}
  ${CONNECTIVITY_UTILITIES_DIR}/cy_log
  ${CONNECTIVITY_UTILITIES_DIR}/network
)
set(CONNECTIVITY_UTILITIES_LIBRARIES
  abstraction-rtos
  lwip
)

add_library(connectivity-utilities STATIC ${CONNECTIVITY_UTILITIES_SOURCES})
target_include_directories(connectivity-utilities PUBLIC ${CONNECTIVITY_UTILITIES_INCLUDE_DIRS})
target_link_libraries(connectivity-utilities PUBLIC ${CONNECTIVITY_UTILITIES_LIBRARIES})
