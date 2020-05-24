set(MBED_NANOSTACK_HAL_DIR ${MBED_OS_DIR}/features/nanostack/nanostack-hal-mbed-cmsis-rtos)
set(MBED_NANOSTACK_HAL_SOURCES
  ${MBED_NANOSTACK_HAL_DIR}/arm_hal_fhss_timer.cpp
  ${MBED_NANOSTACK_HAL_DIR}/arm_hal_interrupt.c
  ${MBED_NANOSTACK_HAL_DIR}/arm_hal_interrupt_private.h
  ${MBED_NANOSTACK_HAL_DIR}/arm_hal_random.c
  ${MBED_NANOSTACK_HAL_DIR}/arm_hal_timer.cpp
  ${MBED_NANOSTACK_HAL_DIR}/ns_event_loop.h
  ${MBED_NANOSTACK_HAL_DIR}/ns_event_loop.c
  ${MBED_NANOSTACK_HAL_DIR}/ns_event_loop_mbed.cpp
  ${MBED_NANOSTACK_HAL_DIR}/ns_event_loop_mutex.h
  ${MBED_NANOSTACK_HAL_DIR}/ns_event_loop_mutex.c
  ${MBED_NANOSTACK_HAL_DIR}/ns_hal_init.h
  ${MBED_NANOSTACK_HAL_DIR}/ns_hal_init.c
  ${MBED_NANOSTACK_HAL_DIR}/nvm/nvm_ram.c
)
set(MBED_NANOSTACK_HAL_INCLUDE_DIRS
  ${MBED_NANOSTACK_HAL_DIR}
)
set(MBED_NANOSTACK_HAL_DEFINES
  # Define event-loop thread stack size. [bytes]
  MBED_CONF_NANOSTACK_HAL_EVENT_LOOP_THREAD_STACK_SIZE=6144

  # Make critical section API usable from interrupt context.
  # Else a mutex is used as locking primitive.
  # Consult arm_hal_interrupt.c for possible side effects on interrupt latency.
  MBED_CONF_NANOSTACK_HAL_CRITICAL_SECTION_USABLE_FROM_INTERRUPT=0

  # Application is responsible of message dispatch loop.
  # Else launch a separate thread for event-loop.
  MBED_CONF_NANOSTACK_HAL_EVENT_LOOP_DISPATCH_FROM_APPLICATION=0

  # Use Mbed OS global event queue for Nanostack event loop, rather than our own thread.
  MBED_CONF_NANOSTACK_HAL_EVENT_LOOP_USE_MBED_EVENTS=0
)
set(MBED_NANOSTACK_HAL_LINK_LIBRARIES
  mbed-rtos
  mbed-events
  mbed-tls
  mbed-client-randlib
  mbed-nanostack-libservice
)

add_library(mbed-nanostack-hal STATIC EXCLUDE_FROM_ALL ${MBED_NANOSTACK_HAL_SOURCES})
target_include_directories(mbed-nanostack-hal PUBLIC ${MBED_NANOSTACK_HAL_INCLUDE_DIRS})
target_compile_definitions(mbed-nanostack-hal PUBLIC ${MBED_NANOSTACK_HAL_DEFINES})
target_link_libraries(mbed-nanostack-hal PUBLIC ${MBED_NANOSTACK_HAL_LINK_LIBRARIES})

# randLIB.c link-depends on arm_hal_random.c
target_link_libraries(mbed-client-randlib PRIVATE mbed-nanostack-hal)
