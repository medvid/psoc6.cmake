set(MBED_RTOS_DIR ${MBED_OS_DIR}/rtos)
set(MBED_RTOS_SOURCES
  ${MBED_RTOS_DIR}/ConditionVariable.h
  ${MBED_RTOS_DIR}/EventFlags.h
  ${MBED_RTOS_DIR}/Kernel.h
  ${MBED_RTOS_DIR}/Mail.h
  ${MBED_RTOS_DIR}/mbed_rtos1_types.h
  ${MBED_RTOS_DIR}/mbed_rtos_storage.h
  ${MBED_RTOS_DIR}/mbed_rtos_types.h
  ${MBED_RTOS_DIR}/MemoryPool.h
  ${MBED_RTOS_DIR}/Mutex.h
  ${MBED_RTOS_DIR}/Queue.h
  ${MBED_RTOS_DIR}/rtos.h
  ${MBED_RTOS_DIR}/Semaphore.h
  ${MBED_RTOS_DIR}/ThisThread.h
  ${MBED_RTOS_DIR}/Thread.h
  ${MBED_RTOS_DIR}/source/ConditionVariable.cpp
  ${MBED_RTOS_DIR}/source/EventFlags.cpp
  ${MBED_RTOS_DIR}/source/Kernel.cpp
  ${MBED_RTOS_DIR}/source/Mutex.cpp
  ${MBED_RTOS_DIR}/source/rtos_handlers.h
  ${MBED_RTOS_DIR}/source/rtos_idle.h
  ${MBED_RTOS_DIR}/source/Semaphore.cpp
  ${MBED_RTOS_DIR}/source/ThisThread.cpp
  ${MBED_RTOS_DIR}/source/Thread.cpp
  ${MBED_RTOS_DIR}/source/TARGET_CORTEX/mbed_boot.h
  ${MBED_RTOS_DIR}/source/TARGET_CORTEX/mbed_boot.c
  ${MBED_RTOS_DIR}/source/TARGET_CORTEX/mbed_rtos_rtx.c
  ${MBED_RTOS_DIR}/source/TARGET_CORTEX/mbed_rtx_handlers.c
  ${MBED_RTOS_DIR}/source/TARGET_CORTEX/mbed_rtx_idle.cpp
  ${MBED_RTOS_DIR}/source/TARGET_CORTEX/mbed_rtx_storage.h
  ${MBED_RTOS_DIR}/source/TARGET_CORTEX/rtx4/cmsis_os.h
  ${MBED_RTOS_DIR}/source/TARGET_CORTEX/rtx4/cmsis_os1.c
)
set(MBED_RTOS_INCLUDE_DIRS
  ${MBED_RTOS_DIR}
  ${MBED_RTOS_DIR}/source/TARGET_CORTEX
  # mbed_rtx_idle.cpp includes TimerEvent.h
  ${MBED_DRIVERS_DIR}
)
set(MBED_RTOS_DEFINES
  _RTE_=1
  MBED_CONF_RTOS_PRESENT=1
  MBED_CONF_RTOS_API_PRESENT=1

  # The size of the main thread's stack
  MBED_CONF_RTOS_MAIN_THREAD_STACK_SIZE=4096

  # The size of the timer thread's stack
  MBED_CONF_RTOS_TIMER_THREAD_STACK_SIZE=768

  # The size of the idle thread's stack
  MBED_CONF_RTOS_IDLE_THREAD_STACK_SIZE=512

  # The default stack size of new threads
  MBED_CONF_RTOS_THREAD_STACK_SIZE=4096

  # Additional size to add to the idle thread when a specific target or
  # application implementation requires it or in case tickless is enabled
  # and LPTICKER_DELAY_TICKS is used
  MBED_CONF_RTOS_IDLE_THREAD_STACK_SIZE_TICKLESS_EXTRA=256

  # Additional size to add to the idle thread when code compilation optimisation is disabled
  MBED_CONF_RTOS_IDLE_THREAD_STACK_SIZE_DEBUG_EXTRA=0

  # Maximum number of CMSIS-RTOSv2 object-pool threads that can be active at the same time
  MBED_CONF_RTOS_THREAD_NUM=0

  # The total memory available for all CMSIS-RTOSv2 object-pool thread stacks combined
  MBED_CONF_RTOS_THREAD_USER_STACK_SIZE=0

  # Maximum number of CMSIS-RTOSv2 object-pool timers that can be active at the same time
  MBED_CONF_RTOS_TIMER_NUM=0

  # Maximum number of CMSIS-RTOSv2 object-pool event flag objects that can be active at the same time
  MBED_CONF_RTOS_EVFLAGS_NUM=0

  # Maximum number of CMSIS-RTOSv2 object-pool mutexes that can be active at the same time
  MBED_CONF_RTOS_MUTEX_NUM=0

  # Maximum number of CMSIS-RTOSv2 object-pool semaphores that can be active at the same time
  MBED_CONF_RTOS_SEMAPHORE_NUM=0

  # Maximum number of CMSIS-RTOSv2 object-pool message queues that can be active at the same time
  MBED_CONF_RTOS_MSGQUEUE_NUM=0

  # The total memory available for all CMSIS-RTOSv2 object-pool message queues combined
  MBED_CONF_RTOS_MSGQUEUE_DATA_SIZE=0

  # TODO
  MBED_TARGET_BOOT_STACK_SIZE=0x400
)
set(MBED_RTOS_LINK_LIBRARIES
  cmsis-rtx
  mbed-platform
  mtb-hal-cat1
)

if(${TOOLCHAIN} STREQUAL GCC OR ${TOOLCHAIN} STREQUAL LLVM)
  list(APPEND MBED_RTOS_SOURCES
    ${MBED_RTOS_DIR}/source/TARGET_CORTEX/TOOLCHAIN_GCC_ARM/mbed_boot_gcc_arm.c
  )
elseif(${TOOLCHAIN} STREQUAL ARM)
  list(APPEND MBED_RTOS_SOURCES
    ${MBED_RTOS_DIR}/source/TARGET_CORTEX/TOOLCHAIN_ARM_STD/mbed_boot_arm_std.c
  )
elseif(${TOOLCHAIN} STREQUAL IAR)
  list(APPEND MBED_RTOS_SOURCES
    ${MBED_RTOS_DIR}/source/TARGET_CORTEX/TOOLCHAIN_IAR/mbed_boot_iar.c
  )
else()
  message(FATAL_ERROR "mbed-rtos: TOOLCHAIN ${TOOLCHAIN} is not supported.")
endif()

add_library(mbed-rtos STATIC EXCLUDE_FROM_ALL ${MBED_RTOS_SOURCES})
target_include_directories(mbed-rtos PUBLIC ${MBED_RTOS_INCLUDE_DIRS})
target_compile_definitions(mbed-rtos PUBLIC ${MBED_RTOS_DEFINES})
target_link_libraries(mbed-rtos PUBLIC ${MBED_RTOS_LINK_LIBRARIES})

if(${OS} STREQUAL RTX)
  # mbed_thread.cpp calls rtos::ThisThread::sleep_for
  # mbed_retarget.cpp calls singleton_mutex_id
  target_link_libraries(mbed-platform PUBLIC mbed-rtos)

  # Use Mbed-specific implementations of __user_perthread_libspace,
  # _mutex_acquire, _mutex_free, _mutex_initialize, _mutex_release
  # Revelant discussion: https://github.com/ARMmbed/mbed-os/pull/6973
  target_compile_definitions(cmsis-rtx PRIVATE RTX_NO_MULTITHREAD_CLIB)
endif()
