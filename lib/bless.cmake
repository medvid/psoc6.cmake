psoc6_load_library(
  NAME bless
  VERSION 3.50.0
)

set(BLESS_SOURCES
  ${BLESS_DIR}/cy_ble.h
  ${BLESS_DIR}/cy_ble.c
  ${BLESS_DIR}/cy_ble_aios.h
  ${BLESS_DIR}/cy_ble_aios.c
  ${BLESS_DIR}/cy_ble_ancs.h
  ${BLESS_DIR}/cy_ble_ancs.c
  ${BLESS_DIR}/cy_ble_ans.h
  ${BLESS_DIR}/cy_ble_ans.c
  ${BLESS_DIR}/cy_ble_bas.h
  ${BLESS_DIR}/cy_ble_bas.c
  ${BLESS_DIR}/cy_ble_bcs.h
  ${BLESS_DIR}/cy_ble_bcs.c
  ${BLESS_DIR}/cy_ble_bls.h
  ${BLESS_DIR}/cy_ble_bls.c
  ${BLESS_DIR}/cy_ble_bms.h
  ${BLESS_DIR}/cy_ble_bms.c
  ${BLESS_DIR}/cy_ble_bts.h
  ${BLESS_DIR}/cy_ble_bts.c
  ${BLESS_DIR}/cy_ble_cfg_common.h
  ${BLESS_DIR}/cy_ble_cgms.h
  ${BLESS_DIR}/cy_ble_cgms.c
  ${BLESS_DIR}/cy_ble_controller.c
  ${BLESS_DIR}/cy_ble_cps.h
  ${BLESS_DIR}/cy_ble_cps.c
  ${BLESS_DIR}/cy_ble_cscs.h
  ${BLESS_DIR}/cy_ble_cscs.c
  ${BLESS_DIR}/cy_ble_cts.h
  ${BLESS_DIR}/cy_ble_cts.c
  ${BLESS_DIR}/cy_ble_custom.h
  ${BLESS_DIR}/cy_ble_custom.c
  ${BLESS_DIR}/cy_ble_defines.h
  ${BLESS_DIR}/cy_ble_dis.h
  ${BLESS_DIR}/cy_ble_dis.c
  ${BLESS_DIR}/cy_ble_ds.h
  ${BLESS_DIR}/cy_ble_ess.h
  ${BLESS_DIR}/cy_ble_ess.c
  ${BLESS_DIR}/cy_ble_event_handler.h
  ${BLESS_DIR}/cy_ble_event_handler.c
  ${BLESS_DIR}/cy_ble_gap.h
  ${BLESS_DIR}/cy_ble_gap.c
  ${BLESS_DIR}/cy_ble_gatt.h
  ${BLESS_DIR}/cy_ble_gatt.c
  ${BLESS_DIR}/cy_ble_gls.h
  ${BLESS_DIR}/cy_ble_gls.c
  ${BLESS_DIR}/cy_ble_hal_int.c
  ${BLESS_DIR}/cy_ble_hal_pvt.h
  ${BLESS_DIR}/cy_ble_hal_pvt.c
  ${BLESS_DIR}/cy_ble_hids.h
  ${BLESS_DIR}/cy_ble_hids.c
  ${BLESS_DIR}/cy_ble_hps.h
  ${BLESS_DIR}/cy_ble_hps.c
  ${BLESS_DIR}/cy_ble_hrs.h
  ${BLESS_DIR}/cy_ble_hrs.c
  ${BLESS_DIR}/cy_ble_hts.h
  ${BLESS_DIR}/cy_ble_hts.c
  ${BLESS_DIR}/cy_ble_ias.h
  ${BLESS_DIR}/cy_ble_ias.c
  ${BLESS_DIR}/cy_ble_ips.h
  ${BLESS_DIR}/cy_ble_ips.c
  ${BLESS_DIR}/cy_ble_lls.h
  ${BLESS_DIR}/cy_ble_lls.c
  ${BLESS_DIR}/cy_ble_lns.h
  ${BLESS_DIR}/cy_ble_lns.c
  ${BLESS_DIR}/cy_ble_ndcs.h
  ${BLESS_DIR}/cy_ble_ndcs.c
  ${BLESS_DIR}/cy_ble_pass.h
  ${BLESS_DIR}/cy_ble_pass.c
  ${BLESS_DIR}/cy_ble_plxs.h
  ${BLESS_DIR}/cy_ble_plxs.c
  ${BLESS_DIR}/cy_ble_rscs.h
  ${BLESS_DIR}/cy_ble_rscs.c
  ${BLESS_DIR}/cy_ble_rtus.h
  ${BLESS_DIR}/cy_ble_rtus.c
  ${BLESS_DIR}/cy_ble_scps.h
  ${BLESS_DIR}/cy_ble_scps.c
  ${BLESS_DIR}/cy_ble_stack.h
  ${BLESS_DIR}/cy_ble_stack_gap.h
  ${BLESS_DIR}/cy_ble_stack_gap_central.h
  ${BLESS_DIR}/cy_ble_stack_gap_peripheral.h
  ${BLESS_DIR}/cy_ble_stack_gatt.h
  ${BLESS_DIR}/cy_ble_stack_gatt_client.h
  ${BLESS_DIR}/cy_ble_stack_gatt_db.h
  ${BLESS_DIR}/cy_ble_stack_gatt_server.h
  ${BLESS_DIR}/cy_ble_stack_host_error.h
  ${BLESS_DIR}/cy_ble_stack_host_main.h
  ${BLESS_DIR}/cy_ble_stack_l2cap.h
  ${BLESS_DIR}/cy_ble_stack_pvt.h
  ${BLESS_DIR}/cy_ble_tps.h
  ${BLESS_DIR}/cy_ble_tps.c
  ${BLESS_DIR}/cy_ble_uds.h
  ${BLESS_DIR}/cy_ble_uds.c
  ${BLESS_DIR}/cy_ble_wpts.h
  ${BLESS_DIR}/cy_ble_wpts.c
  ${BLESS_DIR}/cy_ble_wss.h
  ${BLESS_DIR}/cy_ble_wss.c
)
# BLE common sources are included in the application (depend on cycfg_ble.h)
set(BLESS_COMMON_SOURCES
  ${BLESS_DIR}/common/cy_ble_common.h
  ${BLESS_DIR}/common/cy_ble_common.c
)
set(BLESS_INCLUDE_DIRS
  ${BLESS_DIR}
  ${BLESS_DIR}/common
)
set(BLESS_LINK_LIBRARIES
  psoc6pdl
)

if(SOFTFP IN_LIST COMPONENTS)
  if(${TOOLCHAIN} STREQUAL GCC OR ${TOOLCHAIN} STREQUAL LLVM)
    set(BLESS_HOST_LINK_LIBRARIES
      ${BLESS_DIR}/COMPONENT_BLESS_HOST/COMPONENT_CM4/COMPONENT_SOFTFP/TOOLCHAIN_GCC_ARM/cy_ble_stack_host.a
    )
  elseif(${TOOLCHAIN} STREQUAL ARM)
    set(BLESS_HOST_LINK_LIBRARIES
      ${BLESS_DIR}/COMPONENT_BLESS_HOST/COMPONENT_CM4/COMPONENT_SOFTFP/TOOLCHAIN_ARM/cy_ble_stack_host.ar
    )
  elseif(${TOOLCHAIN} STREQUAL IAR)
    set(BLESS_HOST_LINK_LIBRARIES
      ${BLESS_DIR}/COMPONENT_BLESS_HOST/COMPONENT_CM4/COMPONENT_SOFTFP/TOOLCHAIN_IAR/cy_ble_stack_host.a
    )
  else()
    message(FATAL_ERROR "bless: TOOLCHAIN ${TOOLCHAIN} is not supported.")
  endif()
elseif(HARDFP IN_LIST COMPONENTS)
  if(${TOOLCHAIN} STREQUAL GCC OR ${TOOLCHAIN} STREQUAL LLVM)
    set(BLESS_HOST_LINK_LIBRARIES
      ${BLESS_DIR}/COMPONENT_BLESS_HOST/COMPONENT_CM4/COMPONENT_HARDFP/TOOLCHAIN_GCC_ARM/cy_ble_stack_host.a
    )
  elseif(${TOOLCHAIN} STREQUAL ARM)
    set(BLESS_HOST_LINK_LIBRARIES
      ${BLESS_DIR}/COMPONENT_BLESS_HOST/COMPONENT_CM4/COMPONENT_HARDFP/TOOLCHAIN_ARM/cy_ble_stack_host.ar
    )
  elseif(${TOOLCHAIN} STREQUAL IAR)
    set(BLESS_HOST_LINK_LIBRARIES
      ${BLESS_DIR}/COMPONENT_BLESS_HOST/COMPONENT_CM4/COMPONENT_HARDFP/TOOLCHAIN_IAR/cy_ble_stack_host.a
    )
  else()
    message(FATAL_ERROR "bless: TOOLCHAIN ${TOOLCHAIN} is not supported.")
  endif()
else()
  message(FATAL_ERROR "bless: COMPONENTS should include either SOFTFP or HARDFP.")
endif()

if(SOFTFP IN_LIST COMPONENTS)
  if(${TOOLCHAIN} STREQUAL GCC OR ${TOOLCHAIN} STREQUAL LLVM)
    set(BLESS_HOST_IPC_LINK_LIBRARIES
      ${BLESS_DIR}/COMPONENT_BLESS_HOST_IPC/COMPONENT_CM4/COMPONENT_SOFTFP/TOOLCHAIN_GCC_ARM/cy_ble_stack_host.a
    )
  elseif(${TOOLCHAIN} STREQUAL ARM)
    set(BLESS_HOST_IPC_LINK_LIBRARIES
      ${BLESS_DIR}/COMPONENT_BLESS_HOST_IPC/COMPONENT_CM4/COMPONENT_SOFTFP/TOOLCHAIN_ARM/cy_ble_stack_host.ar
    )
  elseif(${TOOLCHAIN} STREQUAL IAR)
    set(BLESS_HOST_IPC_LINK_LIBRARIES
      ${BLESS_DIR}/COMPONENT_BLESS_HOST_IPC/COMPONENT_CM4/COMPONENT_SOFTFP/TOOLCHAIN_IAR/cy_ble_stack_host.a
    )
  else()
    message(FATAL_ERROR "bless: TOOLCHAIN ${TOOLCHAIN} is not supported.")
  endif()
elseif(HARDFP IN_LIST COMPONENTS)
  if(${TOOLCHAIN} STREQUAL GCC OR ${TOOLCHAIN} STREQUAL LLVM)
    set(BLESS_HOST_IPC_LINK_LIBRARIES
      ${BLESS_DIR}/COMPONENT_BLESS_HOST_IPC/COMPONENT_CM4/COMPONENT_HARDFP/TOOLCHAIN_GCC_ARM/cy_ble_stack_host.a
    )
  elseif(${TOOLCHAIN} STREQUAL ARM)
    set(BLESS_HOST_IPC_LINK_LIBRARIES
      ${BLESS_DIR}/COMPONENT_BLESS_HOST_IPC/COMPONENT_CM4/COMPONENT_HARDFP/TOOLCHAIN_ARM/cy_ble_stack_host.ar
    )
  elseif(${TOOLCHAIN} STREQUAL IAR)
    set(BLESS_HOST_IPC_LINK_LIBRARIES
      ${BLESS_DIR}/COMPONENT_BLESS_HOST_IPC/COMPONENT_CM4/COMPONENT_HARDFP/TOOLCHAIN_IAR/cy_ble_stack_host.a
    )
  else()
    message(FATAL_ERROR "bless: TOOLCHAIN ${TOOLCHAIN} is not supported.")
  endif()
else()
  message(FATAL_ERROR "bless: COMPONENTS should include either SOFTFP or HARDFP.")
endif()

if(SOFTFP IN_LIST COMPONENTS)
  if(${TOOLCHAIN} STREQUAL GCC OR ${TOOLCHAIN} STREQUAL LLVM)
    set(BLESS_CONTROLLER_LINK_LIBRARIES
      ${BLESS_DIR}/COMPONENT_BLESS_CONTROLLER/COMPONENT_CM4/COMPONENT_SOFTFP/TOOLCHAIN_GCC_ARM/cy_ble_stack_controller.a
      ${BLESS_DIR}/COMPONENT_BLESS_CONTROLLER/COMPONENT_CM4/COMPONENT_SOFTFP/TOOLCHAIN_GCC_ARM/cy_ble_stack_manager.a
    )
  elseif(${TOOLCHAIN} STREQUAL ARM)
    set(BLESS_CONTROLLER_LINK_LIBRARIES
      ${BLESS_DIR}/COMPONENT_BLESS_CONTROLLER/COMPONENT_CM4/COMPONENT_SOFTFP/TOOLCHAIN_ARM/cy_ble_stack_controller.ar
      ${BLESS_DIR}/COMPONENT_BLESS_CONTROLLER/COMPONENT_CM4/COMPONENT_SOFTFP/TOOLCHAIN_ARM/cy_ble_stack_manager.ar
    )
  elseif(${TOOLCHAIN} STREQUAL IAR)
    set(BLESS_CONTROLLER_LINK_LIBRARIES
      ${BLESS_DIR}/COMPONENT_BLESS_CONTROLLER/COMPONENT_CM4/COMPONENT_SOFTFP/TOOLCHAIN_IAR/cy_ble_stack_controller.a
      ${BLESS_DIR}/COMPONENT_BLESS_CONTROLLER/COMPONENT_CM4/COMPONENT_SOFTFP/TOOLCHAIN_IAR/cy_ble_stack_manager.a
    )
  else()
    message(FATAL_ERROR "bless: TOOLCHAIN ${TOOLCHAIN} is not supported.")
  endif()
elseif(HARDFP IN_LIST COMPONENTS)
  if(${TOOLCHAIN} STREQUAL GCC OR ${TOOLCHAIN} STREQUAL LLVM)
    set(BLESS_CONTROLLER_LINK_LIBRARIES
      ${BLESS_DIR}/COMPONENT_BLESS_CONTROLLER/COMPONENT_CM4/COMPONENT_HARDFP/TOOLCHAIN_GCC_ARM/cy_ble_stack_controller.a
      ${BLESS_DIR}/COMPONENT_BLESS_CONTROLLER/COMPONENT_CM4/COMPONENT_HARDFP/TOOLCHAIN_GCC_ARM/cy_ble_stack_manager.a
    )
  elseif(${TOOLCHAIN} STREQUAL ARM)
    set(BLESS_CONTROLLER_LINK_LIBRARIES
      ${BLESS_DIR}/COMPONENT_BLESS_CONTROLLER/COMPONENT_CM4/COMPONENT_HARDFP/TOOLCHAIN_ARM/cy_ble_stack_controller.ar
      ${BLESS_DIR}/COMPONENT_BLESS_CONTROLLER/COMPONENT_CM4/COMPONENT_HARDFP/TOOLCHAIN_ARM/cy_ble_stack_manager.ar
    )
  elseif(${TOOLCHAIN} STREQUAL IAR)
    set(BLESS_CONTROLLER_LINK_LIBRARIES
      ${BLESS_DIR}/COMPONENT_BLESS_CONTROLLER/COMPONENT_CM4/COMPONENT_HARDFP/TOOLCHAIN_IAR/cy_ble_stack_controller.a
      ${BLESS_DIR}/COMPONENT_BLESS_CONTROLLER/COMPONENT_CM4/COMPONENT_HARDFP/TOOLCHAIN_IAR/cy_ble_stack_manager.a
    )
  else()
    message(FATAL_ERROR "bless: TOOLCHAIN ${TOOLCHAIN} is not supported.")
  endif()
else()
  message(FATAL_ERROR "bless: COMPONENTS should include either SOFTFP or HARDFP.")
endif()

if(${TOOLCHAIN} STREQUAL GCC OR ${TOOLCHAIN} STREQUAL LLVM)
  set(BLESS_CONTROLLER_IPC_LINK_LIBRARIES
    ${BLESS_DIR}/COMPONENT_BLESS_CONTROLLER_IPC/TOOLCHAIN_GCC_ARM/cy_ble_stack_controller.a
    ${BLESS_DIR}/COMPONENT_BLESS_CONTROLLER_IPC/TOOLCHAIN_GCC_ARM/cy_ble_stack_radio.a
  )
elseif(${TOOLCHAIN} STREQUAL ARM)
  set(BLESS_CONTROLLER_IPC_LINK_LIBRARIES
    ${BLESS_DIR}/COMPONENT_BLESS_CONTROLLER_IPC/TOOLCHAIN_ARM/cy_ble_stack_controller.ar
    ${BLESS_DIR}/COMPONENT_BLESS_CONTROLLER_IPC/TOOLCHAIN_ARM/cy_ble_stack_radio.ar
  )
elseif(${TOOLCHAIN} STREQUAL IAR)
  set(BLESS_CONTROLLER_IPC_LINK_LIBRARIES
    ${BLESS_DIR}/COMPONENT_BLESS_CONTROLLER_IPC/TOOLCHAIN_IAR/cy_ble_stack_controller.a
    ${BLESS_DIR}/COMPONENT_BLESS_CONTROLLER_IPC/TOOLCHAIN_IAR/cy_ble_stack_radio.a
  )
else()
  message(FATAL_ERROR "bless: TOOLCHAIN ${TOOLCHAIN} is not supported.")
endif()

# Refer to BLESS Configuration Considerations docs for the supported BLE Stack operating modes:
# https://cypresssemiconductorco.github.io/bless/ble_api_reference_manual/html/page_ble_section_configuration_considerations.html#group_ble_section_conf_cons_prebuild

add_library(bless-host STATIC EXCLUDE_FROM_ALL ${BLESS_SOURCES})
target_include_directories(bless-host PUBLIC ${BLESS_INCLUDE_DIRS})
target_compile_definitions(bless-host PUBLIC
  COMPONENT_BLESS_HOST
)
target_link_libraries(bless-host PUBLIC
  ${BLESS_LINK_LIBRARIES}
  ${BLESS_HOST_LINK_LIBRARIES}
)

add_library(bless-host-ipc STATIC EXCLUDE_FROM_ALL ${BLESS_SOURCES})
target_include_directories(bless-host-ipc PUBLIC ${BLESS_INCLUDE_DIRS})
target_compile_definitions(bless-host-ipc PUBLIC
  COMPONENT_BLESS_HOST_IPC
)
target_link_libraries(bless-host-ipc PUBLIC
  ${BLESS_LINK_LIBRARIES}
  ${BLESS_HOST_IPC_LINK_LIBRARIES}
)

add_library(bless-host-controller STATIC EXCLUDE_FROM_ALL ${BLESS_SOURCES})
target_include_directories(bless-host-controller PUBLIC ${BLESS_INCLUDE_DIRS})
target_compile_definitions(bless-host-controller PUBLIC
  COMPONENT_BLESS_HOST
  COMPONENT_BLESS_CONTROLLER
)
target_link_libraries(bless-host-controller PUBLIC
  ${BLESS_LINK_LIBRARIES}
  ${BLESS_HOST_LINK_LIBRARIES}
  ${BLESS_CONTROLLER_LINK_LIBRARIES}
)

add_library(bless-controller-ipc STATIC EXCLUDE_FROM_ALL ${BLESS_SOURCES})
target_include_directories(bless-controller-ipc PUBLIC ${BLESS_INCLUDE_DIRS})
target_compile_definitions(bless-controller-ipc PUBLIC
  COMPONENT_BLESS_CONTROLLER_IPC
)
target_link_libraries(bless-controller-ipc PUBLIC
  ${BLESS_LINK_LIBRARIES}
  ${BLESS_CONTROLLER_IPC_LINK_LIBRARIES}
)
