set(MBED_CELLULAR_DIR ${MBED_OS_DIR}/features/cellular)
set(MBED_CELLULAR_SOURCES
  ${MBED_CELLULAR_DIR}/framework/API/ATHandler.h
  ${MBED_CELLULAR_DIR}/framework/API/CellularContext.h
  ${MBED_CELLULAR_DIR}/framework/API/CellularDevice.h
  ${MBED_CELLULAR_DIR}/framework/API/CellularInformation.h
  ${MBED_CELLULAR_DIR}/framework/API/CellularNetwork.h
  ${MBED_CELLULAR_DIR}/framework/API/CellularSMS.h
  ${MBED_CELLULAR_DIR}/framework/AT/AT_CellularContext.h
  ${MBED_CELLULAR_DIR}/framework/AT/AT_CellularContext.cpp
  ${MBED_CELLULAR_DIR}/framework/AT/AT_CellularDevice.h
  ${MBED_CELLULAR_DIR}/framework/AT/AT_CellularDevice.cpp
  ${MBED_CELLULAR_DIR}/framework/AT/AT_CellularInformation.h
  ${MBED_CELLULAR_DIR}/framework/AT/AT_CellularInformation.cpp
  ${MBED_CELLULAR_DIR}/framework/AT/AT_CellularNetwork.h
  ${MBED_CELLULAR_DIR}/framework/AT/AT_CellularNetwork.cpp
  ${MBED_CELLULAR_DIR}/framework/AT/AT_CellularSMS.h
  ${MBED_CELLULAR_DIR}/framework/AT/AT_CellularSMS.cpp
  ${MBED_CELLULAR_DIR}/framework/AT/AT_CellularStack.h
  ${MBED_CELLULAR_DIR}/framework/AT/AT_CellularStack.cpp
  ${MBED_CELLULAR_DIR}/framework/AT/AT_ControlPlane_netif.h
  ${MBED_CELLULAR_DIR}/framework/AT/AT_ControlPlane_netif.cpp
  ${MBED_CELLULAR_DIR}/framework/common/APN_db.h
  ${MBED_CELLULAR_DIR}/framework/common/APN_db.cpp
  ${MBED_CELLULAR_DIR}/framework/common/CellularCommon.h
  ${MBED_CELLULAR_DIR}/framework/common/CellularList.h
  ${MBED_CELLULAR_DIR}/framework/common/CellularLog.h
  ${MBED_CELLULAR_DIR}/framework/common/CellularLog.cpp
  ${MBED_CELLULAR_DIR}/framework/common/CellularUtil.h
  ${MBED_CELLULAR_DIR}/framework/common/CellularUtil.cpp
  ${MBED_CELLULAR_DIR}/framework/device/ATHandler.cpp
  ${MBED_CELLULAR_DIR}/framework/device/CellularContext.cpp
  ${MBED_CELLULAR_DIR}/framework/device/CellularDevice.cpp
  ${MBED_CELLULAR_DIR}/framework/device/CellularStateMachine.h
  ${MBED_CELLULAR_DIR}/framework/device/CellularStateMachine.cpp
)
set(MBED_CELLULAR_INCLUDE_DIRS
  ${MBED_CELLULAR_DIR}/framework/API
  ${MBED_CELLULAR_DIR}/framework/AT
  ${MBED_CELLULAR_DIR}/framework/common
  ${MBED_CELLULAR_DIR}/framework/device
  ${MBED_OS_DIR}/features
  ${MBED_OS_DIR}/features/netsocket
)
set(MBED_CELLULAR_DEFINES
  # Use APN database lookup
  MBED_CONF_CELLULAR_USE_APN_LOOKUP=0

  # Enable or disable SMS functionality in Cellular stack.
  MBED_CONF_CELLULAR_USE_SMS=0

  # Maximum random delay value used in start-up sequence in milliseconds
  MBED_CONF_CELLULAR_RANDOM_MAX_START_DELAY=0

  # Enable AT debug prints.
  # Requires also mbed-trace to be enabled.
  # Note! This can have impact on UART performance and might need increasing of drivers.uart-serial-rxbuf-size
  # TODO: fix above comment to use CMake macro
  MBED_CONF_CELLULAR_DEBUG_AT=0

  # Radio access technology to use.
  # Value in integer: GSM=0, GSM_COMPACT=1, UTRAN=2, EGPRS=3, HSDPA=4, HSUPA=5, HSDPA_HSUPA=6, E_UTRAN=7, CATM1=8 ,NB1=9
  #MBED_CONF_CELLULAR_RADIO_ACCESS_TECHNOLOGY

  # Enables control plane CIoT EPS optimization
  MBED_CONF_CELLULAR_CONTROL_PLANE_OPT=0
  
  # Use modem IP stack for DNS queries, null or numeric simultaneous queries
  #MBED_CONF_CELLULAR_OFFLOAD_DNS_QUERIES

  # Clear modem to a known default state on connect() before SIM pin is entered, null to disable
  MBED_CONF_CELLULAR_MAX_CP_DATA_RECV_LEN=1358
)
set(MBED_CELLULAR_LINK_LIBRARIES
  mbed-rtos
  mbed-trace
  mbed-events
  mbed-client-randlib
)

add_library(mbed-cellular STATIC EXCLUDE_FROM_ALL ${MBED_CELLULAR_SOURCES})
target_include_directories(mbed-cellular PUBLIC ${MBED_CELLULAR_INCLUDE_DIRS})
target_compile_definitions(mbed-cellular PUBLIC ${MBED_CELLULAR_DEFINES})
target_link_libraries(mbed-cellular PUBLIC ${MBED_CELLULAR_LINK_LIBRARIES})
