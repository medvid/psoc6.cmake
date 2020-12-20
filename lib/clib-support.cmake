psoc6_load_library(
  NAME clib-support
  VERSION 1.0.2
)

set(CLIB_SUPPORT_SOURCES
  ${CLIB_SUPPORT_DIR}/cy_mutex_pool.h
  ${CLIB_SUPPORT_DIR}/cy_mutex_pool.c
)
set(CLIB_SUPPORT_INCLUDE_DIRS
  ${CLIB_SUPPORT_DIR}
)
set(CLIB_SUPPORT_LINK_LIBRARIES
  freertos
)

if(${TOOLCHAIN} STREQUAL GCC OR ${TOOLCHAIN} STREQUAL LLVM)
  list(APPEND CLIB_SUPPORT_SOURCES
    ${CLIB_SUPPORT_DIR}/TOOLCHAIN_GCC_ARM/cy_mutex_pool_cfg.h
    ${CLIB_SUPPORT_DIR}/TOOLCHAIN_GCC_ARM/cy_newlib_freertos.c
  )
  target_include_directories(freertos PUBLIC
    ${CLIB_SUPPORT_DIR}/TOOLCHAIN_GCC_ARM
  )
elseif(${TOOLCHAIN} STREQUAL ARM)
  list(APPEND CLIB_SUPPORT_SOURCES
    ${CLIB_SUPPORT_DIR}/TOOLCHAIN_ARM/cy_mutex_pool_cfg.h
    ${CLIB_SUPPORT_DIR}/TOOLCHAIN_ARM/cy_arm_freertos.c
    ${CLIB_SUPPORT_DIR}/TOOLCHAIN_ARM/reent.h
  )
  target_include_directories(freertos PUBLIC
    ${CLIB_SUPPORT_DIR}/TOOLCHAIN_ARM
  )
elseif(${TOOLCHAIN} STREQUAL IAR)
  list(APPEND CLIB_SUPPORT_SOURCES
    ${CLIB_SUPPORT_DIR}/TOOLCHAIN_IAR/cy_mutex_pool_cfg.h
    ${CLIB_SUPPORT_DIR}/TOOLCHAIN_IAR/cy_iar_freertos.c
    ${CLIB_SUPPORT_DIR}/TOOLCHAIN_IAR/reent.h
  )
  target_include_directories(freertos PUBLIC
    ${CLIB_SUPPORT_DIR}/TOOLCHAIN_IAR
  )
else()
  message(FATAL_ERROR "clib-support: TOOLCHAIN ${TOOLCHAIN} is not supported.")
endif()

add_library(clib-support STATIC EXCLUDE_FROM_ALL ${CLIB_SUPPORT_SOURCES})
target_include_directories(clib-support PUBLIC ${CLIB_SUPPORT_INCLUDE_DIRS})
target_link_libraries(clib-support PUBLIC ${CLIB_SUPPORT_LINK_LIBRARIES})
