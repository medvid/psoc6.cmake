set(CMSIS_RTOS2_SOURCES
  ${CMSIS_DIR}/CMSIS/RTOS2/Include/cmsis_os2.h
  ${CMSIS_DIR}/CMSIS/RTOS2/Include/os_tick.h
  ${CMSIS_DIR}/CMSIS/RTOS2/Source/os_systick.c
  ${CMSIS_DIR}/CMSIS/RTOS2/Source/os_tick_ptim.c
)
set(CMSIS_RTOS2_INCLUDE_DIRS
  ${CMSIS_DIR}/CMSIS/RTOS2/Include
)
set(CMSIS_RTOS2_LINK_LIBRARIES
  cmsis-core psoc6pdl
)

add_library(cmsis-rtos2 STATIC EXCLUDE_FROM_ALL ${CMSIS_RTOS2_SOURCES})
target_include_directories(cmsis-rtos2 PUBLIC ${CMSIS_RTOS2_INCLUDE_DIRS})
target_link_libraries(cmsis-rtos2 PUBLIC ${CMSIS_RTOS2_LINK_LIBRARIES})
