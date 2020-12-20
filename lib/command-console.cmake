psoc6_load_library(
  NAME command-console
  VERSION 1.0.1
)

set(COMMAND_CONSOLE_SOURCES
  ${COMMAND_CONSOLE_DIR}/include/command_console.h
  ${COMMAND_CONSOLE_DIR}/source/command_console/command_console.c
  ${COMMAND_CONSOLE_DIR}/source/command_console/COMPONENT_PSOC6HAL/command_utility.h
  ${COMMAND_CONSOLE_DIR}/source/command_console/COMPONENT_PSOC6HAL/command_utility.cpp
  ${COMMAND_CONSOLE_DIR}/source/iperf/rtos/COMPONENT_SECURE_SOCKETS/condition.c
  ${COMMAND_CONSOLE_DIR}/source/iperf/rtos/COMPONENT_SECURE_SOCKETS/cy_iperf_rtc.h
  ${COMMAND_CONSOLE_DIR}/source/iperf/rtos/COMPONENT_SECURE_SOCKETS/cy_iperf_rtc.c
  ${COMMAND_CONSOLE_DIR}/source/iperf/rtos/COMPONENT_SECURE_SOCKETS/gettimeofday.c
  ${COMMAND_CONSOLE_DIR}/source/iperf/rtos/COMPONENT_SECURE_SOCKETS/iperf_debug.c
  ${COMMAND_CONSOLE_DIR}/source/iperf/rtos/COMPONENT_SECURE_SOCKETS/iperf_getopt_long.c
  ${COMMAND_CONSOLE_DIR}/source/iperf/rtos/COMPONENT_SECURE_SOCKETS/iperf_getopt.h
  ${COMMAND_CONSOLE_DIR}/source/iperf/rtos/COMPONENT_SECURE_SOCKETS/iperf_sockets.h
  ${COMMAND_CONSOLE_DIR}/source/iperf/rtos/COMPONENT_SECURE_SOCKETS/iperf_sockets.c
  ${COMMAND_CONSOLE_DIR}/source/iperf/rtos/COMPONENT_SECURE_SOCKETS/platform_wait_api.h
  ${COMMAND_CONSOLE_DIR}/source/iperf/rtos/COMPONENT_SECURE_SOCKETS/rtos_config.h
  ${COMMAND_CONSOLE_DIR}/source/iperf/rtos/COMPONENT_SECURE_SOCKETS/thread.c
  ${COMMAND_CONSOLE_DIR}/source/iperf/rtos/COMPONENT_SECURE_SOCKETS/usleep.c
  ${COMMAND_CONSOLE_DIR}/source/iperf_utility/iperf_utility.h
  ${COMMAND_CONSOLE_DIR}/source/iperf_utility/iperf_utility.cpp
  ${COMMAND_CONSOLE_DIR}/source/bluetooth_utility/COMPONENT_WICED_BLE/bt_cfg.h
  ${COMMAND_CONSOLE_DIR}/source/bluetooth_utility/COMPONENT_WICED_BLE/bt_cfg.c
  ${COMMAND_CONSOLE_DIR}/source/bluetooth_utility/COMPONENT_WICED_BLE/bt_utility.h
  ${COMMAND_CONSOLE_DIR}/source/bluetooth_utility/COMPONENT_WICED_BLE/bt_utility.c
  ${COMMAND_CONSOLE_DIR}/source/bluetooth_utility/COMPONENT_WICED_BLE/bt_utils.h
  ${COMMAND_CONSOLE_DIR}/source/bluetooth_utility/COMPONENT_WICED_BLE/bt_utils.c
)
set(COMMAND_CONSOLE_DEFINES
  ANYCLOUD
)
set(COMMAND_CONSOLE_INCLUDE_DIRS
  ${COMMAND_CONSOLE_DIR}/include
  ${COMMAND_CONSOLE_DIR}/source/command_console/COMPONENT_PSOC6HAL
  ${COMMAND_CONSOLE_DIR}/source/iperf/include
  ${COMMAND_CONSOLE_DIR}/source/iperf/rtos/COMPONENT_SECURE_SOCKETS
  ${COMMAND_CONSOLE_DIR}/source/iperf_utility
)
set(COMMAND_CONSOLE_LIBRARIES
  retarget-io
  wifi-mw-core
  lwip
  bluetooth-freertos
)

add_library(command-console STATIC ${COMMAND_CONSOLE_SOURCES})
target_compile_definitions(command-console PUBLIC ${COMMAND_CONSOLE_DEFINES})
target_include_directories(command-console PUBLIC ${COMMAND_CONSOLE_INCLUDE_DIRS})
target_link_libraries(command-console PUBLIC ${COMMAND_CONSOLE_LIBRARIES})
