# Copyright (C) 2020 Arm Mbed. All rights reserved.
# SPDX-License-Identifier: Apache-2.0

if(${TOOLCHAIN} STREQUAL GCC OR ${TOOLCHAIN} STREQUAL LLVM)
  set(MBED_TOOLCHAIN "GCC_ARM")
elseif(${TOOLCHAIN} STREQUAL ARM)
  set(MBED_TOOLCHAIN "ARM")
elseif(${TOOLCHAIN} STREQUAL IAR)
  set(MBED_TOOLCHAIN "IAR")
else()
  message(FATAL_ERROR "mbed-os: TOOLCHAIN ${TOOLCHAIN} is not supported.")
endif()
set(MBED_TARGET ${MBED_BSP_NAME})
if(${CORE} STREQUAL CM4)
  set(MBED_CPU_CORE "Cortex-M4F")
  list(APPEND MBED_TARGET_LABELS
    M4
    CM4
    MCU_PSOC6_M4
    CM0P_SLEEP
    RTOS_M4_M7
  )
elseif(${CORE} STREQUAL CM0P)
  set(MBED_CPU_CORE "Cortex-M0+")
  list(APPEND MBED_TARGET_LABELS
    M0
    CM0P
  )
else()
  message(FATAL_ERROR "mbed-os: CORE ${CORE} is not supported.")
endif()
set(MBED_C_LIB "std" CACHE STRING "")
set(MBED_PRINTF_LIB "minimal-printf" CACHE STRING "")

list(APPEND MBED_TARGET_SUPPORTED_C_LIBS
  std
  small
)

list(APPEND MBED_TARGET_SUPPORTED_APPLICATION_PROFILES
  full
  bare-metal
)

list(APPEND MBED_TARGET_LABELS
  CORTEX
  CORTEX_M
  Cypress
  PSOC6
  MCU_PSOC6
  MBED_PSA_SRV
  PSA
)

# target
set(MBED_TARGET_DEFINITIONS
  DEVICE_ANALOGIN=1
  #DEVICE_ANALOGOUT=1
  DEVICE_CRC=1
  DEVICE_FLASH=1
  DEVICE_I2C=1
  DEVICE_I2C_ASYNCH=1
  DEVICE_I2CSLAVE=1
  DEVICE_INTERRUPTIN=1
  DEVICE_LPTICKER=1
  DEVICE_PORTIN=1
  DEVICE_PORTOUT=1
  DEVICE_PORTINOUT=1
  DEVICE_PWMOUT=1
  DEVICE_QSPI=1
  DEVICE_RESET_REASON=1
  DEVICE_RTC=1
  DEVICE_SERIAL=1
  DEVICE_SERIAL_FC=1
  DEVICE_SERIAL_ASYNCH=1
  DEVICE_SLEEP=1
  DEVICE_SPI=1
  DEVICE_SPI_ASYNCH=1
  DEVICE_SPISLAVE=1
  DEVICE_STDIO_MESSAGES=1
  DEVICE_TRNG=1
  #DEVICE_USBDEVICE=1
  DEVICE_USTICKER=1
  DEVICE_WATCHDOG=1

  TARGET_RTOS_M4_M7
  TARGET_CORTEX
  TARGET_CORTEX_M
  TARGET_MCU_PSOC6
  TARGET_M4
  TARGET_MCU_PSOC6_M4
  TARGET_LIKE_CORTEX_M4

  TARGET_PSOC6
  TARGET_Cypress

  LPTICKER_DELAY_TICKS=3
  MBED_MPU_CUSTOM
  CY_USING_HAL
  MCU_PSOC6_M4
  MBEDTLS_CONFIG_HW_SUPPORT
  CY_RTOS_AWARE
  CYBSP_WIFI_CAPABLE
  MBED_TICKLESS=1
  TARGET_FF_ARDUINO
  TARGET_LIKE_MBED
  __MBED__=1
)

if(BLE IN_LIST COMPONENTS)
  list(APPEND MBED_TARGET_DEFINITIONS
    FEATURE_BLE=1
  )
endif()

# config
set(MBED_CONFIG_DEFINITIONS
  # options

  # The _PRESENT compile definitions are added in the library-specific
  # CMakeLists.txt - duplicated also here for the appication usage.
  MBED_CONF_RTOS_PRESENT=1
  MBED_CONF_RTOS_API_PRESENT=1
  MBED_CONF_EVENTS_PRESENT=1
  MBED_CONF_BLE_PRESENT=1
  MBED_CONF_NSAPI_PRESENT=1
  MBED_CONF_MBEDTLS_PRESENT=1
  MBED_CONF_LWIPSTACK_PRESENT=1

  # drivers/mbed_lib.json

  # Default TX buffer size for a BufferedSerial instance (unit Bytes))
  MBED_CONF_DRIVERS_UART_SERIAL_TXBUF_SIZE=256

  # Default RX buffer size for a BufferedSerial instance (unit Bytes))
  MBED_CONF_DRIVERS_UART_SERIAL_RXBUF_SIZE=256

  # Number of entries in each of MbedCRC's pre-computed software tables.
  # Higher values increase speed, but also increase image size.
  # The value has no effect if the target performs the CRC in hardware.
  # Permitted values are 0, 16 or 256.
  MBED_CRC_TABLE_SIZE=16

  # The maximum number of SPI peripherals used at the same time.
  # Determines RAM allocated for SPI peripheral management.
  # If null, limit determined by hardware.
  #MBED_CONF_DRIVERS_SPI_COUNT_MAX=

  # QSPI data I/O 0 pin
  MBED_CONF_DRIVERS_QSPI_IO0=QSPI_FLASH1_IO0

  # QSPI data I/O 1 pin
  MBED_CONF_DRIVERS_QSPI_IO1=QSPI_FLASH1_IO1

  # QSPI data I/O 2 pin
  MBED_CONF_DRIVERS_QSPI_IO2=QSPI_FLASH1_IO2

  # QSPI data I/O 3 pin
  MBED_CONF_DRIVERS_QSPI_IO3=QSPI_FLASH1_IO3

  # QSPI clock pin
  MBED_CONF_DRIVERS_QSPI_SCK=QSPI_FLASH1_SCK

  # QSPI chip select pin
  MBED_CONF_DRIVERS_QSPI_CSN=QSPI_FLASH1_CSN

  # OSPI data I/O 0 pin
  MBED_CONF_DRIVERS_OSPI_IO0=OSPI_FLASH1_IO0

  # OSPI data I/O 1 pin
  MBED_CONF_DRIVERS_OSPI_IO1=OSPI_FLASH1_IO1

  # OSPI data I/O 2 pin
  MBED_CONF_DRIVERS_OSPI_IO2=OSPI_FLASH1_IO2

  # OSPI data I/O 3 pin
  MBED_CONF_DRIVERS_OSPI_IO3=OSPI_FLASH1_IO3

  # OSPI data I/O 4 pin
  MBED_CONF_DRIVERS_OSPI_IO4=OSPI_FLASH1_IO4

  # OSPI data I/O 5 pin
  MBED_CONF_DRIVERS_OSPI_IO5=OSPI_FLASH1_IO5

  # OSPI data I/O 6 pin
  MBED_CONF_DRIVERS_OSPI_IO6=OSPI_FLASH1_IO6

  # OSPI data I/O 7 pin
  MBED_CONF_DRIVERS_OSPI_IO7=OSPI_FLASH1_IO7

  # OSPI clock pin
  MBED_CONF_DRIVERS_OSPI_SCK=OSPI_FLASH1_SCK

  # OSPI chip select pin
  MBED_CONF_DRIVERS_OSPI_CSN=OSPI_FLASH1_CSN

  # OSPI dqs pin
  MBED_CONF_DRIVERS_OSPI_DQS=OSPI_FLASH1_DQS


  # platform/mbed_lib.json

  # Enable conversion to standard newlines on stdin/stdout/stderr
  MBED_CONF_PLATFORM_STDIO_CONVERT_NEWLINES=1

  # Enable conversion to standard newlines on any tty FILE stream
  MBED_CONF_PLATFORM_STDIO_CONVERT_TTY_NEWLINES=1

  # (Applies if MBED_CONF_TARGET_CONSOLE_UART is true and
  # MBED_CONF_PLATFORM_STDIO_MINIMAL_CONSOLE_ONLY is false.)
  # Use BufferedSerial driver to obtain buffered serial I/O on stdin/stdout/stderr.
  # If false, unbuffered serial_getc and serial_putc are used directly.
  MBED_CONF_PLATFORM_STDIO_BUFFERED_SERIAL=0

  # (Ignores MBED_CONF_PLATFORM_STDIO_BUFFERED_SERIAL)
  # Creates a console for basic unbuffered I/O operations.
  # Enable if your application does not require file handles to access the serial interface.
  # The POSIX `fsync` function will always an error.
  MBED_CONF_PLATFORM_STDIO_MINIMAL_CONSOLE_ONLY=0

  # (Applies if MBED_CONF_TARGET_CONSOLE_UART is true.)
  # Baud rate for stdio
  MBED_CONF_PLATFORM_STDIO_BAUD_RATE=9600

  # Enable or disable the flush of standard I/O's at exit.
  MBED_CONF_PLATFORM_STDIO_FLUSH_AT_EXIT=1

  # Default baud rate for a serial object (if not specified in the constructor)
  MBED_CONF_PLATFORM_DEFAULT_SERIAL_BAUD_RATE=9600

  # Enable use of low power timer class for poll(). May cause missing events.
  MBED_CONF_PLATFORM_POLL_USE_LOWPOWER_TIMER=0

  # Enable for error history tracking.
  MBED_CONF_PLATFORM_ERROR_HIST_ENABLED=0

  # Set the number of most recent errors the system keeps in its history,
  # needs MBED_CONF_PLATFORM_ERROR_HIST_ENABLED set to 1 for this to work.
  MBED_CONF_PLATFORM_ERROR_HIST_SIZE=4

  # Enables capture of filename and line number as part of error context capture,
  # this works only for debug and develop builds.
  # On release builds, filename capture is always disabled
  MBED_CONF_PLATFORM_ERROR_FILENAME_CAPTURE_ENABLED=0

  # Reports all the threads in the system as part of error report.
  MBED_CONF_PLATFORM_ERROR_ALL_THREADS_INFO=0

  # Sets the maximum length of buffer used for capturing the filename in error context.
  # This needs MBED_CONF_PLATFORM_ERROR_FILENAME_CAPTURE_ENABLED feature.
  MBED_CONF_PLATFORM_MAX_ERROR_FILENAME_LEN=16

  # Enable tracing of each memory call by invoking a callback on each memory operation.
  # See mbed_mem_trace.h in the HAL API for more information
  #MBED_MEM_TRACING_ENABLED=

  # Set to 1 to enable all platform stats.
  # When enabled the functions mbed_stats_*_get returns non-zero data.
  # See mbed_stats.h for more information
  MBED_ALL_STATS_ENABLED

  # Set to 1 to enable system stats.
  # When enabled the function mbed_stats_sys_get returns non-zero data.
  # See mbed_stats.h for more information
  #MBED_SYS_STATS_ENABLED

  # Set to 1 to enable stack stats.
  # When enabled the functions mbed_stats_stack_get and mbed_stats_stack_get_each return non-zero data.
  # See mbed_stats.h for more information
  #MBED_STACK_STATS_ENABLED

  # Set to true to enable stack dump.
  #MBED_STACK_DUMP_ENABLED

  # Set to 1 to enable cpu stats.
  # When enabled the function mbed_stats_cpu_get returns non-zero data.
  # See mbed_stats.h for more information
  #MBED_CPU_STATS_ENABLED

  # Set to 1 to enable heap stats.
  # When enabled the function mbed_stats_heap_get returns non-zero data.
  # See mbed_stats.h for more information
  #MBED_HEAP_STATS_ENABLED

  # Set to 1 to enable thread stats.
  # When enabled the function mbed_stats_thread_get_each returns non-zero data.
  # See mbed_stats.h for more information
  #MBED_THREAD_STATS_ENABLED

  # The maximum CThunk objects used at the same time.
  # This must be greater than 0 and less 256
  MBED_CONF_PLATFORM_CTHUNK_COUNT_MAX=8

  # Enables support for non-trivial callable objects in Callback.
  # Can be disabled to save ROM if no-one is using non-trivial types.
  # Changing this value may cause incompatibility with pre-built binaries.
  # Choice not available with IAR, value forced to true.
  MBED_CONF_PLATFORM_CALLBACK_NONTRIVIAL=0

  # Enables support for comparing two Callbacks.
  # See notes on operator== for limitations.
  # Can be disabled to save ROM if not required.
  MBED_CONF_PLATFORM_CALLBACK_COMPARABLE=1

  # Enables crash context capture when the system enters a fatal error/crash.
  MBED_CONF_PLATFORM_CRASH_CAPTURE_ENABLED=0

  # Maximum number of auto reboots permitted when an error happens.
  MBED_CONF_PLATFORM_ERROR_REBOOT_MAX=1

  # Setting this to true enables auto-reboot on a fatal error.
  MBED_CONF_PLATFORM_FATAL_ERROR_AUTO_REBOOT_ENABLED=0

  # Use the MPU if available to fault execution from RAM and writes to ROM.
  # Can be disabled to reduce image size.
  MBED_CONF_PLATFORM_USE_MPU=1

  # Enable printing 64 bit integers when using minimal printf library
  MBED_CONF_PLATFORM_MINIMAL_PRINTF_ENABLE_64_BIT=1

  # Enable floating point printing when using minimal printf library
  MBED_CONF_PLATFORM_MINIMAL_PRINTF_ENABLE_FLOATING_POINT=0

  # Maximum number of decimals to be printed when using minimal printf library
  MBED_CONF_PLATFORM_MINIMAL_PRINTF_SET_FLOATING_POINT_MAX_DECIMALS=6


  # platform/mbed-trace/mbed_lib.json

  # Used to globally enable traces.
  #MBED_CONF_MBED_TRACE_ENABLE

  # This flag is used to optimize the code size.
  # For example, setting trace optimization level to TRACE_LEVEL_INFO
  # will define all tr_debug() macros empty, which reduces the binary size.
  # The possible optimization levels are:
  #  TRACE_LEVEL_DEBUG
  #  TRACE_LEVEL_INFO
  #  TRACE_LEVEL_WARN
  #  TRACE_LEVEL_ERROR
  #  TRACE_LEVEL_CMD
  # To set the output tracing level, please use mbed_trace_config_set(TRACE_ACTIVE_LEVEL_INFO).
  # The possible tracing levels for mbed_trace_config_set() are:
  #  TRACE_ACTIVE_LEVEL_ALL
  #  TRACE_ACTIVE_LEVEL_DEBUG (same as ALL)
  #  TRACE_ACTIVE_LEVEL_INFO
  #  TRACE_ACTIVE_LEVEL_WARN
  #  TRACE_ACTIVE_LEVEL_ERROR
  #  TRACE_ACTIVE_LEVEL_CMD
  #  TRACE_LEVEL_NONE
  #MBED_TRACE_MAX_LEVEL=

  # Used to globally disable ipv6 tracing features.
  #MBED_CONF_MBED_TRACE_FEA_IPV6=

  # Allocator function
  MEM_ALLOC=malloc

  # Dealloctor function
  MEM_FREE=free


  # targets/targets.json

  # Target has UART console on pins STDIO_UART_TX, STDIO_UART_RX.
  # Value is only significant if target has SERIAL device.
  MBED_CONF_TARGET_CONSOLE_UART=1

  # Console hardware flow control.
  # Options: null, RTS, CTS, RTSCTS.
  #MBED_CONF_TARGET_CONSOLE_UART_FLOW_CONTROL=

  # Default network interface type.
  # Typical options: null, ETHERNET, WIFI, CELLULAR, MESH
  MBED_CONF_TARGET_NETWORK_DEFAULT_INTERFACE_TYPE=WIFI

  # Time in ms required to go to and wake up from deep sleep (max 10)
  MBED_CONF_TARGET_DEEP_SLEEP_LATENCY=CY_CFG_PWR_DEEPSLEEP_LATENCY

  # Define the boot stack size in bytes. This value must be a multiple of 8
  MBED_CONF_TARGET_BOOT_STACK_SIZE=0x1000

  # Last address of ROM protected by the MPU
  MBED_CONF_TARGET_MPU_ROM_END=0x0fffffff

  # Run tickless from the microsecond ticker rather than the low power ticker.
  # Running tickless off of the microsecond ticker improves interrupt latency
  # on targets which use lpticker_delay_ticks
  MBED_CONF_TARGET_TICKLESS_FROM_US_TICKER=0

  # Initialize the microsecond ticker at boot rather than on first use,
  # and leave it initialized. This speeds up wait_us in particular.
  MBED_CONF_TARGET_INIT_US_TICKER_AT_BOOT=0

  # Support custom tickers in addition to USTICKER and LPTICKER.
  # Turning this off can permit some space and speed optimisations,
  # if characteristics of USTICKER and LPTICKER are known at compile time.
  MBED_CONF_TARGET_CUSTOM_TICKERS=1

  # Enable Execute In Place (XIP) on this target.
  # Value is only significant if the board has executable external storage such as QSPIF.
  # If this is enabled, customize the linker file to choose what text segments are placed on external storage
  MBED_CONF_TARGET_XIP_ENABLE=0

  # Default reference voltage for ADC (float)
  MBED_CONF_TARGET_DEFAULT_ADC_VREF=NAN

  # Target's internal flash has uniform sector sizes
  MBED_CONF_TARGET_INTERNAL_FLASH_UNIFORM_SECTORS=1


  # events/mbed_lib.json

  # Stack size (bytes) for shared event queue thread
  MBED_CONF_EVENTS_SHARED_STACKSIZE=2048

  # Event buffer size (bytes) for shared event queue
  MBED_CONF_EVENTS_SHARED_EVENTSIZE=768

  # No thread created for shared event queue - application will call dispatch
  # from another thread (eg dispatch_forever at end of main)
  MBED_CONF_EVENTS_SHARED_DISPATCH_FROM_APPLICATION=0

  # Stack size (bytes) for shared high-priority event queue thread
  MBED_CONF_EVENTS_SHARED_HIGHPRIO_STACKSIZE=1024

  # Event buffer size (bytes) for shared high-priority event queue
  MBED_CONF_EVENTS_SHARED_HIGHPRIO_EVENTSIZE=256

  # Enable use of low power timer and ticker classes in non-RTOS builds.
  # May reduce the accuracy of the event queue.
  # In RTOS builds, the RTOS tick count is used, and this configuration option has no effect.
  MBED_CONF_EVENTS_USE_LOWPOWER_TIMER_TICKER=0


  # connectivity/FEATURE_BLE/mbed_lib.json

  # Include observer BLE role support (scanning for and processing advertising packets).
  BLE_ROLE_OBSERVER=1

  # Include broadcaster BLE role support (sending advertising packets).
  BLE_ROLE_BROADCASTER=1

  # Include central BLE role support (initiates connections), depends on observer role.
  BLE_ROLE_CENTRAL=1

  # Include peripheral BLE role support (accepts connections), depends on broadcaster role.
  BLE_ROLE_PERIPHERAL=1

  # Include Gatt Client BLE role support (requests remote operations on attributes), depends on peripheral and central role.
  BLE_FEATURE_GATT_CLIENT=1

  # Include Gatt Server BLE role support (executes operations on stored attributes), depends on peripheral or central role.
  BLE_FEATURE_GATT_SERVER=1

  # Include security support (key management), depends on peripheral or central role.
  BLE_FEATURE_SECURITY=1

  # Include secure connections support, depends on the security feature.
  BLE_FEATURE_SECURE_CONNECTIONS=1

  # Include signing support (signed attribute writes), depends on the security feature.
  BLE_FEATURE_SIGNING=1

  # Include whitelist support (peer filtering), depends on the security feature.
  BLE_FEATURE_WHITELIST=1

  # Include privacy support (random resolvable addresses), depends on the security feature.
  BLE_FEATURE_PRIVACY=1

  # Additional PHY support (2M and Coded)
  BLE_FEATURE_PHY_MANAGEMENT=1

  # Include extended advertising support (advertising sets, secondary channels).
  BLE_FEATURE_EXTENDED_ADVERTISING=1

  # Include periodic advertising support, depends on the extended advertising feature.
  BLE_FEATURE_PERIODIC_ADVERTISING=1

  # Use filesystem to store security db when path is passed in, depends on security manager.
  BLE_SECURITY_DATABASE_FILESYSTEM=1

  # Use KVStore to store security db, depends on security manager.
  BLE_SECURITY_DATABASE_KVSTORE=0

  # How many entries can be stored in the db, depends on security manager.
  BLE_SECURITY_DATABASE_MAX_ENTRIES=5

  # How many advertising sets the API can handle (this limits how much the stack can handle).
  # Must be non-zero
  BLE_GAP_MAX_ADVERTISING_SETS=15

  # Perform address resolution on the host, not the controller.
  # Controller based privacy is preferred as it happens lower down
  # the stack but this can be used in case controller based privacy is unavailable.
  # If this is enabled the controller will not be used for privacy.
  BLE_GAP_HOST_BASED_PRIVATE_ADDRESS_RESOLUTION=1

  # How many advertising reports can be pending while awaiting private address resolution.
  # This is only used if host privacy is enabled and controller privacy is disabled.
  # Must be non-zero
  BLE_GAP_MAX_ADVERTISING_REPORTS_PENDING_ADDRESS_RESOLUTION=16

  # Used for host privacy. How many last resolved addresses to store to speed up resolution.
  # This is especially valuable for resolving advertising which creates repeated queries for the same address.
  BLE_GAP_HOST_PRIVACY_RESOLVED_CACHE_SIZE=16


  # connectivity/FEATURE_BLE/source/cordio/mbed_lib.json

  # Default milliseconds per tick rate
  WSF_MS_PER_TICK=1

  # Maximum number of connections
  DM_CONN_MAX=3

  # Maximum number of periodic advertising synchronizations
  DM_SYNC_MAX=1

  # Number of supported advertising sets: must be set to 1 for legacy advertising
  DM_NUM_ADV_SETS=3

  # Number of scanner and initiator PHYs (LE 1M, LE 2M and LE Coded):
  # must be set to 1 for legacy scanner and initiator
  DM_NUM_PHYS=3

  # Maximum number of connection oriented channels
  L2C_COC_CHAN_MAX=1

  # Maximum number of connection oriented channel registered clients
  L2C_COC_REG_MAX=1

  # Maximum number of simultaneous ATT write commands
  ATT_NUM_SIMUL_WRITE_CMD=1

  # Maximum number of simultaneous ATT notifications
  ATT_NUM_SIMUL_NTF=1

  # Max number of devices in the security database
  SMP_DB_MAX_DEVICES=3

  # Desired ATT_MTU, this needs to be between 23 and 517 (inclusive).
  # The effective ATT_MTU is limited by rx-acl-buffer-size (minus 4 bytes for the header).
  MBED_CONF_CORDIO_DESIRED_ATT_MTU=23

  # Size of the buffer holding the reassembled complete ACL packet.
  # This will limit the effective ATT_MTU (to its value minus 4 bytes for the header).
  # The size of the buffer must be small enough to be allocated from the existing cordio pool.
  # If this value is increased you may need to adjust the memory pool.
  MBED_CONF_CORDIO_RX_ACL_BUFFER_SIZE=70

  # Number of queued prepare writes supported by server.
  MBED_CONF_CORDIO_MAX_PREPARED_WRITES=4

  # Where the CBC MAC calculation is performed.
  # Valid values are 0 (host) and 1 (controller through HCI).
  SEC_CCM_CFG=1

  # If enabled the stack will forward to the user all HCI events not handled by the stack.
  MBED_CONF_CORDIO_ROUTE_UNHANDLED_COMMAND_COMPLETE_EVENTS=1

  # Preferred value of tx power in dbm (-128,127).
  # This value is not guaranteed and relies on existing support in the HCI driver.
  MBED_CONF_CORDIO_PREFERRED_TX_POWER=0

  # Maximum number of EATT channels per DM connection.
  EATT_CONN_CHAN_MAX=1


  # connectivity/FEATURE_BLE/source/generic/mbed_lib.json

  # Maximum count of characteristics that can be stored for authorisation purposes.
  MBED_CONF_BLE_API_IMPLEMENTATION_MAX_CHARACTERISTIC_AUTHORISATION_COUNT=20

  # Client characteristic configuration descriptors settings.
  MBED_CONF_BLE_API_IMPLEMENTATION_MAX_CCCD_COUNT=20


  # connectivity/cellular/mbed_lib.json

  # Use APN database lookup
  MBED_CONF_CELLULAR_USE_APN_LOOKUP=0

  # Enable or disable SMS functionality in Cellular stack.
  MBED_CONF_CELLULAR_USE_SMS=0

  # Maximum random delay value used in start-up sequence in seconds
  MBED_CONF_CELLULAR_RANDOM_MAX_START_DELAY=0

  # Enable AT debug prints. Requires also mbed-trace to be enabled.
  # Note! This can have impact on UART performance and might need
  # increasing of MBED_CONF_DRIVERS_UART_SERIAL_RXBUF_SIZE
  MBED_CONF_CELLULAR_DEBUG_AT=0

  # Radio access technology to use.
  # Value in integer: GSM=0, GSM_COMPACT=1, UTRAN=2, EGPRS=3,
  # HSDPA=4, HSUPA=5, HSDPA_HSUPA=6, E_UTRAN=7, CATM1=8 ,NB1=9
  #MBED_CONF_CELLULAR_RADIO_ACCESS_TECHNOLOGY=

  # Enables control plane CIoT EPS optimization
  MBED_CONF_CELLULAR_CONTROL_PLANE_OPT=0

  # Use modem IP stack for DNS queries, null or numeric simultaneous queries
  #MBED_CONF_CELLULAR_OFFLOAD_DNS_QUERIES=

  # Clear modem to a known default state on connect() before SIM pin is entered, null to disable
  #MBED_CONF_CELLULAR_CLEAR_ON_CONNECT

  # Max length of the buffer storing data received over control plane
  MBED_CONF_CELLULAR_MAX_CP_DATA_RECV_LEN=1358

  # If manual PLMN is selected, use mode 4 manual/automatic in AT+COPS
  # to try automatic mode if manual selection fails. Set to null to disable
  #MBED_CONF_CELLULAR_PLMN_FALLBACK_AUTO=


  # connectivity/drivers/802.15.4_RF/atmel-rf-driver/mbed_lib.json

  # SPI_MOSI pin configured for SPI connection.
  #MBED_CONF_ATMEL_RF_SPI_MOSI=

  # SPI_MISO pin configured for SPI connection.
  #MBED_CONF_ATMEL_RF_SPI_MISO=

  # SPI_SCLK pin configured for SPI connection.
  #MBED_CONF_ATMEL_RF_SPI_SCLK=

  # SPI_CS pin configured for SPI connection.
  #MBED_CONF_ATMEL_RF_SPI_CS=

  # SPI_RST pin configured for SPI connection.
  #MBED_CONF_ATMEL_RF_SPI_RST=

  # SPI_SLP pin configured for SPI connection.
  #MBED_CONF_ATMEL_RF_SPI_SLP=

  # SPI_IRQ pin configured for SPI connection.
  #MBED_CONF_ATMEL_RF_SPI_IRQ=

  # I2C_SDA pin configured for I2C connection.
  #MBED_CONF_ATMEL_RF_I2C_SDA=

  # I2C_SCL pin configured for I2C connection.
  #MBED_CONF_ATMEL_RF_I2C_SCL=

  # TEST_PIN_TX pin configured for TX.
  #MBED_CONF_ATMEL_RF_TEST_PIN_TX=

  # TEST_PIN_RX pin configured for RX.
  #MBED_CONF_ATMEL_RF_TEST_PIN_RX=

  # TEST_PIN_CSMA pin configured for CSMA.
  #MBED_CONF_ATMEL_RF_TEST_PIN_CSMA=

  # TEST_PIN_SPARE_1.
  #MBED_CONF_ATMEL_RF_TEST_PIN_SPARE_1=

  # TEST_PIN_SPARE_2.
  #MBED_CONF_ATMEL_RF_TEST_PIN_SPARE_2=

  # SE2435L_CSD pin configuration.
  #MBED_CONF_ATMEL_RF_SE2435L_CSD=

  # SE2435L_ANT_SEL pin confuguration.
  #MBED_CONF_ATMEL_RF_SE2435L_ANT_SEL=

  # Maximum SPI clock speed (Hz), as long as sufficient inter-byte spacing
  MBED_CONF_ATMEL_RF_FULL_SPI_SPEED=7500000

  # Required byte spacing in nanoseconds if full SPI speed is in use
  MBED_CONF_ATMEL_RF_FULL_SPI_SPEED_BYTE_SPACING=250

  # Maximum SPI clock speed (Hz) if no inter-byte spacing
  MBED_CONF_ATMEL_RF_LOW_SPI_SPEED=3750000

  # Use SPI spacing API proposed in https://github.com/ARMmbed/mbed-os/pull/5353
  # to ensure spacing between bytes - either run at full speed with spacing, or low with no spacing
  MBED_CONF_ATMEL_RF_USE_SPI_SPACING_API=0

  # If not using SPI spacing API, assume platform has widely-spaced bytes in bursts,
  # so use full clock speed rather than low.
  MBED_CONF_ATMEL_RF_ASSUME_SPACED_SPI=0

  # Provide default NanostackRfpy. [true/false]
  MBED_CONF_ATMEL_RF_PROVIDE_DEFAULT=0

  # The stack size of the Thread serving the Atmel RF interrupts
  MBED_CONF_ATMEL_RF_IRQ_THREAD_STACK_SIZE=1024


  # connectivity/drivers/802.15.4_RF/mcr20a-rf-driver/mbed_lib.json

  # Provide default NanostackRfpy. [true/false]
  MBED_CONF_MCR20A_PROVIDE_DEFAULT=0


  # connectivity/drivers/802.15.4_RF/stm-s2lp-rf-driver/mbed_lib.json

  # SPI_SDI pin for SPI connection. D11 assumed, needs to be set/overwritten otherwise
  #MBED_CONF_S2LP_SPI_SDI=D11

  # SPI_SDO pin for SPI connection. D12 assumed, needs to be set/overwritten otherwise
  #MBED_CONF_S2LP_SPI_SDO=D12

  # SPI_SCLK pin for SPI connection, D13 assumed, needs to be set/overwritten otherwise
  #MBED_CONF_S2LP_SPI_SCLK=D13

  # SPI_CS pin for SPI connection, A1 assumed, needs to be set/overwritten otherwise
  #MBED_CONF_S2LP_SPI_CS=A1

  # SPI_SDN pin for SPI connection, D7 assumed, needs to be set/overwritten otherwise
  #MBED_CONF_S2LP_SPI_SDN=D7

  # TEST_PIN_TX pin for serial connection, D6 assumed, needs to be set/overwritten otherwise
  #MBED_CONF_S2LP_TEST_PIN_TX=D6

  # TEST_PIN_RX pin for serial connection, D5 assumed, needs to be set/overwritten otherwise
  #MBED_CONF_S2LP_TEST_PIN_RX=D5

  # TEST_PIN_CSMA pin for CSMA, D4 assumed, needs to be set/overwritten otherwise
  #MBED_CONF_S2LP_TEST_PIN_CSMA=D4

  # TEST_PIN_SPARE_1 pin for testing, D2 assumed, needs to be set/overwritten otherwise
  #MBED_CONF_S2LP_TEST_PIN_SPARE_1=D2

  # TEST_PIN_SPARE_2 pin for testing, D8 assumed, needs to be set/overwritten otherwise
  #MBED_CONF_S2LP_TEST_PIN_SPARE_2=D8

  # SPI_GPIO0 pin for GPIO testing, A0 assumed, needs to be set/overwritten otherwise
  #MBED_CONF_S2LP_SPI_GPIO0=A0

  # SPI_GPIO1 pin for GPIO testing, A2 assumed, needs to be set/overwritten otherwise
  #MBED_CONF_S2LP_SPI_GPIO1=A2

  # SPI_GPIO2 pin for GPIO testing, A3 assumed, needs to be set/overwritten otherwise
  #MBED_CONF_S2LP_SPI_GPIO2=A3

  # SPI_GPIO3 pin for GPIO testing, A5 assumed, needs to be set/overwritten otherwise
  #MBED_CONF_S2LP_SPI_GPIO3=A5

  # I2C_SDA pin for I2C SDA, null assumed, needs to be set/overwritten otherwise
  #MBED_CONF_S2LP_I2C_SDA=

  # I2C_SCL pin for I2C SCL, null assumed, needs to be set/overwritten otherwise
  #MBED_CONF_S2LP_I2C_SCL=

  # Provide default NanostackRfpy. [true/false]
  MBED_CONF_S2LP_PROVIDE_DEFAULT=0


  # connectivity/drivers/cellular/Altair/ALT1250/PPP/mbed_lib.json

  # TX pin for serial connection.
  # D1 assumed if Arduino Form Factor, needs to be set/overwritten otherwise.
  #MBED_CONF_ALT1250_PPP_TX=D1

  # RX pin for serial connection.
  # D0 assumed if Arduino Form Factor, needs to be set/overwritten otherwise.
  #MBED_CONF_ALT1250_PPP_RX=D0

  # RTS pin for serial connection
  #MBED_CONF_ALT1250_PPP_RTS=

  # CTS pin for serial connection
  #MBED_CONF_ALT1250_PPP_CTS=

  # Reset control pin
  #MBED_CONF_ALT1250_PPP_RST=

  # Serial connection baud rate
  MBED_CONF_ALT1250_PPP_BAUDRATE=115200

  # Provide as default CellularDevice [true/false]
  MBED_CONF_ALT1250_PPP_PROVIDE_DEFAULT=0


  # connectivity/drivers/cellular/GEMALTO/CINTERION/mbed_lib.json

  # TX pin for serial connection.
  # D1 assumed if Arduino Form Factor, needs to be set/overwritten otherwise.
  #MBED_CONF_GEMALTO_CINTERION_TX=D1

  # RX pin for serial connection.
  # D0 assumed if Arduino Form Factor, needs to be set/overwritten otherwise.
  #MBED_CONF_GEMALTO_CINTERION_RX=D0

  # RTS pin for serial connection
  #MBED_CONF_GEMALTO_CINTERION_RTS=

  # CTS pin for serial connection
  #MBED_CONF_GEMALTO_CINTERION_CTS=

  # Serial connection baud rate
  MBED_CONF_GEMALTO_CINTERION_BAUDRATE=115200

  # Provide as default CellularDevice [true/false]
  MBED_CONF_GEMALTO_CINTERION_PROVIDE_DEFAULT=0


  # connectivity/drivers/cellular/GENERIC/GENERIC_AT3GPP/mbed_lib.json

  # TX pin for serial connection.
  # D1 assumed if Arduino Form Factor, needs to be set/overwritten otherwise.
  #MBED_CONF_GENERIC_AT3GPP_TX=D1

  # RX pin for serial connection.
  # D0 assumed if Arduino Form Factor, needs to be set/overwritten otherwise.
  #MBED_CONF_GENERIC_AT3GPP_RX=D0

  # RTS pin for serial connection
  #MBED_CONF_GENERIC_AT3GPP_RTS=

  # CTS pin for serial connection
  #MBED_CONF_GENERIC_AT3GPP_CTS=

  # Serial connection baud rate
  MBED_CONF_GENERIC_AT3GPP_BAUDRATE=115200

  # Provide as default CellularDevice [true/false]
  MBED_CONF_GENERIC_AT3GPP_PROVIDE_DEFAULT=0


  # connectivity/drivers/cellular/MultiTech/DragonflyNano/PPP/mbed_lib.json

  # TX pin for serial connection.
  # D1 assumed if Arduino Form Factor, needs to be set/overwritten otherwise.
  #MBED_CONF_SARA4_PPP_TX=D1

  # RX pin for serial connection.
  # D0 assumed if Arduino Form Factor, needs to be set/overwritten otherwise.
  #MBED_CONF_SARA4_PPP_RX=D0

  # RTS pin for serial connection
  #MBED_CONF_SARA4_PPP_RTS=

  # CTS pin for serial connection
  #MBED_CONF_SARA4_PPP_CTS=

  # Serial connection baud rate
  MBED_CONF_SARA4_PPP_BAUDRATE=115200

  # Provide as default CellularDevice [true/false]
  MBED_CONF_SARA4_PPP_PROVIDE_DEFAULT=0


  # connectivity/drivers/cellular/QUECTEL/BC95/mbed_lib.json

  # TX pin for serial connection.
  # D1 assumed if Arduino Form Factor, needs to be set/overwritten otherwise.
  #MBED_CONF_QUECTEL_BC95_TX=D1

  # RX pin for serial connection.
  # D0 assumed if Arduino Form Factor, needs to be set/overwritten otherwise.
  #MBED_CONF_QUECTEL_BC95_RX=D0

  # RTS pin for serial connection
  #MBED_CONF_QUECTEL_BC95_RTS=

  # CTS pin for serial connection
  #MBED_CONF_QUECTEL_BC95_CTS=

  # Serial connection baud rate
  MBED_CONF_QUECTEL_BC95_BAUDRATE=9600

  # Provide as default CellularDevice [true/false]
  MBED_CONF_QUECTEL_BC95_PROVIDE_DEFAULT=0


  # connectivity/drivers/cellular/QUECTEL/BG96/mbed_lib.json

  # TX pin for serial connection.
  # D1 assumed if Arduino Form Factor, needs to be set/overwritten otherwise.
  #MBED_CONF_QUECTEL_BG96_TX=D1

  # RX pin for serial connection.
  # D0 assumed if Arduino Form Factor, needs to be set/overwritten otherwise.
  #MBED_CONF_QUECTEL_BG96_RX=D0

  # RTS pin for serial connection
  #MBED_CONF_QUECTEL_BG96_RTS=

  # CTS pin for serial connection
  #MBED_CONF_QUECTEL_BG96_CTS=

  # Power control pin
  #MBED_CONF_QUECTEL_BG96_PWR=NC

  # Reset control pin
  #MBED_CONF_QUECTEL_BG96_RST=NC

  # Pin polarity, 1 = Active high, 0 = Active low
  #MBED_CONF_QUECTEL_BG96_POLARITY=1

  # Serial connection baud rate
  MBED_CONF_QUECTEL_BG96_BAUDRATE=115200

  # Provide as default CellularDevice [true/false]
  MBED_CONF_QUECTEL_BG96_PROVIDE_DEFAULT=0


  # connectivity/drivers/cellular/QUECTEL/EC2X/mbed_lib.json

  # TX pin for serial connection.
  # D1 assumed if Arduino Form Factor, needs to be set/overwritten otherwise.
  #MBED_CONF_QUECTEL_EC2X_TX=D1

  # RX pin for serial connection.
  # D0 assumed if Arduino Form Factor, needs to be set/overwritten otherwise.
  #MBED_CONF_QUECTEL_EC2X_RX=D0

  # RTS pin for serial connection
  #MBED_CONF_QUECTEL_EC2X_RTS=

  # CTS pin for serial connection
  #MBED_CONF_QUECTEL_EC2X_CTS=

  # Power control pin
  #MBED_CONF_QUECTEL_EC2X_PWR=NC

  # Reset control pin
  #MBED_CONF_QUECTEL_EC2X_RST=NC

  # Pin polarity, 1 = Active high, 0 = Active low
  #MBED_CONF_QUECTEL_EC2X_POLARITY=1

  # Serial connection baud rate
  MBED_CONF_QUECTEL_EC2X_BAUDRATE=115200

  # How long to wait for modem to start after reset (milliseconds)
  MBED_CONF_QUECTEL_EC2X_START_TIMEOUT=15000

  # Provide as default CellularDevice [true/false]
  MBED_CONF_QUECTEL_EC2X_PROVIDE_DEFAULT=0


  # connectivity/drivers/cellular/QUECTEL/M26/mbed_lib.json

  # TX pin for serial connection.
  # D1 assumed if Arduino Form Factor, needs to be set/overwritten otherwise.
  #MBED_CONF_QUECTEL_M26_TX=D1

  # RX pin for serial connection.
  # D0 assumed if Arduino Form Factor, needs to be set/overwritten otherwise.
  #MBED_CONF_QUECTEL_M26_RX=D0

  # RTS pin for serial connection
  #MBED_CONF_QUECTEL_M26_RTS=

  # CTS pin for serial connection
  #MBED_CONF_QUECTEL_M26_CTS=

  # Serial connection baud rate
  MBED_CONF_QUECTEL_M26_BAUDRATE=115200

  # Provide as default CellularDevice [true/false]
  MBED_CONF_QUECTEL_M26_PROVIDE_DEFAULT=0


  # connectivity/drivers/cellular/QUECTEL/UG96/mbed_lib.json

  # TX pin for serial connection.
  # D1 assumed if Arduino Form Factor, needs to be set/overwritten otherwise.
  #MBED_CONF_QUECTEL_UG96_TX=D1

  # RX pin for serial connection.
  # D0 assumed if Arduino Form Factor, needs to be set/overwritten otherwise.
  #MBED_CONF_QUECTEL_UG96_RX=D0

  # RTS pin for serial connection
  #MBED_CONF_QUECTEL_UG96_RTS=

  # CTS pin for serial connection
  #MBED_CONF_QUECTEL_UG96_CTS=

  # Serial connection baud rate
  MBED_CONF_QUECTEL_UG96_BAUDRATE=115200

  # Provide as default CellularDevice [true/false]
  MBED_CONF_QUECTEL_UG96_PROVIDE_DEFAULT=0


  # connectivity/drivers/cellular/RiotMicro/AT/mbed_lib.json

  # TX pin for serial connection.
  # D1 assumed if Arduino Form Factor, needs to be set/overwritten otherwise.
  #MBED_CONF_RM1000_AT_TX=D1

  # RX pin for serial connection.
  # D0 assumed if Arduino Form Factor, needs to be set/overwritten otherwise.
  #MBED_CONF_RM1000_AT_RX=D0

  # RTS pin for serial connection
  #MBED_CONF_RM1000_AT_RTS=

  # CTS pin for serial connection
  #MBED_CONF_RM1000_AT_CTS=

  # Serial connection baud rate
  MBED_CONF_RM1000_AT_BAUDRATE=230400

  # Provide as default CellularDevice [true/false]
  MBED_CONF_RM1000_AT_PROVIDE_DEFAULT=0


  # connectivity/drivers/cellular/TELIT/HE910/mbed_lib.json

  # TX pin for serial connection.
  # D1 assumed if Arduino Form Factor, needs to be set/overwritten otherwise.
  #MBED_CONF_TELIT_HE910_TX=D1

  # RX pin for serial connection.
  # D0 assumed if Arduino Form Factor, needs to be set/overwritten otherwise.
  #MBED_CONF_TELIT_HE910_RX=D0

  # RTS pin for serial connection
  #MBED_CONF_TELIT_HE910_RTS=

  # CTS pin for serial connection
  #MBED_CONF_TELIT_HE910_CTS=

  # Serial connection baud rate
  MBED_CONF_TELIT_HE910_BAUDRATE=115200

  # Provide as default CellularDevice [true/false]
  MBED_CONF_TELIT_HE910_PROVIDE_DEFAULT=0


  # connectivity/drivers/cellular/TELIT/ME310/mbed_lib.json

  # TX pin for serial connection.
  # D1 assumed if Arduino Form Factor, needs to be set/overwritten otherwise.
  #MBED_CONF_TELIT_ME310_TX=D1

  # RX pin for serial connection.
  # D0 assumed if Arduino Form Factor, needs to be set/overwritten otherwise.
  #MBED_CONF_TELIT_ME310_RX=D0

  # RTS pin for serial connection
  #MBED_CONF_TELIT_ME310_RTS=

  # CTS pin for serial connection
  #MBED_CONF_TELIT_ME310_CTS=

  # Power control pin
  #MBED_CONF_TELIT_ME310_PWR=NC

  # Pin polarity, 1 = Active high, 0 = Active low
  #MBED_CONF_TELIT_ME310_POLARITY=1

  # Serial connection baud rate
  MBED_CONF_TELIT_ME310_BAUDRATE=115200

  # Provide as default CellularDevice [true/false]
  MBED_CONF_TELIT_ME310_PROVIDE_DEFAULT=0


  # connectivity/drivers/cellular/TELIT/ME910/mbed_lib.json

  # TX pin for serial connection.
  # D1 assumed if Arduino Form Factor, needs to be set/overwritten otherwise.
  #MBED_CONF_TELIT_ME910_TX=D1

  # RX pin for serial connection.
  # D0 assumed if Arduino Form Factor, needs to be set/overwritten otherwise.
  #MBED_CONF_TELIT_ME910_RX=D0

  # RTS pin for serial connection
  #MBED_CONF_TELIT_ME910_RTS=

  # CTS pin for serial connection
  #MBED_CONF_TELIT_ME910_CTS=

  # Power control pin
  #MBED_CONF_TELIT_ME910_PWR=NC

  # Pin polarity, 1 = Active high, 0 = Active low
  #MBED_CONF_TELIT_ME910_POLARITY=1

  # Serial connection baud rate
  MBED_CONF_TELIT_ME910_BAUDRATE=115200

  # Provide as default CellularDevice [true/false]
  MBED_CONF_TELIT_ME910_PROVIDE_DEFAULT=0


  # connectivity/drivers/cellular/UBLOX/AT/mbed_lib.json

  # TX pin for serial connection.
  # D1 assumed if Arduino Form Factor, needs to be set/overwritten otherwise.
  #MBED_CONF_UBLOX_AT_TX=D1

  # RX pin for serial connection.
  # D0 assumed if Arduino Form Factor, needs to be set/overwritten otherwise.
  #MBED_CONF_UBLOX_AT_RX=D0

  # RTS pin for serial connection
  #MBED_CONF_UBLOX_AT_RTS=

  # CTS pin for serial connection
  #MBED_CONF_UBLOX_AT_CTS=

  # Serial connection baud rate
  MBED_CONF_UBLOX_AT_BAUDRATE=115200

  # Provide as default CellularDevice [true/false]
  MBED_CONF_UBLOX_AT_PROVIDE_DEFAULT=0

  # connectivity/drivers/cellular/UBLOX/AT/mbed_lib.json

  # TX pin for serial connection.
  # D1 assumed if Arduino Form Factor, needs to be set/overwritten otherwise.
  #MBED_CONF_UBLOX_AT_TX=D1

  # RX pin for serial connection.
  # D0 assumed if Arduino Form Factor, needs to be set/overwritten otherwise.
  #MBED_CONF_UBLOX_AT_RX=D0

  # RTS pin for serial connection
  #MBED_CONF_UBLOX_AT_RTS=

  # CTS pin for serial connection
  #MBED_CONF_UBLOX_AT_CTS=

  # Serial connection baud rate
  MBED_CONF_UBLOX_AT_BAUDRATE=115200

  # Provide as default CellularDevice [true/false]
  MBED_CONF_UBLOX_AT_PROVIDE_DEFAULT=0


  # connectivity/drivers/cellular/UBLOX/N2XX/mbed_lib.json

  # TX pin for serial connection.
  # D1 assumed if Arduino Form Factor, needs to be set/overwritten otherwise.
  #MBED_CONF_UBLOX_N2XX_TX=D1

  # RX pin for serial connection.
  # D0 assumed if Arduino Form Factor, needs to be set/overwritten otherwise.
  #MBED_CONF_UBLOX_N2XX_RX=D0

  # RTS pin for serial connection
  #MBED_CONF_UBLOX_N2XX_RTS=

  # CTS pin for serial connection
  #MBED_CONF_UBLOX_N2XX_CTS=

  # Serial connection baud rate
  MBED_CONF_UBLOX_N2XX_BAUDRATE=9600

  # Provide as default CellularDevice [true/false]
  MBED_CONF_UBLOX_N2XX_PROVIDE_DEFAULT=0


  # connectivity/drivers/cellular/UBLOX/PPP/mbed_lib.json

  # TX pin for serial connection.
  # D1 assumed if Arduino Form Factor, needs to be set/overwritten otherwise.
  #MBED_CONF_UBLOX_PPP_TX=D1

  # RX pin for serial connection.
  # D0 assumed if Arduino Form Factor, needs to be set/overwritten otherwise.
  #MBED_CONF_UBLOX_PPP_RX=D0

  # RTS pin for serial connection
  #MBED_CONF_UBLOX_PPP_RTS=

  # CTS pin for serial connection
  #MBED_CONF_UBLOX_PPP_CTS=

  # Serial connection baud rate
  MBED_CONF_UBLOX_PPP_BAUDRATE=115200

  # Provide as default CellularDevice [true/false]
  MBED_CONF_UBLOX_PPP_PROVIDE_DEFAULT=0


  # connectivity/drivers/wifi/esp8266-driver/mbed_lib.json

  # TX pin for serial connection.
  # D1 assumed if Arduino Form Factor, needs to be set/overwritten otherwise
  #MBED_CONF_ESP8266_TX=D1

  # RX pin for serial connection.
  # D0 assumed if Arduino Form Factor, needs to be set/overwritten otherwise
  #MBED_CONF_ESP8266_RX=D0

  # RTS pin for serial connection, defaults to Not Connected
  #MBED_CONF_ESP8266_RTS=NC

  # CTS pin for serial connection, defaults to Not Connected
  #MBED_CONF_ESP8266_CTS=NC

  # Serial baudrate for ESP8266, defaults to 115200
  MBED_CONF_ESP8266_SERIAL_BAUDRATE=115200

  # RESET pin for the modem, defaults to Not Connected
  #MBED_CONF_ESP8266_RST=NC

  # POWER pin for the modem, defaults to Not Connected
  #MBED_CONF_ESP8266_PWR=NC

  # Polarity of power-on for the modem.
  # 0 means 0/1 for power on/off; 1 means 1/0 for power on/off.
  MBED_CONF_ESP8266_POWER_ON_POLARITY=0

  # Delay after powering on the modem in ms
  MBED_CONF_ESP8266_POWER_ON_TIME_MS=3

  # Delay after powering off the modem in ms
  MBED_CONF_ESP8266_POWER_OFF_TIME_MS=3

  # Enable debug logs. [true/false]
  MBED_CONF_ESP8266_DEBUG=0

  # Provide default WifiInterface. [true/false]
  MBED_CONF_ESP8266_PROVIDE_DEFAULT=0

  # Max socket data heap usage
  MBED_CONF_ESP8266_SOCKET_BUFSIZE=8192

  # ISO 3166-1 coded, 2 character alphanumeric country code, 'CN' by default
  #MBED_CONF_ESP8266_COUNTRY_CODE="CN"

  # The channel number to start at, 1 by default
  #MBED_CONF_ESP8266_CHANNEL_START=1

  # Channel count, 13 by default
  #MBED_CONF_ESP8266_CHANNELS=13

  # use built-in CIPDOMAIN AT command to resolve address to IP
  MBED_CONF_ESP8266_BUILT_IN_DNS=0

  # Enable SNTP. This allows application to use get_sntp_time().
  # Only available from ESP8266 AT v1.5.
  # This driver supports v1.7 and higher.
  MBED_CONF_ESP8266_SNTP_ENABLE=0

  # SNTP timezone
  MBED_CONF_ESP8266_SNTP_TIMEZONE=0

  # First SNTP server. Empty string will let ESP8266 use its default.
  MBED_CONF_ESP8266_SNTP_SERVER0=\"\"

  # Second SNTP server. Empty string will let ESP8266 use its default.
  MBED_CONF_ESP8266_SNTP_SERVER1=\"\"

  # Third SNTP server. Empty string will let ESP8266 use its default.
  MBED_CONF_ESP8266_SNTP_SERVER2=\"\"


  # connectivity/libraries/ppp/mbed_lib.json

  #NSAPI_PPP_AVAILABLE=(MBED_CONF_PPP_ENABLED || MBED_CONF_LWIP_PPP_ENABLED)

  # Enable support for PPP interfaces
  MBED_CONF_PPP_ENABLED=0

  # Enable support for ipv4 PPP interface
  MBED_CONF_PPP_IPV4_ENABLED=1

  # Enable support for ipv6 PPP interface
  MBED_CONF_PPP_IPV6_ENABLED=0

  # Enable debug traces for PPP
  PPP_DEBUG=0

  # Enable PPP packet traces (traces every outbound and inbound packet)
  MBED_CONF_PPP_ENABLE_TRACE=0

  # Thread stack size for PPP
  MBED_CONF_PPP_THREAD_STACKSIZE=896

  # Use mbed event queue instead of PPP thread
  MBED_CONF_PPP_MBED_EVENT_QUEUE=0


  # connectivity/lorawan/mbed_lib.json

  # LoRa PHY region: EU868, AS923, AU915, CN470, CN779, EU433, IN865, KR920, US915
  MBED_CONF_LORA_PHY=EU868

  # When set to 1 the application uses the Over-the-Air activation procedure,
  # default: true
  MBED_CONF_LORA_OVER_THE_AIR_ACTIVATION=1

  # Indicates how many times join can be tried, default: 12
  MBED_CONF_LORA_NB_TRIALS=12

  # Mote device IEEE EUI
  "MBED_CONF_LORA_DEVICE_EUI={0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00}"

  # Application IEEE EUI
  "MBED_CONF_LORA_APPLICATION_EUI={0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00}"

  # AES encryption/decryption cipher application key
  "MBED_CONF_LORA_APPLICATION_KEY={0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00}"

  # Device address on the network
  MBED_CONF_LORA_DEVICE_ADDRESS=0x00000000

  # AES encryption/decryption cipher network session key
  "MBED_CONF_LORA_NWKSKEY={0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00}"

  # AES encryption/decryption cipher application session key
  "MBED_CONF_LORA_APPSKEY={0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00}"

  # LoRaWAN application port, default: 15
  MBED_CONF_LORA_APP_PORT=15

  # User application data buffer maximum size, default: 64, MAX: 255
  MBED_CONF_LORA_TX_MAX_SIZE=64

  # LoRaWAN Adaptive Data Rate, default: 1
  MBED_CONF_LORA_ADR_ON=1

  # LoRaWAN will connect to a public network or private network,
  # true = public network
  MBED_CONF_LORA_PUBLIC_NETWORK=1

  # Enables/disables duty cycling.
  # NOTE: Disable only for testing. Mandatory in many regions.
  MBED_CONF_LORA_DUTY_CYCLE_ON=1

  # Enables/disables duty cycling for JOIN requests
  # (disabling requires duty-cycle-on to be disabled).
  # NOTE: Disable only for testing!
  MBED_CONF_LORA_DUTY_CYCLE_ON_JOIN=1

  # Enables/disables LBT. NOTE: [This feature is not yet integrated].
  MBED_CONF_LORA_LBT_ON=0

  # Stack will automatically send an uplink message
  # when lora server requires immediate response
  MBED_CONF_LORA_AUTOMATIC_UPLINK_MESSAGE=1

  # Max. timing error fudge. The receiver will turn on in [-RxError : + RxError]
  MBED_CONF_LORA_MAX_SYS_RX_ERROR=5

  # Time in (ms) the platform takes to wakeup from sleep/deep sleep state.
  # This number is platform dependent
  MBED_CONF_LORA_WAKEUP_TIME=5

  # Number of whole preamble symbols needed to have a firm lock on the signal.
  MBED_CONF_LORA_DOWNLINK_PREAMBLE_LENGTH=5

  # Number of preamble symbols to transmit. Default: 8
  MBED_CONF_LORA_UPLINK_PREAMBLE_LENGTH=8

  # FSB mask for upstream [Only for US915 & AU915]
  # Check lorawan/FSB_Usage.txt for more details
  "MBED_CONF_LORA_FSB_MASK={0xFFFF, 0xFFFF, 0xFFFF, 0xFFFF, 0x00FF}"

  # FSB mask for upstream [CN470 PHY]
  # Check lorawan/FSB_Usage.txt for more details
  "MBED_CONF_LORA_FSB_MASK_CHINA={0xFFFF, 0xFFFF, 0xFFFF, 0xFFFF, 0xFFFF, 0xFFFF}"


  # connectivity/lwipstack/mbed_lib.json

  # TODO
  MBED_CONF_LWIP_PRESENT=1

  # Enable IPv4
  MBED_CONF_LWIP_IPV4_ENABLED=1

  # Enable IPv6
  MBED_CONF_LWIP_IPV6_ENABLED=0

  # On dual-stack system the preferred stack: 4 for IPv4 and 6 for IPv6
  MBED_CONF_LWIP_IP_VER_PREF=4

  # On dual-stack system how long to additionally wait for other stack's address in seconds
  MBED_CONF_LWIP_ADDR_TIMEOUT=5

  # Address timeout mode;
  # true: wait both stack's addresses;
  # false: wait for preferred stack's address
  MBED_CONF_LWIP_ADDR_TIMEOUT_MODE=1

  # DHCP timeout value
  MBED_CONF_LWIP_DHCP_TIMEOUT=60

  # Enable support for Ethernet interfaces
  MBED_CONF_LWIP_ETHERNET_ENABLED=1

  # Enable support for L3IP interfaces
  MBED_CONF_LWIP_L3IP_ENABLED=0

  # Enable debug trace support
  MBED_CONF_LWIP_DEBUG_ENABLED=0

  # Enable support for PPP interfaces (obsolete: use netsocket/ppp configuration instead)
  MBED_CONF_LWIP_PPP_ENABLED=0

  # Enable support for ipv4 PPP interface (obsolete: use netsocket/ppp configuration instead)
  MBED_CONF_LWIP_PPP_IPV4_ENABLED=0

  # Enable support for ipv6 PPP interface (obsolete: use netsocket/ppp configuration instead)
  MBED_CONF_LWIP_PPP_IPV6_ENABLED=0

  # Use mbed trace for debug, rather than printf
  MBED_CONF_LWIP_USE_MBED_TRACE=0

  # Enable trace support for PPP interfaces (obsolete: use netsocket/ppp configuration instead)
  MBED_CONF_LWIP_ENABLE_PPP_TRACE=0

  # Maximum number of open TCPSocket and UDPSocket instances allowed,
  # including one used internally for DNS.
  # Each requires 236 bytes of pre-allocated RAM
  MBED_CONF_LWIP_SOCKET_MAX=18

  # Enable TCP
  MBED_CONF_LWIP_TCP_ENABLED=1

  # Maximum number of open TCP server instances allowed.
  # Each requires 72 bytes of pre-allocated RAM
  MBED_CONF_LWIP_TCP_SERVER_MAX=4

  # Maximum number of open TCPSocket instances allowed.
  # Each requires 196 bytes of pre-allocated RAM
  MBED_CONF_LWIP_TCP_SOCKET_MAX=10

  # Maximum number of open UDPSocket instances allowed,
  # including one used internally for DNS.
  # Each requires 84 bytes of pre-allocated RAM
  MBED_CONF_LWIP_UDP_SOCKET_MAX=10

  # Number of simultaneously queued TCP segments, see LWIP opt.h for more information.
  # Current default is 16, customized to 24 for PSoC 6 targets.
  MBED_CONF_LWIP_MEMP_NUM_TCP_SEG=24

  # Number of simultaneously queued TCP messages that are received
  MBED_CONF_LWIP_MEMP_NUM_TCPIP_MSG_INPKT=8

  # TCP Maximum segment size, see LWIP opt.h for more information.
  # Current default is 536, customized to 1540 for PSoC 6 targets.
  MBED_CONF_LWIP_TCP_MSS=1540

  # Mailbox size
  MBED_CONF_LWIP_MBOX_SIZE=8

  # TCP sender buffer space (bytes), see LWIP's opt.h for more information.
  # Current default is (2 * TCP_MSS), customized to (6 * TCP_MSS) for PSoC 6 targets.
  MBED_CONF_LWIP_TCP_SND_BUF=6*TCP_MSS

  # TCP sender buffer space (bytes), see LWIP's opt.h for more information.
  # Current default is (4 * TCP_MSS), customized to (6 * TCP_MSS) for PSoC 6 targets.
  MBED_CONF_LWIP_TCP_WND=6*TCP_MSS

  # Maximum number of retransmissions of data segments, see LWIP's opt.h for more information.
  # Current default is 6.
  MBED_CONF_LWIP_TCP_MAXRTX=6

  # Maximum number of retransmissions of SYN segments, see LWIP's opt.h for more information.
  # Current default is 6.
  MBED_CONF_LWIP_TCP_SYNMAXRTX=6

  # Maximum timeout (ms) for TCP close handshaking timeout
  MBED_CONF_LWIP_TCP_CLOSE_TIMEOUT=1000

  # Priority of lwip TCPIP thread
  MBED_CONF_LWIP_TCPIP_THREAD_PRIORITY=osPriorityNormal

  # Number of pbufs in pool - usually used for received packets,
  # so this determines how much data can be buffered between reception
  # and the application reading, see LWIP's opt.h for more information.
  # If a driver uses PBUF_RAM for reception, less pool may be needed.
  # Current default is 5, customized to 14 for PSoC 6 targets.
  MBED_CONF_LWIP_PBUF_POOL_SIZE=14

  # Size of pbufs in pool, see LWIP's opt.h for more information.
  #MBED_CONF_LWIP_PBUF_POOL_BUFSIZE

  # Size of heap (bytes) - used for outgoing packets,
  # and also used by some drivers for reception,
  # see LWIP's opt.h for more information.
  # Current default is 1600, customized to 65536 for PSoC 6 targets.
  MBED_CONF_LWIP_MEM_SIZE=65536

  # Stack size for lwip TCPIP thread
  MBED_CONF_LWIP_TCPIP_THREAD_STACKSIZE=8192

  # Stack size for lwip system threads
  MBED_CONF_LWIP_DEFAULT_THREAD_STACKSIZE=640

  # Thread stack size for PPP (obsolete: use netsocket/ppp configuration instead)
  MBED_CONF_LWIP_PPP_THREAD_STACKSIZE=768

  # Number of non-pool pbufs, each needs 92 bytes of RAM, see LWIP's opt.h for more information.
  # Current default is 8.
  MBED_CONF_LWIP_NUM_PBUF=8

  # Number of netbufs, each netbuf requires 64 bytes of RAM, see LWIP's opt.h for more information.
  # Current default is 8.
  MBED_CONF_LWIP_NUM_NETBUF=8

  # Enable lwip raw sockets, required for Mbed OS ICMPSocket
  MBED_CONF_LWIP_RAW_SOCKET_ENABLED=0


  # connectivity/nanostack/mbed-mesh-api/mbed_lib.json

  # Nanostack's heap size [bytes: 0-4294967295]
  MBED_CONF_MBED_MESH_API_HEAP_SIZE=32500

  # Number of devices stored to the SW MAC neighbour table
  MBED_CONF_MBED_MESH_API_MAC_NEIGH_TABLE_SIZE=32

  # Use `malloc()` for reserving the Nanostack's internal heap.
  MBED_CONF_MBED_MESH_API_USE_MALLOC_FOR_HEAP=0

  # Pointer to heap statistics `mem_stat_t` storage.
  MBED_CONF_MBED_MESH_API_HEAP_STAT_INFO=NULL

  # Definition of heap statistics `mem_stat_t` storage.
  #MBED_CONF_MBED_MESH_API_HEAP_STAT_INFO_DEFINITION=

  # Channel mask, bit-mask of channels to use. [0-0x07fff800]
  MBED_CONF_MBED_MESH_API_6LOWPAN_ND_CHANNEL_MASK=0x7fff800

  # 0 for 2.4 GHz and 2 for sub-GHz radios.
  MBED_CONF_MBED_MESH_API_6LOWPAN_ND_CHANNEL_PAGE=0

  # RF channel to use when `channel_mask` is not defined. [0-26].
  MBED_CONF_MBED_MESH_API_6LOWPAN_ND_CHANNEL=0

  # Beacon PAN ID filter, 0xffff means no filtering. [0-0xffff]
  MBED_CONF_MBED_MESH_API_6LOWPAN_ND_PANID_FILTER=0xffff

  # NONE or PSK to use either no security, or pre-shared network key.
  MBED_CONF_MBED_MESH_API_6LOWPAN_ND_SECURITY_MODE=NONE

  # PSK key ID when PSK is enabled.
  MBED_CONF_MBED_MESH_API_6LOWPAN_ND_PSK_KEY_ID=1

  # Pre-shared network key. Byte array of 16 bytes. In form of: {0x00, 0x11, ... 0xff}
  "MBED_CONF_MBED_MESH_API_6LOWPAN_ND_PSK_KEY={0xa0, 0xa1, 0xa2, 0xa3, 0xa4, 0xa5, 0xa6, 0xa7, 0xa8, 0xa9, 0xaa, 0xab, 0xac, 0xad, 0xae, 0xaf}"

  # Network security level (1-7). Use default `5`.
  MBED_CONF_MBED_MESH_API_6LOWPAN_ND_SEC_LEVEL=5

  # Device mode (NET_6LOWPAN_ROUTER or NET_6LOWPAN_HOST). Router is routing packets from other device, creating a mesh network.
  MBED_CONF_MBED_MESH_API_6LOWPAN_ND_DEVICE_TYPE=NET_6LOWPAN_ROUTER

  # Human-scaled commissioning credentials. Uppercase alphanumeric string (0-9, A-Y excluding I, O, Q and Z), 6-32 characters.
  MBED_CONF_MBED_MESH_API_THREAD_PSKD=\"ABCDEFGH\"

  # True: Use the below link config, False: Use commissioning, ignore the below link config.
  MBED_CONF_MBED_MESH_API_THREAD_USE_STATIC_LINK_CONFIG=1

  # Channel bit mask, 0x7ffff800 scans all channels. [0-0x07fff800]
  MBED_CONF_MBED_MESH_API_THREAD_CONFIG_CHANNEL_MASK=0x7fff800

  # Channel page, 0 for 2.4 GHz radio.
  MBED_CONF_MBED_MESH_API_THREAD_CONFIG_CHANNEL_PAGE=0

  # RF channel to use. [11-26]
  MBED_CONF_MBED_MESH_API_THREAD_CONFIG_CHANNEL=22

  # Network identifier [0-0xFFFF]
  MBED_CONF_MBED_MESH_API_THREAD_CONFIG_PANID=0x0700

  # Network name [string, max 16 characters]
  "MBED_CONF_MBED_MESH_API_THREAD_CONFIG_NETWORK_NAME=\"Thread Network\""

  # [48 bit timestamp seconds]-[15 bit timestamp ticks]-[U bit] (0-0xFFFFFFFFFFFFFFFF)
  MBED_CONF_MBED_MESH_API_THREAD_CONFIG_COMMISSIONING_DATASET_TIMESTAMP=0x10000

  # Extended PAN ID. [8 byte array]
  "MBED_CONF_MBED_MESH_API_THREAD_CONFIG_EXTENDED_PANID={0xf1, 0xb5, 0xa1, 0xb2,0xc4, 0xd5, 0xa1, 0xbd }"

  # Network master key. [16 byte array]
  "MBED_CONF_MBED_MESH_API_THREAD_MASTER_KEY={0x10, 0x11, 0x22, 0x33, 0x44, 0x55, 0x66, 0x77, 0x88, 0x99, 0xaa, 0xbb, 0xcc, 0xdd, 0xee, 0xff}"

  # Mesh Local prefix. [8 byte array]
  "MBED_CONF_MBED_MESH_API_THREAD_CONFIG_ML_PREFIX={0xfd, 0x0, 0x0d, 0xb8, 0x0, 0x0, 0x0, 0x0}"

  # Pre-Shared Key for the Commissioner. [16 byte array]
  "MBED_CONF_MBED_MESH_API_THREAD_CONFIG_PSKC={0xc8, 0xa6, 0x2e, 0xae, 0xf3, 0x68, 0xf3, 0x46, 0xa9, 0x9e, 0x57, 0x85, 0x98, 0x9d, 0x1c, 0xd0}"

  # Supported device operating modes:
  # MESH_DEVICE_TYPE_THREAD_ROUTER
  # MESH_DEVICE_TYPE_THREAD_SLEEPY_END_DEVICE
  # MESH_DEVICE_TYPE_THREAD_MINIMAL_END_DEVICE
  MBED_CONF_MBED_MESH_API_THREAD_DEVICE_TYPE=MESH_DEVICE_TYPE_THREAD_ROUTER

  # Commissioning security policy bits [0-0xFF]
  MBED_CONF_MBED_MESH_API_THREAD_SECURITY_POLICY=255

  # Network name for a wisun network. Maximum network name length can be 32 ASCII characters excluding terminating 0
  "MBED_CONF_MBED_MESH_API_WISUN_NETWORK_NAME=\"Wi-SUN Network\""

  # Expected amount of devices in the network as 100s of devices.
  # with possible pre defined constants NETWORK_SIZE_SMALL, NETWORK_SIZE_MEDIUM, NETWORK_SIZE_LARGE, NETWORK_SIZE_XLARGE.
  # if set to 0 Wi-SUN Certification configuration values are used.
  # If don't define this(default null), then NETWORK_SIZE_MEDIUM will be used.
  #MBED_CONF_MBED_MESH_API_WISUN_NETWORK_SIZE=

  # Regulator domain value as specified in the Wi-SUN PHY Specification.
  # Default value 3 is for EU region.
  MBED_CONF_MBED_MESH_API_WISUN_REGULATORY_DOMAIN=3

  # Operating class for the regulatory-domain as specified in the Wi-SUN PHY Specification.
  # Wi-SUN stack uses operating-class suitable for EU-region if value 255 is used.
  MBED_CONF_MBED_MESH_API_WISUN_OPERATING_CLASS=255

  # Operating mode as specified in the Wi-SUN PHY Specification.
  # Wi-SUN stack uses operating-mode suitable for EU-region if value 255 is used.
  MBED_CONF_MBED_MESH_API_WISUN_OPERATING_MODE=255

  # Unicast channel function as specified in the Wi-SUN FAN specification.
  # Wi-SUN stack will select channel function if value 255 is used.
  MBED_CONF_MBED_MESH_API_WISUN_UC_CHANNEL_FUNCTION=255

  # Broadcast channel function as specified in the Wi-SUN FAN specification.
  # Wi-SUN stack will select channel function if value 255 is used.
  MBED_CONF_MBED_MESH_API_WISUN_BC_CHANNEL_FUNCTION=255

  # Default 16-bit fixed channel for unicast.
  # Used when channel hopping is not desired.
  MBED_CONF_MBED_MESH_API_WISUN_UC_FIXED_CHANNEL=65535

  # Default 16-bit fixed channel for multicast.
  # Used when channel hopping is not desired.
  MBED_CONF_MBED_MESH_API_WISUN_BC_FIXED_CHANNEL=65535

  # 32-bit broadcast interval. Duration between broadcast dwell intervals.
  # Wi-SUN stack default value will be used when set to 0.
  MBED_CONF_MBED_MESH_API_WISUN_BC_INTERVAL=0

  # Broadcast dwell interval. Range: 15-255 milliseconds.
  # Wi-SUN stack default value will be used when set to 0.
  MBED_CONF_MBED_MESH_API_WISUN_BC_DWELL_INTERVAL=0

  # Unicast dwell interval. Range: 15-255 milliseconds.
  MBED_CONF_MBED_MESH_API_WISUN_UC_DWELL_INTERVAL=255

  # Supported device operating modes:
  # MESH_DEVICE_TYPE_WISUN_ROUTER
  # MESH_DEVICE_TYPE_WISUN_BORDER_ROUTER
  MBED_CONF_MBED_MESH_API_WISUN_DEVICE_TYPE=MESH_DEVICE_TYPE_WISUN_ROUTER

  # File name of the certificate header file (used on include directive)
  #MBED_CONF_MBED_MESH_API_CERTIFICATE_HEADER=

  # Root certificate; in PEM format must be a null terminated c-string,
  # in DER format the root-certificate-len must be set
  #MBED_CONF_MBED_MESH_API_ROOT_CERTIFICATE=

  # Root certificate length;
  # optional for PEM format, must be defined for DER format
  #MBED_CONF_MBED_MESH_API_ROOT_CERTIFICATE_LEN=

  # Own certificate; in PEM format must be a null terminated c-string,
  # in DER format the own-certificate-len must be set
  #MBED_CONF_MBED_MESH_API_OWN_CERTIFICATE=

  # Own certificate length;
  # optional for PEM format, must be defined for DER format
  #MBED_CONF_MBED_MESH_API_OWN_CERTIFICATE_LEN=

  # Own certificate's key; in PEM format must be a null terminated c-string,
  # in DER format the own-certificate-key-len must be set
  #MBED_CONF_MBED_MESH_API_OWN_CERTIFICATE_KEY=

  # Own certificate's key length;
  # optional for PEM format, must be defined for DER format
  #MBED_CONF_MBED_MESH_API_OWN_CERTIFICATE_KEY_LEN=

  # RADIUS Server IPv6 address in string format (e.g. \"2001:1234::1\")
  #MBED_CONF_MBED_MESH_API_RADIUS_SERVER_IPV6_ADDRESS=

  # RADIUS shared secret; ASCII string (e.g. \"radiuspassword\")
  # or sequence of bytes (e.g. 0x01, 0x02, 0x03, 0x04, 0x05)
  #MBED_CONF_MBED_MESH_API_RADIUS_SHARED_SECRET=

  # RADIUS shared secret length;
  # If length is not defined, strlen() is used to determine RADIUS shared secret length
  #MBED_CONF_MBED_MESH_API_RADIUS_SHARED_SECRET_LEN=

  # RADIUS retry trickle timer Imin; in 100ms units;
  # range 1-1200; default 20 (2 seconds)
  MBED_CONF_MBED_MESH_API_RADIUS_RETRY_IMIN=20

  # RADIUS retry trickle timer Imax; in 100ms units;
  # range 1-1200; default 30 (3 seconds)
  MBED_CONF_MBED_MESH_API_RADIUS_RETRY_IMAX=30

  # RADIUS retry trickle count; default 3
  MBED_CONF_MBED_MESH_API_RADIUS_RETRY_COUNT=3


  # connectivity/nanostack/sal-stack-nanostack/mbed_lib.json

  # Build time configuration. Refer to Handbook for valid values. Default: full stack
  MBED_CONF_NANOSTACK_CONFIGURATION=nanostack_full

  # One of mbed-trace level defines:
  # TRACE_LEVEL_DEBUG
  # TRACE_LEVEL_INFO
  # TRACE_LEVEL_WARN
  # TRACE_LEVEL_ERROR
  #MBED_CONF_NANOSTACK_TRACE_MAX_LEVEL=

  # Use AES and SHA-256 implementations provided by mbed TLS
  NS_USE_EXTERNAL_MBED_TLS=1

  # Define event-loop thread stack size. [bytes]
  MBED_CONF_NANOSTACK_HAL_EVENT_LOOP_THREAD_STACK_SIZE=6144

  # Make critical section API usable from interrupt context.
  # Else a mutex is used as locking primitive.
  # Consult arm_hal_interrupt.c for possible side effects on interrupt latency.
  MBED_CONF_NANOSTACK_HAL_CRITICAL_SECTION_USABLE_FROM_INTERRUPT=0

  # Application is responsible of message dispatch loop.
  # Else launch a separate thread for event-loop.
  MBED_CONF_NANOSTACK_HAL_EVENT_LOOP_DISPATCH_FROM_APPLICATION=0

  # Use Mbed OS global event queue for Nanostack event loop,
  # rather than our own thread.
  MBED_CONF_NANOSTACK_HAL_EVENT_LOOP_USE_MBED_EVENTS=0

  # Use Mbed OS KVStore API instead of filesystem. Default: false
  MBED_CONF_NANOSTACK_HAL_USE_KVSTORE=0

  # Path of KVStore partition. String, Default \"/kv/\"
  MBED_CONF_NANOSTACK_HAL_KVSTORE_PATH=\"/kv/\"


  # connectivity/nanostack/sal-stack-nanostack-eventloop/mbed_lib.json

  # Use platform provided low resolution tick timer for eventloop
  #MBED_CONF_NANOSTACK_EVENTLOOP_USE_PLATFORM_TICK_TIMER=

  # Exclude high resolution timer from build
  #MBED_CONF_NANOSTACK_EVENTLOOP_EXCLUDE_HIGHRES_TIMER=


  # connectivity/netsocket/mbed_lib.json

  # Default stack to be used, valid values: LWIP, NANOSTACK.
  MBED_CONF_NSAPI_DEFAULT_STACK=LWIP

  # Default Wi-Fi SSID.
  "MBED_CONF_NSAPI_DEFAULT_WIFI_SSID=\"${WIFI_SSID}\""

  # Password for the default Wi-Fi network.
  "MBED_CONF_NSAPI_DEFAULT_WIFI_PASSWORD=\"${WIFI_PASSWORD}\""

  # Wi-Fi security protocol, valid values are WEP, WPA, WPA2, WPA/WPA2.
  MBED_CONF_NSAPI_DEFAULT_WIFI_SECURITY=NONE

  # Default Public Land Mobile Network for cellular connection.
  #MBED_CONF_NSAPI_DEFAULT_CELLULAR_PLMN=

  # PIN for the default SIM card.
  #MBED_CONF_NSAPI_DEFAULT_CELLULAR_SIM_PIN=

  # Default cellular Access Point Name.
  #MBED_CONF_NSAPI_DEFAULT_CELLULAR_APN=

  # Username for the default cellular network.
  #MBED_CONF_NSAPI_DEFAULT_CELLULAR_USERNAME=

  # Password for the default cellular network.
  #MBED_CONF_NSAPI_DEFAULT_CELLULAR_PASSWORD=

  # Configuration type for MeshInterface::get_default_instance().
  # [LOWPAN/THREAD/WISUN]
  MBED_CONF_NSAPI_DEFAULT_MESH_TYPE=THREAD

  # How long the DNS translator waits for a reply from a server in milliseconds
  MBED_CONF_NSAPI_DNS_RESPONSE_WAIT_TIME=10000

  # Number of total DNS query attempts that the DNS translator makes
  MBED_CONF_NSAPI_DNS_TOTAL_ATTEMPTS=10

  # Number of DNS query retries that the DNS translator makes per server,
  # before moving on to the next server.
  # Total retries/attempts is always limited by dns-total-attempts.
  MBED_CONF_NSAPI_DNS_RETRIES=1

  # Number of cached host name resolutions
  MBED_CONF_NSAPI_DNS_CACHE_SIZE=3

  # Max number IP addresses returned by  multiple DNS query
  MBED_CONF_NSAPI_DNS_ADDRESSES_LIMIT=10

  # Enable network socket statistics
  MBED_CONF_NSAPI_SOCKET_STATS_ENABLED=0

  # Maximum number of socket statistics cached
  MBED_CONF_NSAPI_SOCKET_STATS_MAX_COUNT=10

  # Use external TLSSocket implementation.
  # Used network stack must support external TLSSocket
  # setsockopt values (see nsapi_types.h)
  #MBED_CONF_NSAPI_OFFLOAD_TLSSOCKET=


  # storage/blockdevice/COMPONENT_FLASHIAP/mbed_lib.json

  # Base address for the block device on the external flash.
  MBED_CONF_FLASHIAP_BLOCK_DEVICE_BASE_ADDRESS=0xFFFFFFFF

  # Memory allocated for block device.
  MBED_CONF_FLASHIAP_BLOCK_DEVICE_SIZE=0


  # storage/blockdevice/COMPONENT_QSPIF/mbed_lib.json

  # (Legacy SFDP 1.0 ONLY)
  # Reset sequence is enable reset (0x66) then reset (0x99)
  MBED_CONF_QSPIF_ENABLE_AND_RESET=0

  # (Legacy SFDP 1.0 ONLY)
  # Reset involves a single command (0xF0)
  MBED_CONF_QSPIF_DIRECT_RESET=0

  MBED_CONF_QSPIF_QSPI_IO0=MBED_CONF_DRIVERS_QSPI_IO0
  MBED_CONF_QSPIF_QSPI_IO1=MBED_CONF_DRIVERS_QSPI_IO1
  MBED_CONF_QSPIF_QSPI_IO2=MBED_CONF_DRIVERS_QSPI_IO2
  MBED_CONF_QSPIF_QSPI_IO3=MBED_CONF_DRIVERS_QSPI_IO3
  MBED_CONF_QSPIF_QSPI_SCK=MBED_CONF_DRIVERS_QSPI_SCK
  MBED_CONF_QSPIF_QSPI_CSN=MBED_CONF_DRIVERS_QSPI_CSN
  MBED_CONF_QSPIF_QSPI_POLARITY_MODE=0
  MBED_CONF_QSPIF_QSPI_FREQ=50000000
  MBED_CONF_QSPIF_QSPI_MIN_PROG_SIZE=1
  MBED_CONF_QSPIF_QSPI_MIN_READ_SIZE=1


  # features/storage/filesystem/fat/ChaN/mbed_lib.json

  # Switches debug mode.
  # 0: disable
  # 1: enable
  MBED_CONF_FAT_CHAN_FFS_DBG=0

  # Switches read-only configuration.
  # 0: read/write
  # 1: read-only
  MBED_CONF_FAT_CHAN_FF_FS_READONLY=0

  # Defines minimization level to remove some basic API functions.
  # 0: all functions enabled
  # 1: f_stat() removed
  # 2: f_opendir() removed in addition to 1
  # 3: f_lseek() removed in addition to 2
  MBED_CONF_FAT_CHAN_FF_FS_MINIMIZE=0

  # Switches string functions.
  # 0: disable string functions
  # 1: enable without LF-CRLF conversion
  # 2: enable with LF-CRLF conversion
  MBED_CONF_FAT_CHAN_FF_USE_STRFUNC=0

  # Switches filtered directory read functions.
  # 0: disable
  # 1: enable
  # 2: enable with matching altname[] too
  MBED_CONF_FAT_CHAN_FF_USE_FIND=0

  # Switches f_mkfs() function.
  # 0: disable
  # 1: enable.
  MBED_CONF_FAT_CHAN_FF_USE_MKFS=1

  # Switches fast seek function.
  # 0: disable
  # 1: enable
  MBED_CONF_FAT_CHAN_FF_USE_FASTSEEK=0

  # Switches f_expand function.
  # 0: disable
  # 1: enable
  MBED_CONF_FAT_CHAN_FF_USE_EXPAND=0

  # Switches attribute manipulation functions.
  # 0: disable
  # 1: enable
  # ff_fs_readonly needs to be 0 to enable this option
  MBED_CONF_FAT_CHAN_FF_USE_CHMOD=0

  # Switches volume label functions.
  # 0: disable
  # 1: enable
  MBED_CONF_FAT_CHAN_FF_USE_LABEL=0

  # Switches f_forward() function.
  # 0: disable
  # 1: enable
  MBED_CONF_FAT_CHAN_FF_USE_FORWARD=0

  # Specifies the OEM code page to be used on the target system.
  MBED_CONF_FAT_CHAN_FF_CODE_PAGE=437

  # Switches the support for LFN (long file name).
  # 0: disable LFN
  # 1: enable LFN with static working buffer on the BSS, always NOT thread-safe
  # 2: enable LFN with dynamic working buffer on the STACK
  # 3: enable LFN with dynamic working buffer on the HEAP
  MBED_CONF_FAT_CHAN_FF_USE_LFN=3

  # Defines size of the working buffer in UTF-16 code unit and it can be in range of 12 to 255.
  # It is recommended to be set 255 to fully support LFN specification.
  MBED_CONF_FAT_CHAN_FF_MAX_LFN=255

  # Switches the character encoding on the API when LFN is enabled.
  # 0: ANSI/OEM in current CP (TCHAR = char)
  # 1: unicode in UTF-16 (TCHAR = WCHAR)
  # 2: unicode in UTF-8 (TCHAR = char)
  MBED_CONF_FAT_CHAN_FF_LFN_UNICODE=0

  # Defines size of file name members in the FILINFO structure which is used to read out directory items.
  # The value should be suffcient for the file names to read.
  # The maximum possible length of the read file name depends on character encoding.
  # When LFN is not enabled, these options have no effect.
  MBED_CONF_FAT_CHAN_FF_LFN_BUF=255

  # See FF_LFN_BUF.
  MBED_CONF_FAT_CHAN_FF_SFN_BUF=12

  # When FF_LFN_UNICODE >= 1 with LFN enabled, string I/O functions convert the character encoding in it.
  # This option selects assumption of character encoding ON THE FILE to be read/written via those functions.
  # 0: ANSI/OEM in current CP
  # 1: unicode in UTF-16LE
  # 2: unicode in UTF-16BE
  # 3: unicode in UTF-8
  MBED_CONF_FAT_CHAN_FF_STRF_ENCODE=3

  # Configures support for relative path.
  # 0: disable relative path and remove related functions
  # 1: enable relative path. f_chdir() and f_chdrive() are available
  # 2: f_getcwd() function is available in addition to 1
  MBED_CONF_FAT_CHAN_FF_FS_RPATH=1

  # Number of volumes (logical drives) to be used. (1-10).
  MBED_CONF_FAT_CHAN_FF_VOLUMES=4

  # Switches string support for volume ID.
  # When ff_volume_strs is set to 1, also pre-defined strings
  # can be used as drive number in the path name.
  MBED_CONF_FAT_CHAN_FF_STR_VOLUME_ID=0

  # Defines the drive ID strings for each logical drive.
  # Number of items must be equal to ff_volumes.
  # Valid characters for the drive ID strings are: A-Z and 0-9.
  MBED_CONF_FAT_CHAN_FF_VOLUME_STRS="RAM","NAND","CF","SD","SD2","USB","USB2","USB3"

  # Switches support for multiple volumes on the physical drive.
  # By default (0), each logical drive number is bound to the same physical drive number
  # and only an FAT volume found on the physical drive will be mounted.
  # When this function is enabled (1), each logical drive number
  # can be bound to arbitrary physical drive.
  MBED_CONF_FAT_CHAN_FF_MULTI_PARTITION=0

  # This and the next option configures the range of sector size to be supported.
  # (512, 1024, 2048 or 4096)
  # Always set both 512 for most systems, generic memory card and harddisk.
  # But a larger value may be required for on-board flash memory and some type of optical media.
  MBED_CONF_FAT_CHAN_FF_MIN_SS=512

  # When ff_max_ss is larger than ff_min_ss, FatFs is configured for variable sector size mode.
  MBED_CONF_FAT_CHAN_FF_MAX_SS=4096

  # Switches support for ATA-TRIM.
  # 0: disable
  # 1: enable
  MBED_CONF_FAT_CHAN_FF_USE_TRIM=1

  # If you need to know correct free space on the FAT32 volume, set bit 0 of this option,
  # and f_getfree() function at first time after volume mount will force a full FAT scan.
  # Bit 1 controls the use of last allocated cluster number.
  MBED_CONF_FAT_CHAN_FF_FS_NOFSINFO=0

  # Switches tiny buffer configuration.
  # (0:Normal or 1:Tiny).
  # At the tiny configuration, size of file object (FIL) is shrinked ff_max_ss bytes.
  # Instead of private sector buffer eliminated from the file object,
  # common sector buffer in the filesystem object (FATFS) is used for the file data transfer.
  MBED_CONF_FAT_CHAN_FF_FS_TINY=1

  # Switches support for exFAT filesystem.
  # 0: disable, 1: enable.
  # When enable exFAT, also LFN needs to be enabled.
  # Note that enabling exFAT discards ANSI C (C89) compatibility.
  MBED_CONF_FAT_CHAN_FF_FS_EXFAT=0

  # Enables the use of the heap for allocating buffers.
  # Otherwise _max_ss sized buffers are allocated statically in relevant structures
  # (in FATFS if _fs_tiny, otherwise in FATFS and FIL).
  MBED_CONF_FAT_CHAN_FF_FS_HEAPBUF=1

  # Switches timestamp functiton. If the system does not have any RTC function
  # or valid timestamp is not needed, set to 1 to disable the timestamp function.
  # All objects modified by FatFs will have a fixed timestamp defined by
  # ff_nortc_mon, ff_nortc_mday and ff_nortc_year in local time.
  MBED_CONF_FAT_CHAN_FF_FS_NORTC=0

  # See FF_FS_NORTC.
  MBED_CONF_FAT_CHAN_FF_NORTC_MON=1

  # See FF_FS_NORTC.
  MBED_CONF_FAT_CHAN_FF_NORTC_MDAY=1

  # See FF_FS_NORTC.
  MBED_CONF_FAT_CHAN_FF_NORTC_YEAR=2017

  # Switches file lock function to control duplicated file open
  # and illegal operation to open objects.
  # This option must be 0 when ff_fs_readonly is 1.
  # The value defines how many files/sub-directories can be opened
  # simultaneously under file lock control.
  # Note that the file lock control is independent of re-entrancy.
  MBED_CONF_FAT_CHAN_FF_FS_LOCK=0

  # Switches the re-entrancy (thread safe) of the FatFs module itself.
  # Note that regardless of this option, file access to different volume
  # is always re-entrant and volume control functions.
  # 0: disable re-entrancy.
  # ff_fs_timeout and ff_sync_t have no effect.
  # 1: enable re-entrancy.
  # Also user provided synchronization handlers must be added to the project.
  # Samples are available in option/syscall.c.
  MBED_CONF_FAT_CHAN_FF_FS_REENTRANT=0

  # Defines timeout period in unit of time tick.
  MBED_CONF_FAT_CHAN_FF_FS_TIMEOUT=1000

  # Defines O/S dependent sync object type.
  # e.g. HANDLE, ID, OS_EVENT* and SemaphoreHandle_t.
  MBED_CONF_FAT_CHAN_FF_SYNC_T=HANDLE

  # Sync the file on every new cluster.
  MBED_CONF_FAT_CHAN_FLUSH_ON_NEW_CLUSTER=0

  # Sync the file on every new sector.
  MBED_CONF_FAT_CHAN_FLUSH_ON_NEW_SECTOR=1


  # storage/filesystem/littlefs/mbed_lib.json

  # Minimum size of a block read.
  # This determines the size of read buffers.
  # This may be larger than the physical read size to improve
  # performance by caching more of the block device.
  MBED_LFS_READ_SIZE=64

  # Minimum size of a block program.
  # This determines the size of program buffers.
  # This may be larger than the physical program size to improve
  # performance by caching more of the block device.
  MBED_LFS_PROG_SIZE=64

  # Size of an erasable block.
  # This does not impact ram consumption and may be
  # larger than the physical erase size.
  # However, this should be kept small as each file
  # currently takes up an entire block.
  MBED_LFS_BLOCK_SIZE=512

  # Number of blocks to lookahead during block allocation.
  # A larger lookahead reduces the number of passes required to allocate a block.
  # The lookahead buffer requires only 1 bit per block so it can be quite large
  # with little ram impact. Should be a multiple of 32.
  MBED_LFS_LOOKAHEAD=512

  # Enable intrinsics for bit operations such as ctz, popc, and le32 conversion.
  # Can be disabled to help debug toolchain issues
  MBED_LFS_INTRINSICS=1

  # Enables info logging, true = enabled, false = disabled,
  # null = disabled only in release builds
  MBED_LFS_ENABLE_INFO=0

  # Enables debug logging, true = enabled, false = disabled,
  # null = disabled only in release builds
  #MBED_LFS_ENABLE_DEBUG=

  # Enables warn logging, true = enabled, false = disabled,
  # null = disabled only in release builds
  #MBED_LFS_ENABLE_WARN=

  # Enables error logging, true = enabled, false = disabled,
  # null = disabled only in release builds
  #MBED_LFS_ENABLE_ERROR=

  # Enables asserts, true = enabled, false = disabled,
  # null = disabled only in release builds
  #MBED_LFS_ENABLE_ASSERT=


  # storage/filesystem/littlefsv2/mbed_lib.json

  # Size of a logical block.
  # This does not impact ram consumption and may be larger than the physical erase block.
  # If the physical erase block is larger, littlefs will use that instead.
  # Larger values will be faster but waste more storage when files are not aligned to a block size.
  MBED_LFS2_BLOCK_SIZE=512

  # Number of erase cycles before a block is forcefully evicted.
  # Larger values are more efficient but cause less even wear distribution.
  # 0 disables dynamic wear-leveling.
  MBED_LFS2_BLOCK_CYCLES=1024

  # Size of read/program caches.
  # Each file uses 1 cache, and littlefs allocates 2 caches for internal operations.
  # Larger values should be faster but uses more RAM.
  MBED_LFS2_CACHE_SIZE=64

  # Size of the lookahead buffer.
  # A larger lookahead reduces the allocation scans and
  # results in a faster filesystem but uses more RAM.
  MBED_LFS2_LOOKAHEAD_SIZE=64

  # Enable intrinsics for bit operations such as ctz, popc, and le32 conversion.
  # Can be disabled to help debug toolchain issues
  MBED_LFS2_INTRINSICS=1

  # Enables info logging, true = enabled, false = disabled,
  # null = disabled only in release builds
  MBED_LFS2_ENABLE_INFO=0

  # Enables debug logging, true = enabled, false = disabled,
  # null = disabled only in release builds
  #MBED_LFS2_ENABLE_DEBUG=

  # storage/kvstore/kv_config/global/mbed_lib.json

  # Options are TDB_INTERNAL, TDB_EXTERNAL, TDB_EXTERNAL_NO_RBP, FILESYSTEM, FILESYSTEM_NO_RBP or default.
  # If default, the storage type will be chosen according to the component defined in targets.json
  MBED_CONF_STORAGE_STORAGE_TYPE=default

  # A string name for the default kvstore configuration
  MBED_CONF_STORAGE_DEFAULT_KV=kv


  # storage/kvstore/kv_config/filesystem/mbed_lib.json

  # Default is the larger of the last 2 sectors or last 14 pages of flash.
  MBED_CONF_STORAGE_FILESYSTEM_RBP_INTERNAL_SIZE=7168

  # If default, base address is set to internal_size bytes before the end of flash.
  MBED_CONF_STORAGE_FILESYSTEM_INTERNAL_BASE_ADDRESS=0

  # Options are default, FAT or LITTLE.
  # If default value the filesystem is chosen by the blockdevice type
  MBED_CONF_STORAGE_FILESYSTEM_FILESYSTEM=default

  # Options are default, SPIF, DATAFASH, QSPIF, SD or other.
  # If default, the block device will be chosen according to the component defined in targets.json. If other, override get_other_blockdevice() to support block device out of Mbed OS tree.
  MBED_CONF_STORAGE_FILESYSTEM_BLOCKDEVICE=default

  # Size in bytes of the external block device, if default value, the maximum size available is used.
  MBED_CONF_STORAGE_FILESYSTEM_EXTERNAL_SIZE=0

  # The default will set start address to address 0
  MBED_CONF_STORAGE_FILESYSTEM_EXTERNAL_BASE_ADDRESS=0

  # Where to mount the filesystem.
  MBED_CONF_STORAGE_FILESYSTEM_MOUNT_POINT=kv

  # Path for the working directory where the FileSystemStore stores the data
  MBED_CONF_STORAGE_FILESYSTEM_FOLDER_PATH=kvstore


  # storage/kvstore/kv_config/filesystem_no_rbp/mbed_lib.json

  # Options are default, FAT or LITTLE.
  # If default value the filesystem is chosen by the blockdevice type
  MBED_CONF_STORAGE_FILESYSTEM_NO_RBP_FILESYSTEM=default

  # Options are default, SPIF, DATAFLASH, QSPIF, SD or other.
  # If default the block device will be chosen by the defined component.
  # If other, override get_other_blockdevice() to support block device out of Mbed OS tree.
  MBED_CONF_STORAGE_FILESYSTEM_NO_RBP_BLOCKDEVICE=default

  # Size in bytes of the external block device, if default the maximum size available is used.
  MBED_CONF_STORAGE_FILESYSTEM_NO_RBP_EXTERNAL_SIZE=0

  # The default will set start address to address 0
  MBED_CONF_STORAGE_FILESYSTEM_NO_RBP_EXTERNAL_BASE_ADDRESS=0

  # Where to mount the filesystem.
  MBED_CONF_STORAGE_FILESYSTEM_NO_RBP_MOUNT_POINT=kv

  # Path for the working directory where the FileSystemStore stores the data
  MBED_CONF_STORAGE_FILESYSTEM_NO_RBP_FOLDER_PATH=kvstore


  # storage/kvstore/kv_config/tdb_internal/mbed_lib.json

  # Size of the FlashIAP block device.
  # Default size will be the larger of the last 2 sectors or last 14 pages of flash.
  MBED_CONF_STORAGE_TDB_INTERNAL_INTERNAL_SIZE=0x10000

  # If default, the base address is set to internal_size bytes before the end of flash.
  MBED_CONF_STORAGE_TDB_INTERNAL_INTERNAL_BASE_ADDRESS=0


  # storage/kvstore/kv_config/tdb_external/mbed_lib.json

  # Default is the larger of the last 2 sectors or last 14 pages of flash.
  MBED_CONF_STORAGE_TDB_EXTERNAL_RBP_INTERNAL_SIZE=7168

  # If default, the base address is set to internal_size bytes before the end of flash.
  MBED_CONF_STORAGE_TDB_EXTERNAL_INTERNAL_BASE_ADDRESS=0

  # Options are default, SPIF, DATAFASH, QSPIF, SD or other.
  # If default the block device will be chosen by the defined component.
  # If other, override get_other_blockdevice() to support block device out of Mbed OS tree.
  MBED_CONF_STORAGE_TDB_EXTERNAL_BLOCKDEVICE=default

  # # Size in bytes of the external block device, if default the maximum size available is used.
  MBED_CONF_STORAGE_TDB_EXTERNAL_EXTERNAL_SIZE=0

  # The default will set start address to address 0
  MBED_CONF_STORAGE_TDB_EXTERNAL_EXTERNAL_BASE_ADDRESS=0


  # storage/kvstore/kv_config/tdb_external_no_rbp/mbed_lib.json

  # Options are default, SPIF, DATAFASH, QSPIF, SD or other.
  # If default the block device will be chosen by the defined component.
  # If other, override get_other_blockdevice() to support block device out of Mbed OS tree.
  MBED_CONF_STORAGE_TDB_EXTERNAL_NO_RBP_BLOCKDEVICE=default

  # Size in bytes of the external block device, if default the maximum size available is used.
  MBED_CONF_STORAGE_TDB_EXTERNAL_NO_RBP_EXTERNAL_SIZE=0

  # The default will set start address to address 0
  MBED_CONF_STORAGE_TDB_EXTERNAL_NO_RBP_EXTERNAL_BASE_ADDRESS=0


  # storage/kvstore/securestore/mbed_lib.json

  MBEDTLS_CIPHER_MODE_CTR

  # features/frameworks/utest/mbed_lib.json

  UNITY_INCLUDE_CONFIG_H

  # cmsis/device/rtos/mbed_lib.json

  # Include RTE_Components.h
  _RTE_

  # The size of the main thread's stack
  MBED_CONF_RTOS_MAIN_THREAD_STACK_SIZE=4096

  # The size of the timer thread's stack
  MBED_CONF_RTOS_TIMER_THREAD_STACK_SIZE=768

  # The size of the idle thread's stack
  MBED_CONF_RTOS_IDLE_THREAD_STACK_SIZE=512

  # The default stack size of new threads
  MBED_CONF_RTOS_THREAD_STACK_SIZE=4096

  # Additional size to add to the idle thread when a specific target
  # or application implementation requires it or in case tickless
  # is enabled and LPTICKER_DELAY_TICKS is used
  MBED_CONF_RTOS_IDLE_THREAD_STACK_SIZE_TICKLESS_EXTRA=256

  # Additional size to add to the idle thread when code compilation
  # optimisation is disabled
  MBED_CONF_RTOS_IDLE_THREAD_STACK_SIZE_DEBUG_EXTRA=0

  # Maximum number of CMSIS-RTOSv2 object-pool threads that can be
  # active at the same time
  MBED_CONF_RTOS_THREAD_NUM=0

  # The total memory available for all CMSIS-RTOSv2 object-pool
  # thread stacks combined
  MBED_CONF_RTOS_THREAD_USER_STACK_SIZE=0

  # Maximum number of CMSIS-RTOSv2 object-pool timers that can
  # be active at the same time
  MBED_CONF_RTOS_TIMER_NUM=0

  # Maximum number of CMSIS-RTOSv2 object-pool event flag objects
  # that can be active at the same time
  MBED_CONF_RTOS_EVFLAGS_NUM=0

  # Maximum number of CMSIS-RTOSv2 object-pool mutexes that can
  # be active at the same time
  MBED_CONF_RTOS_MUTEX_NUM=0

  # Maximum number of CMSIS-RTOSv2 object-pool semaphores that can
  # be active at the same time
  MBED_CONF_RTOS_SEMAPHORE_NUM=0

  # Maximum number of CMSIS-RTOSv2 object-pool semaphores that can
  # be active at the same time
  MBED_CONF_RTOS_MSGQUEUE_NUM=0

  # The total memory available for all CMSIS-RTOSv2 object-pool
  # message queues combined
  MBED_CONF_RTOS_MSGQUEUE_DATA_SIZE=0


  # WiFi SSID
  MBED_CONF_APP_WIFI_SSID=\"${WIFI_SSID}\"

  # WiFi Password
  MBED_CONF_APP_WIFI_PASSWORD=\"${WIFI_PASSWORD}\"
)
