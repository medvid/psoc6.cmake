psoc6_load_library(
  NAME capsense
  VERSION 2.10.0
)

set(CAPSENSE_SOURCES
  ${CAPSENSE_DIR}/cy_capsense.h
  ${CAPSENSE_DIR}/cy_capsense_centroid.h
  ${CAPSENSE_DIR}/cy_capsense_centroid.c
  ${CAPSENSE_DIR}/cy_capsense_common.h
  ${CAPSENSE_DIR}/cy_capsense_control.h
  ${CAPSENSE_DIR}/cy_capsense_control.c
  ${CAPSENSE_DIR}/cy_capsense_csd.h
  ${CAPSENSE_DIR}/cy_capsense_csd.c
  ${CAPSENSE_DIR}/cy_capsense_csx.h
  ${CAPSENSE_DIR}/cy_capsense_csx.c
  ${CAPSENSE_DIR}/cy_capsense_filter.h
  ${CAPSENSE_DIR}/cy_capsense_filter.c
  ${CAPSENSE_DIR}/cy_capsense_gesture_lib.h
  ${CAPSENSE_DIR}/cy_capsense_lib.h
  ${CAPSENSE_DIR}/cy_capsense_processing.h
  ${CAPSENSE_DIR}/cy_capsense_processing.c
  ${CAPSENSE_DIR}/cy_capsense_selftest.h
  ${CAPSENSE_DIR}/cy_capsense_selftest.c
  ${CAPSENSE_DIR}/cy_capsense_sensing.h
  ${CAPSENSE_DIR}/cy_capsense_sensing.c
  ${CAPSENSE_DIR}/cy_capsense_structure.h
  ${CAPSENSE_DIR}/cy_capsense_structure.c
  ${CAPSENSE_DIR}/cy_capsense_tuner.h
  ${CAPSENSE_DIR}/cy_capsense_tuner.c
)
set(CAPSENSE_INCLUDE_DIRS
  ${CAPSENSE_DIR}
)
set(CAPSENSE_LINK_LIBRARIES
  psoc6pdl
)

# COMPONENT_SOFTFP libraries are compatible with CM0+ core
if(SOFTFP IN_LIST COMPONENTS OR ${CORE} STREQUAL CM0P)
  if(${TOOLCHAIN} STREQUAL GCC OR ${TOOLCHAIN} STREQUAL LLVM)
    list(APPEND CAPSENSE_LINK_LIBRARIES
      ${CAPSENSE_DIR}/COMPONENT_SOFTFP/TOOLCHAIN_GCC_ARM/libcy_capsense.a
    )
  elseif(${TOOLCHAIN} STREQUAL ARM)
    list(APPEND CAPSENSE_LINK_LIBRARIES
      ${CAPSENSE_DIR}/COMPONENT_SOFTFP/TOOLCHAIN_ARM/libcy_capsense.ar
    )
  elseif(${TOOLCHAIN} STREQUAL IAR)
    list(APPEND CAPSENSE_LINK_LIBRARIES
      ${CAPSENSE_DIR}/COMPONENT_SOFTFP/TOOLCHAIN_IAR/libcy_capsense.a
    )
  else()
    message(FATAL_ERROR "capsense: TOOLCHAIN ${TOOLCHAIN} is not supported.")
  endif()
elseif(HARDFP IN_LIST COMPONENTS)
  if(${TOOLCHAIN} STREQUAL GCC OR ${TOOLCHAIN} STREQUAL LLVM)
    list(APPEND CAPSENSE_LINK_LIBRARIES
      ${CAPSENSE_DIR}/COMPONENT_HARDFP/TOOLCHAIN_GCC_ARM/libcy_capsense.a
    )
  elseif(${TOOLCHAIN} STREQUAL ARM)
    list(APPEND CAPSENSE_LINK_LIBRARIES
      ${CAPSENSE_DIR}/COMPONENT_HARDFP/TOOLCHAIN_ARM/libcy_capsense.ar
    )
  elseif(${TOOLCHAIN} STREQUAL IAR)
    list(APPEND CAPSENSE_LINK_LIBRARIES
      ${CAPSENSE_DIR}/COMPONENT_HARDFP/TOOLCHAIN_IAR/libcy_capsense.a
    )
  else()
    message(FATAL_ERROR "capsense: TOOLCHAIN ${TOOLCHAIN} is not supported.")
  endif()
else()
  message(FATAL_ERROR "capsense: COMPONENTS should include either SOFTFP or HARDFP.")
endif()

add_library(capsense STATIC EXCLUDE_FROM_ALL ${CAPSENSE_SOURCES})
target_include_directories(capsense PUBLIC ${CAPSENSE_INCLUDE_DIRS})
target_link_libraries(capsense PUBLIC ${CAPSENSE_LINK_LIBRARIES})
