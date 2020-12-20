set(MBED_UTEST_DIR ${MBED_OS_DIR}/features/frameworks/utest)
set(MBED_UTEST_SOURCES
  ${MBED_UTEST_DIR}/utest/unity_handler.h
  ${MBED_UTEST_DIR}/utest/utest_case.h
  ${MBED_UTEST_DIR}/utest/utest_default_handlers.h
  ${MBED_UTEST_DIR}/utest/utest.h
  ${MBED_UTEST_DIR}/utest/utest_harness.h
  ${MBED_UTEST_DIR}/utest/utest_print.h
  ${MBED_UTEST_DIR}/utest/utest_scheduler.h
  ${MBED_UTEST_DIR}/utest/utest_shim.h
  ${MBED_UTEST_DIR}/utest/utest_specification.h
  ${MBED_UTEST_DIR}/utest/utest_stack_trace.h
  ${MBED_UTEST_DIR}/utest/utest_types.h
  ${MBED_UTEST_DIR}/source/unity_handler.cpp
  ${MBED_UTEST_DIR}/source/utest_case.cpp
  ${MBED_UTEST_DIR}/source/utest_default_handlers.cpp
  ${MBED_UTEST_DIR}/source/utest_greentea_handlers.cpp
  ${MBED_UTEST_DIR}/source/utest_harness.cpp
  ${MBED_UTEST_DIR}/source/utest_print.cpp
  ${MBED_UTEST_DIR}/source/utest_shim.cpp
  ${MBED_UTEST_DIR}/source/utest_stack_trace.cpp
  ${MBED_UTEST_DIR}/source/utest_types.cpp
  ${MBED_UTEST_DIR}/mbed-utest-shim.cpp
)
set(MBED_UTEST_INCLUDE_DIRS
  ${MBED_UTEST_DIR}
  ${MBED_UTEST_DIR}/utest
)
set(MBED_UTEST_LINK_LIBRARIES
  mbed-unity
  mbed-greentea-client
)

add_library(mbed-utest STATIC EXCLUDE_FROM_ALL ${MBED_UTEST_SOURCES})
target_include_directories(mbed-utest PUBLIC ${MBED_UTEST_INCLUDE_DIRS})
target_link_libraries(mbed-utest PUBLIC ${MBED_UTEST_LINK_LIBRARIES})

# unity.c patched to include utest/unity_handler.h
target_include_directories(mbed-unity PRIVATE ${MBED_UTEST_DIR})
