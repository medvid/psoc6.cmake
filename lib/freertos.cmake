psoc6_load_library(
  NAME freertos
  VERSION 10.3.1
  URL https://github.com/FreeRTOS/FreeRTOS-Kernel
  TAG V10.3.1-kernel-only
)

set(FREERTOS_SOURCES
  ${FREERTOS_DIR}/croutine.c
  ${FREERTOS_DIR}/event_groups.c
  ${FREERTOS_DIR}/list.c
  ${FREERTOS_DIR}/queue.c
  ${FREERTOS_DIR}/stream_buffer.c
  ${FREERTOS_DIR}/tasks.c
  ${FREERTOS_DIR}/timers.c
  ${FREERTOS_DIR}/include/atomic.h
  ${FREERTOS_DIR}/include/croutine.h
  ${FREERTOS_DIR}/include/deprecated_definitions.h
  ${FREERTOS_DIR}/include/event_groups.h
  ${FREERTOS_DIR}/include/FreeRTOS.h
  ${FREERTOS_DIR}/include/list.h
  ${FREERTOS_DIR}/include/message_buffer.h
  ${FREERTOS_DIR}/include/mpu_prototypes.h
  ${FREERTOS_DIR}/include/mpu_wrappers.h
  ${FREERTOS_DIR}/include/portable.h
  ${FREERTOS_DIR}/include/projdefs.h
  ${FREERTOS_DIR}/include/queue.h
  ${FREERTOS_DIR}/include/semphr.h
  ${FREERTOS_DIR}/include/stack_macros.h
  ${FREERTOS_DIR}/include/stream_buffer.h
  ${FREERTOS_DIR}/include/task.h
  ${FREERTOS_DIR}/include/timers.h
  #${FREERTOS_DIR}/portable/MemMang/heap_1.c
  #${FREERTOS_DIR}/portable/MemMang/heap_2.c
  ${FREERTOS_DIR}/portable/MemMang/heap_3.c
  #${FREERTOS_DIR}/portable/MemMang/heap_4.c
  #${FREERTOS_DIR}/portable/MemMang/heap_5.c
)
set(FREERTOS_INCLUDE_DIRS
  ${FREERTOS_DIR}/include
)
set(FREERTOS_LINK_LIBRARIES
  psoc6pdl
)

if(${TOOLCHAIN} STREQUAL GCC OR ${TOOLCHAIN} STREQUAL ARM)
  list(APPEND FREERTOS_SOURCES
    ${FREERTOS_DIR}/portable/GCC/ARM_CM4F/port.c
    ${FREERTOS_DIR}/portable/GCC/ARM_CM4F/portmacro.h
  )
  list(APPEND FREERTOS_INCLUDE_DIRS
    ${FREERTOS_DIR}/portable/GCC/ARM_CM4F
  )
elseif(${TOOLCHAIN} STREQUAL IAR)
  list(APPEND FREERTOS_SOURCES
    ${FREERTOS_DIR}/portable/IAR/ARM_CM4F/port.c
    ${FREERTOS_DIR}/portable/IAR/ARM_CM4F/portasm.s
    ${FREERTOS_DIR}/portable/IAR/ARM_CM4F/portmacro.h
  )
  list(APPEND FREERTOS_INCLUDE_DIRS
    ${FREERTOS_DIR}/portable/IAR/ARM_CM4F
  )
else()
  message(FATAL_ERROR "freertos: TOOLCHAIN ${TOOLCHAIN} is not supported.")
endif()

add_library(freertos STATIC EXCLUDE_FROM_ALL ${FREERTOS_SOURCES})
target_include_directories(freertos PUBLIC ${FREERTOS_INCLUDE_DIRS})
target_link_libraries(freertos PUBLIC ${FREERTOS_LINK_LIBRARIES})
