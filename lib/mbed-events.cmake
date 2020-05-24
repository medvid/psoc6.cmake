set(MBED_EVENTS_DIR ${MBED_OS_DIR}/events)
set(MBED_EVENTS_SOURCES
  ${MBED_EVENTS_DIR}/Event.h
  ${MBED_EVENTS_DIR}/EventQueue.h
  ${MBED_EVENTS_DIR}/UserAllocatedEvent.h
  ${MBED_EVENTS_DIR}/equeue.h
  ${MBED_EVENTS_DIR}/mbed_events.h
  ${MBED_EVENTS_DIR}/mbed_shared_queues.h
  ${MBED_EVENTS_DIR}/internal/equeue_platform.h
  ${MBED_EVENTS_DIR}/source/EventQueue.cpp
  ${MBED_EVENTS_DIR}/source/equeue.c
  ${MBED_EVENTS_DIR}/source/equeue_mbed.cpp
  ${MBED_EVENTS_DIR}/source/equeue_posix.c
  ${MBED_EVENTS_DIR}/source/mbed_shared_queues.cpp
)
set(MBED_EVENTS_INCLUDE_DIRS
  ${MBED_EVENTS_DIR}
)
set(MBED_EVENTS_DEFINES
  MBED_CONF_EVENTS_PRESENT=1

  # Stack size (bytes) for shared event queue thread
  MBED_CONF_EVENTS_SHARED_STACKSIZE=2048

  # Event buffer size (bytes) for shared event queue
  MBED_CONF_EVENTS_SHARED_EVENTSIZE=768

  # No thread created for shared event queue - application will call
  # dispatch from another thread (eg dispatch_forever at end of main)
  MBED_CONF_EVENTS_SHARED_DISPATCH_FROM_APPLICATION=0

  # Stack size (bytes) for shared high-priority event queue thread
  MBED_CONF_EVENTS_SHARED_HIGHPRIO_STACKSIZE=1024

  # Event buffer size (bytes) for shared high-priority event queue
  MBED_CONF_EVENTS_SHARED_HIGHPRIO_EVENTSIZE=256

  # Enable use of low power timer and ticker classes in non-RTOS builds.
  # May reduce the accuracy of the event queue.
  # In RTOS builds, the RTOS tick count is used, and this configuration option has no effect.
  MBED_CONF_EVENTS_USE_LOWPOWER_TIMER_TICKER=0
)
set(MBED_EVENTS_LINK_LIBRARIES
  mbed-platform
)

add_library(mbed-events STATIC EXCLUDE_FROM_ALL ${MBED_EVENTS_SOURCES})
target_include_directories(mbed-events PUBLIC ${MBED_EVENTS_INCLUDE_DIRS})
target_compile_definitions(mbed-events PUBLIC ${MBED_EVENTS_DEFINES})
target_link_libraries(mbed-events PUBLIC ${MBED_EVENTS_LINK_LIBRARIES})
