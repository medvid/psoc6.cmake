set(MBED_UNITY_DIR ${MBED_OS_DIR}/features/frameworks/unity)
set(MBED_UNITY_SOURCES
  ${MBED_UNITY_DIR}/unity/unity.h
  ${MBED_UNITY_DIR}/unity/unity_config.h
  ${MBED_UNITY_DIR}/unity/unity_internals.h
  ${MBED_UNITY_DIR}/source/unity.c
)
set(MBED_UNITY_INCLUDE_DIRS
  ${MBED_UNITY_DIR}
  ${MBED_UNITY_DIR}/unity
)

add_library(mbed-unity STATIC EXCLUDE_FROM_ALL ${MBED_UNITY_SOURCES})
target_include_directories(mbed-unity PUBLIC ${MBED_UNITY_INCLUDE_DIRS})
