add_greentea_test(
  NAME
    atomic
  SOURCES
    ${MBED_OS_DIR}/platform/tests/TESTS/mbed_platform/atomic/main.cpp
)

add_greentea_test(
  NAME
    CircularBuffer
  SOURCES
    ${MBED_OS_DIR}/platform/tests/TESTS/mbed_platform/CircularBuffer/main.cpp
)

add_greentea_test(
  NAME
    critical_section
  SOURCES
    ${MBED_OS_DIR}/platform/tests/TESTS/mbed_platform/critical_section/main.cpp
)

add_greentea_test(
  NAME
    error_handling
  SOURCES
    ${MBED_OS_DIR}/platform/tests/TESTS/mbed_platform/error_handling/main.cpp
)

add_greentea_test(
  NAME
    FileHandle
  SOURCES
    ${MBED_OS_DIR}/platform/tests/TESTS/mbed_platform/FileHandle/main.cpp
)

add_greentea_test(
  NAME
    SharedPtr
  SOURCES
    ${MBED_OS_DIR}/platform/tests/TESTS/mbed_platform/SharedPtr/main.cpp
)

add_greentea_test(
  NAME
    SingletonPtr
  SOURCES
    ${MBED_OS_DIR}/platform/tests/TESTS/mbed_platform/SingletonPtr/main.cpp
)

add_greentea_test(
  NAME
    stats_cpu
  SOURCES
    ${MBED_OS_DIR}/platform/tests/TESTS/mbed_platform/stats_cpu/main.cpp
)

add_greentea_test(
  NAME
    stats_heap
  SOURCES
    ${MBED_OS_DIR}/platform/tests/TESTS/mbed_platform/stats_heap/main.cpp
)

add_greentea_test(
  NAME
    stats_sys
  SOURCES
    ${MBED_OS_DIR}/platform/tests/TESTS/mbed_platform/stats_sys/main.cpp
)

add_greentea_test(
  NAME
    stats_thread
  SOURCES
    ${MBED_OS_DIR}/platform/tests/TESTS/mbed_platform/stats_thread/main.cpp
)

add_greentea_test(
  NAME
    Stream
  SOURCES
    ${MBED_OS_DIR}/platform/tests/TESTS/mbed_platform/Stream/main.cpp
)

add_greentea_test(
  NAME
    system_reset
  SOURCES
    ${MBED_OS_DIR}/platform/tests/TESTS/mbed_platform/system_reset/main.cpp
)

add_greentea_test(
  NAME
    Transaction
  SOURCES
    ${MBED_OS_DIR}/platform/tests/TESTS/mbed_platform/Transaction/main.cpp
)

add_greentea_test(
  NAME
    wait_ns
  SOURCES
    ${MBED_OS_DIR}/platform/tests/TESTS/mbed_platform/wait_ns/main.cpp
)
