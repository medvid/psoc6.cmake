add_greentea_test(
  NAME
    atomic
  SOURCES
    ${MBED_OS_DIR}/TESTS/mbed_platform/atomic/main.cpp
  LINK_LIBRARIES
    mbed-target
    mbed-utest
)

add_greentea_test(
  NAME
    CircularBuffer
  SOURCES
    ${MBED_OS_DIR}/TESTS/mbed_platform/CircularBuffer/main.cpp
  LINK_LIBRARIES
    mbed-target
    mbed-utest
)

add_greentea_test(
  NAME
    critical_section
  SOURCES
    ${MBED_OS_DIR}/TESTS/mbed_platform/critical_section/main.cpp
  LINK_LIBRARIES
    mbed-target
    mbed-utest
)

add_greentea_test(
  NAME
    error_handling
  SOURCES
    ${MBED_OS_DIR}/TESTS/mbed_platform/error_handling/main.cpp
  LINK_LIBRARIES
    mbed-littlefs
    mbed-blockdevice
    mbed-target
    mbed-utest
)

add_greentea_test(
  NAME
    FileHandle
  SOURCES
    ${MBED_OS_DIR}/TESTS/mbed_platform/FileHandle/main.cpp
  LINK_LIBRARIES
    mbed-target
    mbed-utest
)

add_greentea_test(
  NAME
    SharedPtr
  SOURCES
    ${MBED_OS_DIR}/TESTS/mbed_platform/SharedPtr/main.cpp
  LINK_LIBRARIES
    mbed-target
    mbed-utest
)

add_greentea_test(
  NAME
    SingletonPtr
  SOURCES
    ${MBED_OS_DIR}/TESTS/mbed_platform/SingletonPtr/main.cpp
  LINK_LIBRARIES
    mbed-target
    mbed-utest
)

add_greentea_test(
  NAME
    stats_cpu
  SOURCES
    ${MBED_OS_DIR}/TESTS/mbed_platform/stats_cpu/main.cpp
  LINK_LIBRARIES
    mbed-target
    mbed-utest
)

add_greentea_test(
  NAME
    stats_heap
  SOURCES
    ${MBED_OS_DIR}/TESTS/mbed_platform/stats_heap/main.cpp
  LINK_LIBRARIES
    mbed-target
    mbed-utest
)

add_greentea_test(
  NAME
    stats_sys
  SOURCES
    ${MBED_OS_DIR}/TESTS/mbed_platform/stats_sys/main.cpp
  LINK_LIBRARIES
    mbed-target
    mbed-utest
)

add_greentea_test(
  NAME
    stats_thread
  SOURCES
    ${MBED_OS_DIR}/TESTS/mbed_platform/stats_thread/main.cpp
  LINK_LIBRARIES
    mbed-target
    mbed-utest
)

add_greentea_test(
  NAME
    Stream
  SOURCES
    ${MBED_OS_DIR}/TESTS/mbed_platform/Stream/main.cpp
  LINK_LIBRARIES
    mbed-target
    mbed-utest
)

add_greentea_test(
  NAME
    system_reset
  SOURCES
    ${MBED_OS_DIR}/TESTS/mbed_platform/system_reset/main.cpp
  LINK_LIBRARIES
    mbed-target
    mbed-utest
)

add_greentea_test(
  NAME
    Transaction
  SOURCES
    ${MBED_OS_DIR}/TESTS/mbed_platform/Transaction/main.cpp
  LINK_LIBRARIES
    mbed-target
    mbed-utest
)

add_greentea_test(
  NAME
    wait_ns
  SOURCES
    ${MBED_OS_DIR}/TESTS/mbed_platform/wait_ns/main.cpp
  LINK_LIBRARIES
    mbed-target
    mbed-utest
)