set(MBED_NETSOCKET_DIR ${MBED_OS_DIR}/features/netsocket)
set(MBED_NETSOCKET_SOURCES
  ${MBED_NETSOCKET_DIR}/CellularInterface.h
  ${MBED_NETSOCKET_DIR}/CellularNonIPSocket.h
  ${MBED_NETSOCKET_DIR}/CellularNonIPSocket.cpp
  ${MBED_NETSOCKET_DIR}/ControlPlane_netif.h
  ${MBED_NETSOCKET_DIR}/DNS.h
  ${MBED_NETSOCKET_DIR}/DTLSSocket.h
  ${MBED_NETSOCKET_DIR}/DTLSSocket.cpp
  ${MBED_NETSOCKET_DIR}/DTLSSocketWrapper.h
  ${MBED_NETSOCKET_DIR}/DTLSSocketWrapper.cpp
  ${MBED_NETSOCKET_DIR}/EMAC.h
  ${MBED_NETSOCKET_DIR}/EMACInterface.h
  ${MBED_NETSOCKET_DIR}/EMACInterface.cpp
  ${MBED_NETSOCKET_DIR}/EMACMemoryManager.h
  ${MBED_NETSOCKET_DIR}/EthInterface.h
  ${MBED_NETSOCKET_DIR}/EthernetInterface.h
  ${MBED_NETSOCKET_DIR}/EthernetInterface.cpp
  ${MBED_NETSOCKET_DIR}/ICMPSocket.h
  ${MBED_NETSOCKET_DIR}/ICMPSocket.cpp
  ${MBED_NETSOCKET_DIR}/InternetDatagramSocket.h
  ${MBED_NETSOCKET_DIR}/InternetDatagramSocket.cpp
  ${MBED_NETSOCKET_DIR}/InternetSocket.h
  ${MBED_NETSOCKET_DIR}/InternetSocket.cpp
  ${MBED_NETSOCKET_DIR}/L3IP.h
  ${MBED_NETSOCKET_DIR}/L3IPInterface.h
  ${MBED_NETSOCKET_DIR}/L3IPInterface.cpp
  ${MBED_NETSOCKET_DIR}/MeshInterface.h
  ${MBED_NETSOCKET_DIR}/NetStackMemoryManager.h
  ${MBED_NETSOCKET_DIR}/NetStackMemoryManager.cpp
  ${MBED_NETSOCKET_DIR}/NetworkInterface.h
  ${MBED_NETSOCKET_DIR}/NetworkInterface.cpp
  ${MBED_NETSOCKET_DIR}/NetworkInterfaceDefaults.cpp
  ${MBED_NETSOCKET_DIR}/NetworkStack.h
  ${MBED_NETSOCKET_DIR}/NetworkStack.cpp
  ${MBED_NETSOCKET_DIR}/OnboardNetworkStack.h
  ${MBED_NETSOCKET_DIR}/PPP.h
  ${MBED_NETSOCKET_DIR}/PPPInterface.h
  ${MBED_NETSOCKET_DIR}/PPPInterface.cpp
  ${MBED_NETSOCKET_DIR}/Socket.h
  ${MBED_NETSOCKET_DIR}/SocketAddress.h
  ${MBED_NETSOCKET_DIR}/SocketAddress.cpp
  ${MBED_NETSOCKET_DIR}/SocketStats.h
  ${MBED_NETSOCKET_DIR}/SocketStats.cpp
  ${MBED_NETSOCKET_DIR}/TCPSocket.h
  ${MBED_NETSOCKET_DIR}/TCPSocket.cpp
  ${MBED_NETSOCKET_DIR}/TLSSocket.h
  ${MBED_NETSOCKET_DIR}/TLSSocket.cpp
  ${MBED_NETSOCKET_DIR}/TLSSocketWrapper.h
  ${MBED_NETSOCKET_DIR}/TLSSocketWrapper.cpp
  ${MBED_NETSOCKET_DIR}/UDPSocket.h
  ${MBED_NETSOCKET_DIR}/UDPSocket.cpp
  ${MBED_NETSOCKET_DIR}/WiFiAccessPoint.h
  ${MBED_NETSOCKET_DIR}/WiFiAccessPoint.cpp
  ${MBED_NETSOCKET_DIR}/WiFiInterface.h
  ${MBED_NETSOCKET_DIR}/nsapi.h
  ${MBED_NETSOCKET_DIR}/nsapi_dns.h
  ${MBED_NETSOCKET_DIR}/nsapi_dns.cpp
  ${MBED_NETSOCKET_DIR}/nsapi_ppp.h
  ${MBED_NETSOCKET_DIR}/nsapi_types.h
)
set(MBED_NETSOCKET_INCLUDE_DIRS
  ${MBED_OS_DIR}/features
  ${MBED_NETSOCKET_DIR}
)
set(MBED_NETSOCKET_DEFINES
  MBED_CONF_NSAPI_PRESENT=1

  # Default stack to be used, valid values: LWIP, NANOSTACK.
  MBED_CONF_NSAPI_DEFAULT_STACK=LWIP

  # Default Wi-Fi SSID (configured by CMake)
  MBED_CONF_NSAPI_DEFAULT_WIFI_SSID="${WIFI_SSID}"

  # Password for the default Wi-Fi network (configured by CMake)
  MBED_CONF_NSAPI_DEFAULT_WIFI_PASSWORD="${WIFI_PASSWORD}"

  # Wi-Fi security protocol (configured by CMake)
  # Valid values are WEP, WPA, WPA2, WPA/WPA2.
  MBED_CONF_NSAPI_DEFAULT_WIFI_SECURITY=${WIFI_SECURITY}

  # Default Public Land Mobile Network for cellular connection.
  #MBED_CONF_NSAPI_DEFAULT_CELLULAR_PLMN

  # PIN for the default SIM card.
  #MBED_CONF_NSAPI_DEFAULT_CELLULAR_SIM_PIN

  # Default cellular Access Point Name.
  #MBED_CONF_NSAPI_DEFAULT_CELLULAR_APN

  # Username for the default cellular network.
  #MBED_CONF_NSAPI_DEFAULT_CELLULAR_USERNAME

  # Password for the default cellular network.
  #MBED_CONF_NSAPI_DEFAULT_CELLULAR_PASSWORD

  # Configuration type for MeshInterface::get_default_instance(). [LOWPAN/THREAD/WISUN]
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

  # Max number IP addresses returned by multiple DNS query
  MBED_CONF_NSAPI_DNS_ADDRESSES_LIMIT=10

  # Enable network socket statistics
  MBED_CONF_NSAPI_SOCKET_STATS_ENABLED=0

  # Maximum number of socket statistics cached
  MBED_CONF_NSAPI_SOCKET_STATS_MAX_COUNT=10

  # Use external TLSSocket implementation.
  # Used network stack must support external TLSSocket setsockopt values (see nsapi_types.h)
  #MBED_CONF_NSAPI_OFFLOAD_TLSSOCKET

  # Default network interface type.
  # Typical options: null, ETHERNET, WIFI, CELLULAR, MESH
  MBED_CONF_TARGET_NETWORK_DEFAULT_INTERFACE_TYPE=WIFI
)
set(MBED_NETSOCKET_LINK_LIBRARIES
  mbed-tls-platform
  mbed-events
  mbed-nanostack-libservice
  mbed-cellular
)

add_library(mbed-netsocket STATIC EXCLUDE_FROM_ALL ${MBED_NETSOCKET_SOURCES})
target_include_directories(mbed-netsocket PUBLIC ${MBED_NETSOCKET_INCLUDE_DIRS})
target_compile_definitions(mbed-netsocket PUBLIC ${MBED_NETSOCKET_DEFINES})
target_link_libraries(mbed-netsocket PUBLIC ${MBED_NETSOCKET_LINK_LIBRARIES})
