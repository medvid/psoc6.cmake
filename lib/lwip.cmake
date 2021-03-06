psoc6_load_library(
  NAME lwip
  VERSION 2.1.2
  URL https://git.savannah.nongnu.org/git/lwip
  TAG STABLE-2_1_2_RELEASE
)

set(LWIP_SOURCES
  ${LWIP_DIR}/src/include/lwip/altcp_tcp.h
  ${LWIP_DIR}/src/include/lwip/altcp_tls.h
  ${LWIP_DIR}/src/include/lwip/api.h
  ${LWIP_DIR}/src/include/lwip/arch.h
  ${LWIP_DIR}/src/include/lwip/autoip.h
  ${LWIP_DIR}/src/include/lwip/debug.h
  ${LWIP_DIR}/src/include/lwip/def.h
  ${LWIP_DIR}/src/include/lwip/dhcp.h
  ${LWIP_DIR}/src/include/lwip/dhcp6.h
  ${LWIP_DIR}/src/include/lwip/dns.h
  ${LWIP_DIR}/src/include/lwip/err.h
  ${LWIP_DIR}/src/include/lwip/errno.h
  ${LWIP_DIR}/src/include/lwip/etharp.h
  ${LWIP_DIR}/src/include/lwip/ethip6.h
  ${LWIP_DIR}/src/include/lwip/icmp.h
  ${LWIP_DIR}/src/include/lwip/icmp6.h
  ${LWIP_DIR}/src/include/lwip/if_api.h
  ${LWIP_DIR}/src/include/lwip/igmp.h
  ${LWIP_DIR}/src/include/lwip/inet.h
  ${LWIP_DIR}/src/include/lwip/inet_chksum.h
  ${LWIP_DIR}/src/include/lwip/init.h
  ${LWIP_DIR}/src/include/lwip/ip.h
  ${LWIP_DIR}/src/include/lwip/ip4.h
  ${LWIP_DIR}/src/include/lwip/ip4_addr.h
  ${LWIP_DIR}/src/include/lwip/ip4_frag.h
  ${LWIP_DIR}/src/include/lwip/ip6.h
  ${LWIP_DIR}/src/include/lwip/ip6_addr.h
  ${LWIP_DIR}/src/include/lwip/ip6_frag.h
  ${LWIP_DIR}/src/include/lwip/ip6_zone.h
  ${LWIP_DIR}/src/include/lwip/ip_addr.h
  ${LWIP_DIR}/src/include/lwip/mem.h
  ${LWIP_DIR}/src/include/lwip/memp.h
  ${LWIP_DIR}/src/include/lwip/mld6.h
  ${LWIP_DIR}/src/include/lwip/nd6.h
  ${LWIP_DIR}/src/include/lwip/netbuf.h
  ${LWIP_DIR}/src/include/lwip/netdb.h
  ${LWIP_DIR}/src/include/lwip/netif.h
  ${LWIP_DIR}/src/include/lwip/netifapi.h
  ${LWIP_DIR}/src/include/lwip/opt.h
  ${LWIP_DIR}/src/include/lwip/pbuf.h
  ${LWIP_DIR}/src/include/lwip/raw.h
  ${LWIP_DIR}/src/include/lwip/sio.h
  ${LWIP_DIR}/src/include/lwip/snmp.h
  ${LWIP_DIR}/src/include/lwip/sockets.h
  ${LWIP_DIR}/src/include/lwip/stats.h
  ${LWIP_DIR}/src/include/lwip/sys.h
  ${LWIP_DIR}/src/include/lwip/tcp.h
  ${LWIP_DIR}/src/include/lwip/tcpbase.h
  ${LWIP_DIR}/src/include/lwip/tcpip.h
  ${LWIP_DIR}/src/include/lwip/timeouts.h
  ${LWIP_DIR}/src/include/lwip/udp.h
  ${LWIP_DIR}/src/include/lwip/priv/altcp_priv.h
  ${LWIP_DIR}/src/include/lwip/priv/api_msg.h
  ${LWIP_DIR}/src/include/lwip/priv/mem_priv.h
  ${LWIP_DIR}/src/include/lwip/priv/memp_priv.h
  ${LWIP_DIR}/src/include/lwip/priv/memp_std.h
  ${LWIP_DIR}/src/include/lwip/priv/nd6_priv.h
  ${LWIP_DIR}/src/include/lwip/priv/raw_priv.h
  ${LWIP_DIR}/src/include/lwip/priv/sockets_priv.h
  ${LWIP_DIR}/src/include/lwip/priv/tcp_priv.h
  ${LWIP_DIR}/src/include/lwip/priv/tcpip_priv.h
  ${LWIP_DIR}/src/include/lwip/prot/autoip.h
  ${LWIP_DIR}/src/include/lwip/prot/dhcp.h
  ${LWIP_DIR}/src/include/lwip/prot/dhcp6.h
  ${LWIP_DIR}/src/include/lwip/prot/dns.h
  ${LWIP_DIR}/src/include/lwip/prot/etharp.h
  ${LWIP_DIR}/src/include/lwip/prot/ethernet.h
  ${LWIP_DIR}/src/include/lwip/prot/iana.h
  ${LWIP_DIR}/src/include/lwip/prot/icmp.h
  ${LWIP_DIR}/src/include/lwip/prot/icmp6.h
  ${LWIP_DIR}/src/include/lwip/prot/ieee.h
  ${LWIP_DIR}/src/include/lwip/prot/igmp.h
  ${LWIP_DIR}/src/include/lwip/prot/ip.h
  ${LWIP_DIR}/src/include/lwip/prot/ip4.h
  ${LWIP_DIR}/src/include/lwip/prot/ip6.h
  ${LWIP_DIR}/src/include/lwip/prot/mld6.h
  ${LWIP_DIR}/src/include/lwip/prot/nd6.h
  ${LWIP_DIR}/src/include/lwip/prot/tcp.h
  ${LWIP_DIR}/src/include/lwip/prot/udp.h
  ${LWIP_DIR}/src/core/init.c
  ${LWIP_DIR}/src/core/def.c
  ${LWIP_DIR}/src/core/dns.c
  ${LWIP_DIR}/src/core/inet_chksum.c
  ${LWIP_DIR}/src/core/ip.c
  ${LWIP_DIR}/src/core/mem.c
  ${LWIP_DIR}/src/core/memp.c
  ${LWIP_DIR}/src/core/netif.c
  ${LWIP_DIR}/src/core/pbuf.c
  ${LWIP_DIR}/src/core/raw.c
  ${LWIP_DIR}/src/core/stats.c
  ${LWIP_DIR}/src/core/sys.c
  ${LWIP_DIR}/src/core/altcp.c
  ${LWIP_DIR}/src/core/altcp_alloc.c
  ${LWIP_DIR}/src/core/altcp_tcp.c
  ${LWIP_DIR}/src/core/tcp.c
  ${LWIP_DIR}/src/core/tcp_in.c
  ${LWIP_DIR}/src/core/tcp_out.c
  ${LWIP_DIR}/src/core/timeouts.c
  ${LWIP_DIR}/src/core/udp.c
  ${LWIP_DIR}/src/core/ipv4/autoip.c
  ${LWIP_DIR}/src/core/ipv4/dhcp.c
  ${LWIP_DIR}/src/core/ipv4/etharp.c
  ${LWIP_DIR}/src/core/ipv4/icmp.c
  ${LWIP_DIR}/src/core/ipv4/igmp.c
  ${LWIP_DIR}/src/core/ipv4/ip4_frag.c
  ${LWIP_DIR}/src/core/ipv4/ip4.c
  ${LWIP_DIR}/src/core/ipv4/ip4_addr.c
  ${LWIP_DIR}/src/core/ipv6/dhcp6.c
  ${LWIP_DIR}/src/core/ipv6/ethip6.c
  ${LWIP_DIR}/src/core/ipv6/icmp6.c
  ${LWIP_DIR}/src/core/ipv6/inet6.c
  ${LWIP_DIR}/src/core/ipv6/ip6.c
  ${LWIP_DIR}/src/core/ipv6/ip6_addr.c
  ${LWIP_DIR}/src/core/ipv6/ip6_frag.c
  ${LWIP_DIR}/src/core/ipv6/mld6.c
  ${LWIP_DIR}/src/core/ipv6/nd6.c
  ${LWIP_DIR}/src/api/api_lib.c
  ${LWIP_DIR}/src/api/api_msg.c
  ${LWIP_DIR}/src/api/err.c
  ${LWIP_DIR}/src/api/if_api.c
  ${LWIP_DIR}/src/api/netbuf.c
  ${LWIP_DIR}/src/api/netdb.c
  ${LWIP_DIR}/src/api/netifapi.c
  ${LWIP_DIR}/src/api/sockets.c
  ${LWIP_DIR}/src/api/tcpip.c
  ${LWIP_DIR}/src/netif/ethernet.c
  ${LWIP_DIR}/src/netif/bridgeif.c
  ${LWIP_DIR}/src/netif/bridgeif_fdb.c
  ${LWIP_DIR}/src/netif/slipif.c
  ${LWIP_DIR}/src/netif/lowpan6_common.c
  ${LWIP_DIR}/src/netif/lowpan6.c
  ${LWIP_DIR}/src/netif/lowpan6_ble.c
  ${LWIP_DIR}/src/netif/zepif.c
)
set(LWIP_INCLUDE_DIRS
  ${CMAKE_SOURCE_DIR}/configs/lwip
  ${LWIP_DIR}/src/include
  # BUG: netdb.h included directly
  ${LWIP_DIR}/src/include/lwip
  # BUG: ethernet.h included directly
  ${LWIP_DIR}/src/include/lwip/prot
)
set(LWIP_LIBRARIES
  # lwipopts.h includes whd_types.h
  wifi-host-driver
)

add_library(lwip STATIC ${LWIP_SOURCES})
target_include_directories(lwip PUBLIC ${LWIP_INCLUDE_DIRS})
target_link_libraries(lwip PUBLIC ${LWIP_LIBRARIES})
