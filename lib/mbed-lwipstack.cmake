set(MBED_LWIPSTACK_DIR ${MBED_OS_DIR}/features/lwipstack)
set(MBED_LWIPSTACK_SOURCES
  ${MBED_LWIPSTACK_DIR}/LWIPInterface.cpp
  ${MBED_LWIPSTACK_DIR}/LWIPInterfaceEMAC.cpp
  ${MBED_LWIPSTACK_DIR}/LWIPInterfaceL3IP.cpp
  ${MBED_LWIPSTACK_DIR}/LWIPInterfacePPP.cpp
  ${MBED_LWIPSTACK_DIR}/LWIPMemoryManager.h
  ${MBED_LWIPSTACK_DIR}/LWIPMemoryManager.cpp
  ${MBED_LWIPSTACK_DIR}/LWIPStack.h
  ${MBED_LWIPSTACK_DIR}/LWIPStack.cpp
  ${MBED_LWIPSTACK_DIR}/lwip_tools.cpp
)
set(MBED_LWIPSTACK_INCLUDE_DIRS
  ${MBED_LWIPSTACK_DIR}
)
set(MBED_LWIPSTACK_LINK_LIBRARIES
  mbed-lwip
  mbed-netsocket
)

add_library(mbed-lwipstack STATIC EXCLUDE_FROM_ALL ${MBED_LWIPSTACK_SOURCES})
target_include_directories(mbed-lwipstack PUBLIC ${MBED_LWIPSTACK_INCLUDE_DIRS})
target_link_libraries(mbed-lwipstack PUBLIC ${MBED_LWIPSTACK_LINK_LIBRARIES})

# BUG: LWIPMemoryManager.cpp includes pbuf.h
target_include_directories(mbed-lwipstack PRIVATE ${MBED_LWIP_DIR}/src/include/lwip)
