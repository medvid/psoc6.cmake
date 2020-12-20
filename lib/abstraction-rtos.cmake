psoc6_load_library(
  NAME abstraction-rtos
  VERSION 1.3.0
)

set(ABSTRACTION_RTOS_SOURCES
  ${ABSTRACTION_RTOS_DIR}/include/cyabs_rtos.h
  ${ABSTRACTION_RTOS_DIR}/include/cy_worker_thread.h
  ${ABSTRACTION_RTOS_DIR}/source/cy_worker_thread.c
)
set(ABSTRACTION_RTOS_INCLUDE_DIRS
  ${ABSTRACTION_RTOS_DIR}/include
)
set(ABSTRACTION_RTOS_LINK_LIBRARIES
  mtb-hal-cat1
)

if(${OS} STREQUAL FREERTOS)
  list(APPEND ABSTRACTION_RTOS_SOURCES
    ${ABSTRACTION_RTOS_DIR}/include/COMPONENT_FREERTOS/cyabs_rtos_impl.h
    ${ABSTRACTION_RTOS_DIR}/source/COMPONENT_FREERTOS/cyabs_freertos_helpers.c
    ${ABSTRACTION_RTOS_DIR}/source/COMPONENT_FREERTOS/cyabs_rtos_freertos.c
  )
  list(APPEND ABSTRACTION_RTOS_INCLUDE_DIRS
    ${ABSTRACTION_RTOS_DIR}/include/COMPONENT_FREERTOS
    # cyabs_freertos_helpers.c includes cycfg.h
    ${BSP_GENERATED_SOURCE_DIR}
  )
  list(APPEND ABSTRACTION_RTOS_LINK_LIBRARIES
    freertos
  )
elseif(${OS} STREQUAL RTX)
  list(APPEND ABSTRACTION_RTOS_SOURCES
    ${ABSTRACTION_RTOS_DIR}/include/COMPONENT_RTX/cyabs_rtos_impl.h
    ${ABSTRACTION_RTOS_DIR}/source/COMPONENT_RTX/cyabs_rtos_rtxv5.c
  )
  list(APPEND ABSTRACTION_RTOS_INCLUDE_DIRS
    ${ABSTRACTION_RTOS_DIR}/include/COMPONENT_RTX
  )
  list(APPEND ABSTRACTION_RTOS_LINK_LIBRARIES
    cmsis-rtx
  )
elseif(${OS} STREQUAL THREADX)
  set(ABSTRACTION_RTOS_THREADX_SOURCES
    ${ABSTRACTION_RTOS_DIR}/include/COMPONENT_THREADX/cyabs_rtos_impl.h
    ${ABSTRACTION_RTOS_DIR}/source/COMPONENT_THREADX/cyabs_rtos_threadx.c
  )
  set(ABSTRACTION_RTOS_THREADX_INCLUDE_DIRS
    ${ABSTRACTION_RTOS_DIR}/include/COMPONENT_THREADX
  )
  #TBD: set(ABSTRACTION_RTOS_THREADX_LINK_LIBRARIES threadx)
else()
  message(FATAL_ERROR "abstraction-troe: OS ${OS} is not supported.")
endif()

add_library(abstraction-rtos STATIC EXCLUDE_FROM_ALL
  ${ABSTRACTION_RTOS_SOURCES}
)
target_include_directories(abstraction-rtos PUBLIC
  ${ABSTRACTION_RTOS_INCLUDE_DIRS}
)
target_link_libraries(abstraction-rtos PUBLIC
  ${ABSTRACTION_RTOS_LINK_LIBRARIES}
)
