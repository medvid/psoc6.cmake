set(MBED_LWIP_SYS_DIR ${MBED_OS_DIR}/features/lwipstack/lwip-sys)
set(MBED_LWIP_SYS_SOURCES
  ${MBED_LWIP_SYS_DIR}/lwip_random.h
  ${MBED_LWIP_SYS_DIR}/lwip_random.c
  ${MBED_LWIP_SYS_DIR}/lwip_tcp_isn.h
  ${MBED_LWIP_SYS_DIR}/lwip_tcp_isn.c
  ${MBED_LWIP_SYS_DIR}/arch/cc.h
  ${MBED_LWIP_SYS_DIR}/arch/lwip_checksum.c
  ${MBED_LWIP_SYS_DIR}/arch/lwip_memcpy.c
  ${MBED_LWIP_SYS_DIR}/arch/lwip_sys_arch.c
  ${MBED_LWIP_SYS_DIR}/arch/perf.h
  ${MBED_LWIP_SYS_DIR}/arch/sys_arch.h
)
set(MBED_LWIP_SYS_INCLUDE_DIRS
  ${MBED_LWIP_SYS_DIR}
)
set(MBED_LWIP_SYS_DEFINES
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
)
set(MBED_LWIP_SYS_LINK_LIBRARIES
  mbed-tls
  mbed-lwip
  mbed-client-randlib
)

add_library(mbed-lwip-sys STATIC EXCLUDE_FROM_ALL ${MBED_LWIP_SYS_SOURCES})
target_include_directories(mbed-lwip-sys PUBLIC ${MBED_LWIP_SYS_INCLUDE_DIRS})
target_compile_definitions(mbed-lwip-sys PUBLIC ${MBED_LWIP_SYS_DEFINES})
target_link_libraries(mbed-lwip-sys PUBLIC ${MBED_LWIP_SYS_LINK_LIBRARIES})

# BUG: lwipopts.h doesn't include mbedtls config.h
target_compile_definitions(mbed-lwip-sys PRIVATE MBEDTLS_MD5_C)
target_link_libraries(mbed-lwip PUBLIC mbed-lwip-sys)
