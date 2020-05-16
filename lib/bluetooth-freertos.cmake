psoc6_load_library(
  NAME bluetooth-freertos
  VERSION 1.1.0
)

set(BLUETOOTH_FREERTOS_SOURCES
  ${BLUETOOTH_FREERTOS_DIR}/platform/common/cybt_bt_task.c
  ${BLUETOOTH_FREERTOS_DIR}/platform/common/cybt_hci_task.c
  ${BLUETOOTH_FREERTOS_DIR}/platform/common/cybt_host_stack_platform_interface.c
  ${BLUETOOTH_FREERTOS_DIR}/platform/common/cybt_patchram_download.c
  ${BLUETOOTH_FREERTOS_DIR}/platform/common/cybt_platform_config.h
  ${BLUETOOTH_FREERTOS_DIR}/platform/common/cybt_platform_hci.h
  ${BLUETOOTH_FREERTOS_DIR}/platform/common/cybt_platform_interface.h
  ${BLUETOOTH_FREERTOS_DIR}/platform/common/cybt_platform_main.c
  ${BLUETOOTH_FREERTOS_DIR}/platform/common/cybt_platform_task.h
  ${BLUETOOTH_FREERTOS_DIR}/platform/common/cybt_platform_task.c
  ${BLUETOOTH_FREERTOS_DIR}/platform/common/cybt_platform_trace.h
  ${BLUETOOTH_FREERTOS_DIR}/platform/common/cybt_platform_trace.c
  ${BLUETOOTH_FREERTOS_DIR}/platform/common/cybt_platform_util.h
  ${BLUETOOTH_FREERTOS_DIR}/platform/common/cybt_prm.h
  ${BLUETOOTH_FREERTOS_DIR}/platform/common/cybt_prm.c
  ${BLUETOOTH_FREERTOS_DIR}/platform/common/cybt_result.h
)
set(BLUETOOTH_FREERTOS_INCLUDE_DIRS
  ${BLUETOOTH_FREERTOS_DIR}
  # cybt_host_stack_platform_interface.c inludes cycfg_system.h
  ${BSP_GENERATED_SOURCE_DIR}
)
set(BLUETOOTH_FREERTOS_LINK_LIBRARIES
  btstack
  freertos
  abstraction-rtos
)

if(43012 IN_LIST COMPONENTS)
  list(APPEND BLUETOOTH_FREERTOS_SOURCES
    ${BLUETOOTH_FREERTOS_DIR}/firmware/COMPONENT_43012/w_bt_firmware_controller.c
  )
elseif(4343W IN_LIST COMPONENTS)
  list(APPEND BLUETOOTH_FREERTOS_SOURCES
    ${BLUETOOTH_FREERTOS_DIR}/firmware/COMPONENT_4343W/w_bt_firmware_controller.c
  )
else()
  message(FATAL_ERROR "bluetooth-freertos: COMPONENTS should include either 43012 or 4343W.")
endif()

add_library(bluetooth-freertos STATIC EXCLUDE_FROM_ALL ${BLUETOOTH_FREERTOS_SOURCES})
target_include_directories(bluetooth-freertos PUBLIC ${BLUETOOTH_FREERTOS_INCLUDE_DIRS})
target_link_libraries(bluetooth-freertos PUBLIC ${BLUETOOTH_FREERTOS_LINK_LIBRARIES})
