set(MBED_NANOSTACK_EVENTLOOP_DIR ${MBED_OS_DIR}/features/nanostack/sal-stack-nanostack-eventloop)
set(MBED_NANOSTACK_EVENTLOOP_SOURCES
  ${MBED_NANOSTACK_EVENTLOOP_DIR}/nanostack-event-loop/eventOS_callback_timer.h
  ${MBED_NANOSTACK_EVENTLOOP_DIR}/nanostack-event-loop/eventOS_event.h
  ${MBED_NANOSTACK_EVENTLOOP_DIR}/nanostack-event-loop/eventOS_event_timer.h
  ${MBED_NANOSTACK_EVENTLOOP_DIR}/nanostack-event-loop/eventOS_scheduler.h
  ${MBED_NANOSTACK_EVENTLOOP_DIR}/nanostack-event-loop/platform/arm_hal_timer.h
  ${MBED_NANOSTACK_EVENTLOOP_DIR}/nanostack-event-loop/platform/eventloop_config.h
  ${MBED_NANOSTACK_EVENTLOOP_DIR}/source/event.h
  ${MBED_NANOSTACK_EVENTLOOP_DIR}/source/event.c
  ${MBED_NANOSTACK_EVENTLOOP_DIR}/source/ns_timeout.c
  ${MBED_NANOSTACK_EVENTLOOP_DIR}/source/ns_timer.h
  ${MBED_NANOSTACK_EVENTLOOP_DIR}/source/ns_timer.c
  ${MBED_NANOSTACK_EVENTLOOP_DIR}/source/system_timer.c
  ${MBED_NANOSTACK_EVENTLOOP_DIR}/source/timer_sys.h
)
set(MBED_NANOSTACK_EVENTLOOP_INCLUDE_DIRS
  ${MBED_NANOSTACK_EVENTLOOP_DIR}/nanostack-event-loop
)
set(MBED_NANOSTACK_EVENTLOOP_DEFINES
  # Use platform provided low resolution tick timer for eventloop
  #MBED_CONF_NANOSTACK_EVENTLOOP_USE_PLATFORM_TICK_TIMER

  # Exclude high resolution timer from build
  #MBED_CONF_NANOSTACK_EVENTLOOP_EXCLUDE_HIGHRES_TIMER
)
set(MBED_NANOSTACK_EVENTLOOP_LINK_LIBRARIES
  mbed-nanostack-libservice
  mbed-nanostack-hal
)

add_library(mbed-nanostack-eventloop STATIC EXCLUDE_FROM_ALL ${MBED_NANOSTACK_EVENTLOOP_SOURCES})
target_include_directories(mbed-nanostack-eventloop PUBLIC ${MBED_NANOSTACK_EVENTLOOP_INCLUDE_DIRS})
target_compile_definitions(mbed-nanostack-eventloop PUBLIC ${MBED_NANOSTACK_EVENTLOOP_DEFINES})
target_link_libraries(mbed-nanostack-eventloop PUBLIC ${MBED_NANOSTACK_EVENTLOOP_LINK_LIBRARIES})

# arm_hal_timer.cpp includes platform/arm_hal_timer.h from eventloop
target_link_libraries(mbed-nanostack-hal PRIVATE mbed-nanostack-eventloop)
