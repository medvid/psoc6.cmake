if(NOT TARGET wifi-host-driver)
  return()
endif()

add_greentea_test(
  NAME
    netsocket-dns
  SOURCES
    ${MBED_OS_DIR}/TESTS/netsocket/dns/main.cpp
    ${MBED_OS_DIR}/TESTS/netsocket/dns/dns_tests.h
    ${MBED_OS_DIR}/TESTS/netsocket/dns/asynchronous_dns_cache.cpp
    ${MBED_OS_DIR}/TESTS/netsocket/dns/asynchronous_dns_cancel.cpp
    ${MBED_OS_DIR}/TESTS/netsocket/dns/asynchronous_dns.cpp
    ${MBED_OS_DIR}/TESTS/netsocket/dns/asynchronous_dns_external_event_queue.cpp
    ${MBED_OS_DIR}/TESTS/netsocket/dns/asynchronous_dns_invalid_host.cpp
    ${MBED_OS_DIR}/TESTS/netsocket/dns/asynchronous_dns_multi_ip.cpp
    ${MBED_OS_DIR}/TESTS/netsocket/dns/asynchronous_dns_non_async_and_async.cpp
    ${MBED_OS_DIR}/TESTS/netsocket/dns/asynchronous_dns_simultaneous_cache.cpp
    ${MBED_OS_DIR}/TESTS/netsocket/dns/asynchronous_dns_simultaneous.cpp
    ${MBED_OS_DIR}/TESTS/netsocket/dns/asynchronous_dns_simultaneous_repeat.cpp
    ${MBED_OS_DIR}/TESTS/netsocket/dns/asynchronous_dns_timeouts.cpp
    ${MBED_OS_DIR}/TESTS/netsocket/dns/synchronous_dns_cache.cpp
    ${MBED_OS_DIR}/TESTS/netsocket/dns/synchronous_dns.cpp
    ${MBED_OS_DIR}/TESTS/netsocket/dns/synchronous_dns_invalid.cpp
    ${MBED_OS_DIR}/TESTS/netsocket/dns/synchronous_dns_multi_ip.cpp
    ${MBED_OS_DIR}/TESTS/netsocket/dns/synchronous_dns_multiple.cpp
  LINK_LIBRARIES
    mbed-target
    mbed-tls-platform
    mbed-whd-emac
    mbed-utest
)

add_greentea_test(
  NAME
    netsocket-tcp
  SOURCES
    ${MBED_OS_DIR}/TESTS/netsocket/tcp/main.cpp
    ${MBED_OS_DIR}/TESTS/netsocket/tcp/tcp_tests.h
    ${MBED_OS_DIR}/TESTS/netsocket/tcp/tcpsocket_bind_address.cpp
    ${MBED_OS_DIR}/TESTS/netsocket/tcp/tcpsocket_bind_address_invalid.cpp
    ${MBED_OS_DIR}/TESTS/netsocket/tcp/tcpsocket_bind_port.cpp
    ${MBED_OS_DIR}/TESTS/netsocket/tcp/tcpsocket_bind_port_fail.cpp
    ${MBED_OS_DIR}/TESTS/netsocket/tcp/tcpsocket_bind_unopened.cpp
    ${MBED_OS_DIR}/TESTS/netsocket/tcp/tcpsocket_bind_wrong_type.cpp
    ${MBED_OS_DIR}/TESTS/netsocket/tcp/tcpsocket_connect_invalid.cpp
    ${MBED_OS_DIR}/TESTS/netsocket/tcp/tcpsocket_echotest_burst.cpp
    ${MBED_OS_DIR}/TESTS/netsocket/tcp/tcpsocket_echotest.cpp
    ${MBED_OS_DIR}/TESTS/netsocket/tcp/tcpsocket_endpoint_close.cpp
    ${MBED_OS_DIR}/TESTS/netsocket/tcp/tcpsocket_open_close_repeat.cpp
    ${MBED_OS_DIR}/TESTS/netsocket/tcp/tcpsocket_open_destruct.cpp
    ${MBED_OS_DIR}/TESTS/netsocket/tcp/tcpsocket_open_limit.cpp
    ${MBED_OS_DIR}/TESTS/netsocket/tcp/tcpsocket_open_twice.cpp
    ${MBED_OS_DIR}/TESTS/netsocket/tcp/tcpsocket_recv_100k.cpp
    ${MBED_OS_DIR}/TESTS/netsocket/tcp/tcpsocket_recv_timeout.cpp
    ${MBED_OS_DIR}/TESTS/netsocket/tcp/tcpsocket_send_repeat.cpp
    ${MBED_OS_DIR}/TESTS/netsocket/tcp/tcpsocket_send_timeout.cpp
    ${MBED_OS_DIR}/TESTS/netsocket/tcp/tcpsocket_setsockopt_keepalive_valid.cpp
    ${MBED_OS_DIR}/TESTS/netsocket/tcp/tcpsocket_thread_per_socket_safety.cpp
  LINK_LIBRARIES
    mbed-target
    mbed-tls-platform
    mbed-whd-emac
    mbed-utest
)

add_greentea_test(
  NAME
    netsocket-tls
  SOURCES
    ${MBED_OS_DIR}/TESTS/netsocket/tls/main.cpp
    ${MBED_OS_DIR}/TESTS/netsocket/tls/cert.h
    ${MBED_OS_DIR}/TESTS/netsocket/tls/tls_tests.h
    ${MBED_OS_DIR}/TESTS/netsocket/tls/tlssocket_connect_invalid.cpp
    ${MBED_OS_DIR}/TESTS/netsocket/tls/tlssocket_echotest_burst.cpp
    ${MBED_OS_DIR}/TESTS/netsocket/tls/tlssocket_echotest.cpp
    ${MBED_OS_DIR}/TESTS/netsocket/tls/tlssocket_endpoint_close.cpp
    ${MBED_OS_DIR}/TESTS/netsocket/tls/tlssocket_handshake_invalid.cpp
    ${MBED_OS_DIR}/TESTS/netsocket/tls/tlssocket_no_cert.cpp
    ${MBED_OS_DIR}/TESTS/netsocket/tls/tlssocket_open_destruct.cpp
    ${MBED_OS_DIR}/TESTS/netsocket/tls/tlssocket_open_limit.cpp
    ${MBED_OS_DIR}/TESTS/netsocket/tls/tlssocket_open_twice.cpp
    ${MBED_OS_DIR}/TESTS/netsocket/tls/tlssocket_recv_timeout.cpp
    ${MBED_OS_DIR}/TESTS/netsocket/tls/tlssocket_send_closed.cpp
    ${MBED_OS_DIR}/TESTS/netsocket/tls/tlssocket_send_repeat.cpp
    ${MBED_OS_DIR}/TESTS/netsocket/tls/tlssocket_send_timeout.cpp
    ${MBED_OS_DIR}/TESTS/netsocket/tls/tlssocket_send_unconnected.cpp
    ${MBED_OS_DIR}/TESTS/netsocket/tls/tlssocket_simultaneous.cpp
  LINK_LIBRARIES
    mbed-target
    mbed-tls-platform
    mbed-whd-emac
    mbed-utest
)

add_greentea_test(
  NAME
    netsocket-udp
  SOURCES
    ${MBED_OS_DIR}/TESTS/netsocket/udp/main.cpp
    ${MBED_OS_DIR}/TESTS/netsocket/udp/udp_tests.h
    ${MBED_OS_DIR}/TESTS/netsocket/udp/udpsocket_bind_address.cpp
    ${MBED_OS_DIR}/TESTS/netsocket/udp/udpsocket_bind_address_invalid.cpp
    ${MBED_OS_DIR}/TESTS/netsocket/udp/udpsocket_bind_address_null.cpp
    ${MBED_OS_DIR}/TESTS/netsocket/udp/udpsocket_bind_port.cpp
    ${MBED_OS_DIR}/TESTS/netsocket/udp/udpsocket_bind_port_fail.cpp
    ${MBED_OS_DIR}/TESTS/netsocket/udp/udpsocket_bind_unopened.cpp
    ${MBED_OS_DIR}/TESTS/netsocket/udp/udpsocket_bind_wrong_type.cpp
    ${MBED_OS_DIR}/TESTS/netsocket/udp/udpsocket_echotest_burst.cpp
    ${MBED_OS_DIR}/TESTS/netsocket/udp/udpsocket_echotest.cpp
    ${MBED_OS_DIR}/TESTS/netsocket/udp/udpsocket_open_close_repeat.cpp
    ${MBED_OS_DIR}/TESTS/netsocket/udp/udpsocket_open_destruct.cpp
    ${MBED_OS_DIR}/TESTS/netsocket/udp/udpsocket_open_limit.cpp
    ${MBED_OS_DIR}/TESTS/netsocket/udp/udpsocket_open_twice.cpp
    ${MBED_OS_DIR}/TESTS/netsocket/udp/udpsocket_recv_timeout.cpp
    ${MBED_OS_DIR}/TESTS/netsocket/udp/udpsocket_sendto_invalid.cpp
    ${MBED_OS_DIR}/TESTS/netsocket/udp/udpsocket_sendto_repeat.cpp
    ${MBED_OS_DIR}/TESTS/netsocket/udp/udpsocket_sendto_timeout.cpp
  LINK_LIBRARIES
    mbed-target
    mbed-tls-platform
    mbed-whd-emac
    mbed-utest
)