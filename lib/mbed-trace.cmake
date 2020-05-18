set(MBED_TRACE_DIR ${MBED_OS_DIR}/features/frameworks/mbed-trace)
set(MBED_TRACE_SOURCES
  ${MBED_TRACE_DIR}/mbed-trace/mbed_trace.h
  ${MBED_TRACE_DIR}/source/mbed_trace.c
)
set(MBED_TRACE_INCLUDE_DIRS
  ${MBED_TRACE_DIR}
  ${MBED_TRACE_DIR}/mbed-trace
)
set(MBED_TRACE_DEFINES
  # Uncomment to actually enable tracing
  #MBED_CONF_MBED_TRACE_ENABLE
  MBED_CONF_MBED_TRACE_FEA_IPV6=0
)
set(MBED_TRACE_LINK_LIBRARIES
  mbed-platform
)

add_library(mbed-trace STATIC EXCLUDE_FROM_ALL ${MBED_TRACE_SOURCES})
target_include_directories(mbed-trace PUBLIC ${MBED_TRACE_INCLUDE_DIRS})
target_compile_definitions(mbed-trace PUBLIC ${MBED_TRACE_DEFINES})
target_link_libraries(mbed-trace PUBLIC ${MBED_TRACE_LINK_LIBRARIES})
