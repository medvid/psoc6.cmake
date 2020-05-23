set(MBED_RTOS_DIR ${MBED_OS_DIR}/rtos)
set(MBED_RTOS_SOURCES
  ${MBED_RTOS_DIR}/source/ConditionVariable.cpp
  ${MBED_RTOS_DIR}/source/EventFlags.cpp
  ${MBED_RTOS_DIR}/source/Kernel.cpp
  ${MBED_RTOS_DIR}/source/Mutex.cpp
  ${MBED_RTOS_DIR}/source/Semaphore.cpp
  ${MBED_RTOS_DIR}/source/ThisThread.cpp
  ${MBED_RTOS_DIR}/source/Thread.cpp
  ${MBED_RTOS_DIR}/source/TARGET_CORTEX/mbed_boot.c
  ${MBED_RTOS_DIR}/source/TARGET_CORTEX/mbed_rtos_rtx.c
  ${MBED_RTOS_DIR}/source/TARGET_CORTEX/mbed_rtx_handlers.c
  ${MBED_RTOS_DIR}/source/TARGET_CORTEX/mbed_rtx_idle.cpp
)
set(MBED_RTOS_INCLUDE_DIRS
  ${MBED_RTOS_DIR}
  # rtos/mbed_rtos_storage.h includes mbed_rtx_storage.h
  ${MBED_RTOS_DIR}/source/TARGET_CORTEX
  # mbed_rtx_idle.cpp includes TimerEvent.h
  ${MBED_DRIVERS_DIR}
)
set(MBED_RTOS_DEFINES
  MBED_CONF_RTOS_PRESENT=1
  MBED_CONF_RTOS_API_PRESENT=1
  # The size of the main thread's stack
  MBED_CONF_RTOS_MAIN_THREAD_STACK_SIZE=4096

  # The default stack size of new threads
  MBED_CONF_RTOS_THREAD_STACK_SIZE=4096
)
set(MBED_RTOS_LINK_LIBRARIES
  cmsis-rtx
  mbed-platform
  psoc6hal
)

if(${TOOLCHAIN} STREQUAL GCC)
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
