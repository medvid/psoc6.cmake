psoc6_load_library(
  NAME btstack
  VERSION 1.3.0
)

set(BTSTACK_SOURCES
  ${BTSTACK_DIR}/wiced_include/gattdefs.h
  ${BTSTACK_DIR}/wiced_include/hci_control_api.h
  ${BTSTACK_DIR}/wiced_include/hcidefs.h
  ${BTSTACK_DIR}/wiced_include/l2cdefs.h
  ${BTSTACK_DIR}/wiced_include/wiced_audio_sink.h
  ${BTSTACK_DIR}/wiced_include/wiced_bt_a2d.h
  ${BTSTACK_DIR}/wiced_include/wiced_bt_a2d_m12.h
  ${BTSTACK_DIR}/wiced_include/wiced_bt_a2d_m24.h
  ${BTSTACK_DIR}/wiced_include/wiced_bt_a2d_sbc.h
  ${BTSTACK_DIR}/wiced_include/wiced_bt_a2dp_defs.h
  ${BTSTACK_DIR}/wiced_include/wiced_bt_a2dp_sink.h
  ${BTSTACK_DIR}/wiced_include/wiced_bt_audio.h
  ${BTSTACK_DIR}/wiced_include/wiced_bt_avdt.h
  ${BTSTACK_DIR}/wiced_include/wiced_bt_avrc.h
  ${BTSTACK_DIR}/wiced_include/wiced_bt_avrc_defs.h
  ${BTSTACK_DIR}/wiced_include/wiced_bt_ble.h
  ${BTSTACK_DIR}/wiced_include/wiced_bt_ble_hidh.h
  ${BTSTACK_DIR}/wiced_include/wiced_bt_ble_hidh_audio.h
  ${BTSTACK_DIR}/wiced_include/wiced_bt_cfg.h
  ${BTSTACK_DIR}/wiced_include/wiced_bt_constants.h
  ${BTSTACK_DIR}/wiced_include/wiced_bt_dev.h
  ${BTSTACK_DIR}/wiced_include/wiced_bt_gatt.h
  ${BTSTACK_DIR}/wiced_include/wiced_bt_hidd.h
  ${BTSTACK_DIR}/wiced_include/wiced_bt_hidd_ble.h
  ${BTSTACK_DIR}/wiced_include/wiced_bt_l2c.h
  ${BTSTACK_DIR}/wiced_include/wiced_bt_rfcomm.h
  ${BTSTACK_DIR}/wiced_include/wiced_bt_sco.h
  ${BTSTACK_DIR}/wiced_include/wiced_bt_sdp.h
  ${BTSTACK_DIR}/wiced_include/wiced_bt_sdp_defs.h
  ${BTSTACK_DIR}/wiced_include/wiced_bt_stack.h
  ${BTSTACK_DIR}/wiced_include/wiced_bt_stack_platform.h
  ${BTSTACK_DIR}/wiced_include/wiced_bt_trace.h
  ${BTSTACK_DIR}/wiced_include/wiced_bt_types.h
  ${BTSTACK_DIR}/wiced_include/wiced_bt_uuid.h
  ${BTSTACK_DIR}/wiced_include/wiced_data_types.h
  ${BTSTACK_DIR}/wiced_include/wiced_memory.h
  ${BTSTACK_DIR}/wiced_include/wiced_result.h
  ${BTSTACK_DIR}/wiced_include/wiced_timer.h
  ${BTSTACK_DIR}/wiced_include/wiced_timer_legacy.h
)
set(BTSTACK_INCLUDE_DIRS
  ${BTSTACK_DIR}/wiced_include
)

set(BTSTACK_BLE_LINK_LIBRARIES btstack)
if(SOFTFP IN_LIST COMPONENTS)
  if(${TOOLCHAIN} STREQUAL GCC)
    list(APPEND BTSTACK_BLE_LINK_LIBRARIES
      ${BTSTACK_DIR}/stack/COMPONENT_WICED_BLE/COMPONENT_CM4/COMPONENT_SOFTFP/TOOLCHAIN_GCC_ARM/libbtstack.a
    )
  elseif(${TOOLCHAIN} STREQUAL ARM)
    list(APPEND BTSTACK_BLE_LINK_LIBRARIES
      ${BTSTACK_DIR}/stack/COMPONENT_WICED_BLE/COMPONENT_CM4/COMPONENT_SOFTFP/TOOLCHAIN_ARM/libbtstack.ar
    )
  elseif(${TOOLCHAIN} STREQUAL IAR)
    list(APPEND BTSTACK_BLE_LINK_LIBRARIES
      ${BTSTACK_DIR}/stack/COMPONENT_WICED_BLE/COMPONENT_CM4/COMPONENT_SOFTFP/TOOLCHAIN_IAR/libbtstack.a
    )
  else()
    message(FATAL_ERROR "btstack: TOOLCHAIN ${TOOLCHAIN} is not supported.")
  endif()
elseif(HARDFP IN_LIST COMPONENTS)
  if(${TOOLCHAIN} STREQUAL GCC)
    list(APPEND BTSTACK_BLE_LINK_LIBRARIES
      ${BTSTACK_DIR}/stack/COMPONENT_WICED_BLE/COMPONENT_CM4/COMPONENT_HARDFP/TOOLCHAIN_GCC_ARM/libbtstack.a
    )
  elseif(${TOOLCHAIN} STREQUAL ARM)
    list(APPEND BTSTACK_BLE_LINK_LIBRARIES
      ${BTSTACK_DIR}/stack/COMPONENT_WICED_BLE/COMPONENT_CM4/COMPONENT_HARDFP/TOOLCHAIN_ARM/libbtstack.ar
    )
  elseif(${TOOLCHAIN} STREQUAL IAR)
    list(APPEND BTSTACK_BLE_LINK_LIBRARIES
      ${BTSTACK_DIR}/stack/COMPONENT_WICED_BLE/COMPONENT_CM4/COMPONENT_HARDFP/TOOLCHAIN_IAR/libbtstack.a
    )
  else()
    message(FATAL_ERROR "btstack: TOOLCHAIN ${TOOLCHAIN} is not supported.")
  endif()
else()
  message(FATAL_ERROR "btstack: COMPONENTS should include either SOFTFP or HARDFP.")
endif()

set(BTSTACK_DUALMODE_LINK_LIBRARIES btstack)
if(SOFTFP IN_LIST COMPONENTS)
  if(${TOOLCHAIN} STREQUAL GCC)
    list(APPEND BTSTACK_DUALMODE_LINK_LIBRARIES
      ${BTSTACK_DIR}/stack/COMPONENT_WICED_DUALMODE/COMPONENT_CM4/COMPONENT_SOFTFP/TOOLCHAIN_GCC_ARM/libbtstack.a
    )
  elseif(${TOOLCHAIN} STREQUAL ARM)
    list(APPEND BTSTACK_DUALMODE_LINK_LIBRARIES
      ${BTSTACK_DIR}/stack/COMPONENT_WICED_DUALMODE/COMPONENT_CM4/COMPONENT_SOFTFP/TOOLCHAIN_ARM/libbtstack.ar
    )
  elseif(${TOOLCHAIN} STREQUAL IAR)
    list(APPEND BTSTACK_DUALMODE_LINK_LIBRARIES
      ${BTSTACK_DIR}/stack/COMPONENT_WICED_DUALMODE/COMPONENT_CM4/COMPONENT_SOFTFP/TOOLCHAIN_IAR/libbtstack.a
    )
  else()
    message(FATAL_ERROR "btstack: TOOLCHAIN ${TOOLCHAIN} is not supported.")
  endif()
elseif(HARDFP IN_LIST COMPONENTS)
  if(${TOOLCHAIN} STREQUAL GCC)
    list(APPEND BTSTACK_DUALMODE_LINK_LIBRARIES
      ${BTSTACK_DIR}/stack/COMPONENT_WICED_DUALMODE/COMPONENT_CM4/COMPONENT_HARDFP/TOOLCHAIN_GCC_ARM/libbtstack.a
    )
  elseif(${TOOLCHAIN} STREQUAL ARM)
    list(APPEND BTSTACK_DUALMODE_LINK_LIBRARIES
      ${BTSTACK_DIR}/stack/COMPONENT_WICED_DUALMODE/COMPONENT_CM4/COMPONENT_HARDFP/TOOLCHAIN_ARM/libbtstack.ar
    )
  elseif(${TOOLCHAIN} STREQUAL IAR)
    list(APPEND BTSTACK_DUALMODE_LINK_LIBRARIES
      ${BTSTACK_DIR}/stack/COMPONENT_WICED_DUALMODE/COMPONENT_CM4/COMPONENT_HARDFP/TOOLCHAIN_IAR/libbtstack.a
    )
  else()
    message(FATAL_ERROR "btstack: TOOLCHAIN ${TOOLCHAIN} is not supported.")
  endif()
else()
  message(FATAL_ERROR "btstack: COMPONENTS should include either SOFTFP or HARDFP.")
endif()

add_library(btstack INTERFACE)
target_sources(btstack INTERFACE ${BTSTACK_SOURCES})
target_include_directories(btstack INTERFACE ${BTSTACK_INCLUDE_DIRS})

add_library(btstack-ble INTERFACE)
target_link_libraries(btstack-ble INTERFACE ${BTSTACK_BLE_LINK_LIBRARIES})

add_library(btstack-dualmode INTERFACE)
target_link_libraries(btstack-dualmode INTERFACE ${BTSTACK_DUALMODE_LINK_LIBRARIES})
