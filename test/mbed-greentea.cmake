set(UNITY_DIR ${MBED_OS_DIR}/features/frameworks/unity)
set(UNITY_SOURCES
  ${UNITY_DIR}/unity/unity.h
  ${UNITY_DIR}/unity/unity_config.h
  ${UNITY_DIR}/unity/unity_internals.h
  ${UNITY_DIR}/source/unity.c
)
set(UNITY_INCLUDE_DIRS
  ${UNITY_DIR}
)

add_library(unity STATIC EXCLUDE_FROM_ALL ${UNITY_SOURCES})
target_include_directories(unity PUBLIC ${UNITY_INCLUDE_DIRS})

set(GREENTEA_CLIENT_DIR ${MBED_OS_DIR}/features/frameworks/greentea-client)
set(GREENTEA_CLIENT_SOURCES
  ${GREENTEA_CLIENT_DIR}/greentea-client/greentea_metrics.h
  ${GREENTEA_CLIENT_DIR}/greentea-client/test_env.h
  ${GREENTEA_CLIENT_DIR}/source/greentea_metrics.cpp
  ${GREENTEA_CLIENT_DIR}/source/greentea_test_env.cpp
)
set(GREENTEA_CLIENT_INCLUDE_DIRS
  ${GREENTEA_CLIENT_DIR}
)
set(GREENTEA_CLIENT_LINK_LIBRARIES
  mbed-trace
)
if(${OS} STREQUAL RTX)
  list(APPEND GREENTEA_CLIENT_LINK_LIBRARIES mbed-rtos)
endif()

add_library(greentea-client STATIC EXCLUDE_FROM_ALL ${GREENTEA_CLIENT_SOURCES})
target_include_directories(greentea-client PUBLIC ${GREENTEA_CLIENT_INCLUDE_DIRS})
target_link_libraries(greentea-client PUBLIC ${GREENTEA_CLIENT_LINK_LIBRARIES})

set(UTEST_DIR ${MBED_OS_DIR}/features/frameworks/utest)
set(UTEST_SOURCES
  ${UTEST_DIR}/utest/unity_handler.h
  ${UTEST_DIR}/utest/utest_case.h
  ${UTEST_DIR}/utest/utest_default_handlers.h
  ${UTEST_DIR}/utest/utest.h
  ${UTEST_DIR}/utest/utest_harness.h
  ${UTEST_DIR}/utest/utest_print.h
  ${UTEST_DIR}/utest/utest_scheduler.h
  ${UTEST_DIR}/utest/utest_shim.h
  ${UTEST_DIR}/utest/utest_specification.h
  ${UTEST_DIR}/utest/utest_stack_trace.h
  ${UTEST_DIR}/utest/utest_types.h
  ${UTEST_DIR}/source/unity_handler.cpp
  ${UTEST_DIR}/source/utest_case.cpp
  ${UTEST_DIR}/source/utest_default_handlers.cpp
  ${UTEST_DIR}/source/utest_greentea_handlers.cpp
  ${UTEST_DIR}/source/utest_harness.cpp
  ${UTEST_DIR}/source/utest_print.cpp
  ${UTEST_DIR}/source/utest_shim.cpp
  ${UTEST_DIR}/source/utest_stack_trace.cpp
  ${UTEST_DIR}/source/utest_types.cpp
  ${UTEST_DIR}/mbed-utest-shim.cpp
)
set(UTEST_INCLUDE_DIRS
  ${UTEST_DIR}
  ${UTEST_DIR}/utest
)
set(UTEST_LINK_LIBRARIES
  unity
  greentea-client
  mbed-platform
  # Timeout.h
  mbed-drivers
)

add_library(utest STATIC EXCLUDE_FROM_ALL ${UTEST_SOURCES})
target_include_directories(utest PUBLIC ${UTEST_INCLUDE_DIRS})
target_link_libraries(utest PUBLIC ${UTEST_LINK_LIBRARIES})

# unity.c patched to include utest/unity_handler.h
target_link_libraries(unity PRIVATE utest)


psoc6_add_executable(
  NAME
    SingletonPtrTest
  SOURCES
    ${MBED_OS_DIR}/TESTS/mbed_platform/SingletonPtr/main.cpp
  LINK_LIBRARIES
    mbed-target
    utest
)
