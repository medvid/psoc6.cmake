set(MBED_NANOSTACK_LIBSERVICE_DIR ${MBED_OS_DIR}/features/frameworks/nanostack-libservice)
set(MBED_NANOSTACK_LIBSERVICE_SOURCES
  ${MBED_NANOSTACK_LIBSERVICE_DIR}/mbed-client-libservice/common_functions.h
  ${MBED_NANOSTACK_LIBSERVICE_DIR}/mbed-client-libservice/ip4string.h
  ${MBED_NANOSTACK_LIBSERVICE_DIR}/mbed-client-libservice/ip6string.h
  ${MBED_NANOSTACK_LIBSERVICE_DIR}/mbed-client-libservice/ip_fsc.h
  ${MBED_NANOSTACK_LIBSERVICE_DIR}/mbed-client-libservice/ns_list.h
  ${MBED_NANOSTACK_LIBSERVICE_DIR}/mbed-client-libservice/ns_nvm_helper.h
  ${MBED_NANOSTACK_LIBSERVICE_DIR}/mbed-client-libservice/ns_trace.h
  ${MBED_NANOSTACK_LIBSERVICE_DIR}/mbed-client-libservice/ns_types.h
  ${MBED_NANOSTACK_LIBSERVICE_DIR}/mbed-client-libservice/nsdynmemLIB.h
  ${MBED_NANOSTACK_LIBSERVICE_DIR}/mbed-client-libservice/platform/arm_hal_interrupt.h
  ${MBED_NANOSTACK_LIBSERVICE_DIR}/mbed-client-libservice/platform/arm_hal_nvm.h
  ${MBED_NANOSTACK_LIBSERVICE_DIR}/source/IPv6_fcf_lib/ip_fsc.c
  ${MBED_NANOSTACK_LIBSERVICE_DIR}/source/libBits/common_functions.c
  ${MBED_NANOSTACK_LIBSERVICE_DIR}/source/libList/ns_list.c
  ${MBED_NANOSTACK_LIBSERVICE_DIR}/source/libip4string/ip4tos.c
  ${MBED_NANOSTACK_LIBSERVICE_DIR}/source/libip4string/stoip4.c
  ${MBED_NANOSTACK_LIBSERVICE_DIR}/source/libip6string/ip6tos.c
  ${MBED_NANOSTACK_LIBSERVICE_DIR}/source/libip6string/stoip6.c
  ${MBED_NANOSTACK_LIBSERVICE_DIR}/source/nsdynmemLIB/nsdynmemLIB.c
  ${MBED_NANOSTACK_LIBSERVICE_DIR}/source/nvmHelper/ns_nvm_helper.c
)
set(MBED_NANOSTACK_LIBSERVICE_INCLUDE_DIRS
  ${MBED_NANOSTACK_LIBSERVICE_DIR}/mbed-client-libservice
  ${MBED_NANOSTACK_LIBSERVICE_DIR}/mbed-client-libservice/platform
)
set(MBED_NANOSTACK_LIBSERVICE_LINK_LIBRARIES
  mbed-trace
)

add_library(mbed-nanostack-libservice STATIC EXCLUDE_FROM_ALL ${MBED_NANOSTACK_LIBSERVICE_SOURCES})
target_include_directories(mbed-nanostack-libservice PUBLIC ${MBED_NANOSTACK_LIBSERVICE_INCLUDE_DIRS})
target_link_libraries(mbed-nanostack-libservice PUBLIC ${MBED_NANOSTACK_LIBSERVICE_LINK_LIBRARIES})
