set(MBED_GREENTEA_CLIENT_DIR ${MBED_OS_DIR}/features/frameworks/greentea-client)
set(MBED_GREENTEA_CLIENT_SOURCES
  ${MBED_GREENTEA_CLIENT_DIR}/greentea-client/greentea_metrics.h
  ${MBED_GREENTEA_CLIENT_DIR}/greentea-client/test_env.h
  ${MBED_GREENTEA_CLIENT_DIR}/source/greentea_metrics.cpp
  ${MBED_GREENTEA_CLIENT_DIR}/source/greentea_test_env.cpp
)
set(MBED_GREENTEA_CLIENT_INCLUDE_DIRS
  ${MBED_GREENTEA_CLIENT_DIR}
)
set(MBED_GREENTEA_CLIENT_LINK_LIBRARIES
  mbed-os
)

add_library(mbed-greentea-client STATIC EXCLUDE_FROM_ALL ${MBED_GREENTEA_CLIENT_SOURCES})
target_include_directories(mbed-greentea-client PUBLIC ${MBED_GREENTEA_CLIENT_INCLUDE_DIRS})
target_link_libraries(mbed-greentea-client PUBLIC ${MBED_GREENTEA_CLIENT_LINK_LIBRARIES})
