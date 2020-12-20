if(NOT WHD IN_LIST COMPONENTS)
  return()
endif()

set(MBET_NETSOCKET_TESTS_DIR ${MBED_OS_DIR}/connectivity/netsocket/tests/TESTS/netsocket)

add_greentea_test(
  NAME
    netsocket-dns
  SOURCES
    ${MBET_NETSOCKET_TESTS_DIR}/dns/main.cpp
    ${MBET_NETSOCKET_TESTS_DIR}/dns/dns_tests.h
    ${MBET_NETSOCKET_TESTS_DIR}/dns/asynchronous_dns_cache.cpp
    ${MBET_NETSOCKET_TESTS_DIR}/dns/asynchronous_dns_cancel.cpp
    ${MBET_NETSOCKET_TESTS_DIR}/dns/asynchronous_dns.cpp
    ${MBET_NETSOCKET_TESTS_DIR}/dns/asynchronous_dns_external_event_queue.cpp
    ${MBET_NETSOCKET_TESTS_DIR}/dns/asynchronous_dns_invalid_host.cpp
    ${MBET_NETSOCKET_TESTS_DIR}/dns/asynchronous_dns_multi_ip.cpp
    ${MBET_NETSOCKET_TESTS_DIR}/dns/asynchronous_dns_non_async_and_async.cpp
    ${MBET_NETSOCKET_TESTS_DIR}/dns/asynchronous_dns_simultaneous_cache.cpp
    ${MBET_NETSOCKET_TESTS_DIR}/dns/asynchronous_dns_simultaneous.cpp
    ${MBET_NETSOCKET_TESTS_DIR}/dns/asynchronous_dns_simultaneous_repeat.cpp
    ${MBET_NETSOCKET_TESTS_DIR}/dns/asynchronous_dns_timeouts.cpp
    ${MBET_NETSOCKET_TESTS_DIR}/dns/synchronous_dns_cache.cpp
    ${MBET_NETSOCKET_TESTS_DIR}/dns/synchronous_dns.cpp
    ${MBET_NETSOCKET_TESTS_DIR}/dns/synchronous_dns_invalid.cpp
    ${MBET_NETSOCKET_TESTS_DIR}/dns/synchronous_dns_multi_ip.cpp
    ${MBET_NETSOCKET_TESTS_DIR}/dns/synchronous_dns_multiple.cpp
)

add_greentea_test(
  NAME
    netsocket-tcp
  SOURCES
    ${MBET_NETSOCKET_TESTS_DIR}/tcp/main.cpp
    ${MBET_NETSOCKET_TESTS_DIR}/tcp/tcp_tests.h
    ${MBET_NETSOCKET_TESTS_DIR}/tcp/tcpsocket_bind_address.cpp
    ${MBET_NETSOCKET_TESTS_DIR}/tcp/tcpsocket_bind_address_invalid.cpp
    ${MBET_NETSOCKET_TESTS_DIR}/tcp/tcpsocket_bind_port.cpp
    ${MBET_NETSOCKET_TESTS_DIR}/tcp/tcpsocket_bind_port_fail.cpp
    ${MBET_NETSOCKET_TESTS_DIR}/tcp/tcpsocket_bind_unopened.cpp
    ${MBET_NETSOCKET_TESTS_DIR}/tcp/tcpsocket_bind_wrong_type.cpp
    ${MBET_NETSOCKET_TESTS_DIR}/tcp/tcpsocket_connect_invalid.cpp
    ${MBET_NETSOCKET_TESTS_DIR}/tcp/tcpsocket_echotest_burst.cpp
    ${MBET_NETSOCKET_TESTS_DIR}/tcp/tcpsocket_echotest.cpp
    ${MBET_NETSOCKET_TESTS_DIR}/tcp/tcpsocket_endpoint_close.cpp
    ${MBET_NETSOCKET_TESTS_DIR}/tcp/tcpsocket_open_close_repeat.cpp
    ${MBET_NETSOCKET_TESTS_DIR}/tcp/tcpsocket_open_destruct.cpp
    ${MBET_NETSOCKET_TESTS_DIR}/tcp/tcpsocket_open_limit.cpp
    ${MBET_NETSOCKET_TESTS_DIR}/tcp/tcpsocket_open_twice.cpp
    ${MBET_NETSOCKET_TESTS_DIR}/tcp/tcpsocket_recv_100k.cpp
    ${MBET_NETSOCKET_TESTS_DIR}/tcp/tcpsocket_recv_timeout.cpp
    ${MBET_NETSOCKET_TESTS_DIR}/tcp/tcpsocket_send_repeat.cpp
    ${MBET_NETSOCKET_TESTS_DIR}/tcp/tcpsocket_send_timeout.cpp
    ${MBET_NETSOCKET_TESTS_DIR}/tcp/tcpsocket_setsockopt_keepalive_valid.cpp
    ${MBET_NETSOCKET_TESTS_DIR}/tcp/tcpsocket_thread_per_socket_safety.cpp
)

add_greentea_test(
  NAME
    netsocket-tls
  SOURCES
    ${MBET_NETSOCKET_TESTS_DIR}/tls/main.cpp
    ${MBET_NETSOCKET_TESTS_DIR}/tls/cert.h
    ${MBET_NETSOCKET_TESTS_DIR}/tls/tls_tests.h
    ${MBET_NETSOCKET_TESTS_DIR}/tls/tlssocket_connect_invalid.cpp
    ${MBET_NETSOCKET_TESTS_DIR}/tls/tlssocket_echotest_burst.cpp
    ${MBET_NETSOCKET_TESTS_DIR}/tls/tlssocket_echotest.cpp
    ${MBET_NETSOCKET_TESTS_DIR}/tls/tlssocket_endpoint_close.cpp
    ${MBET_NETSOCKET_TESTS_DIR}/tls/tlssocket_handshake_invalid.cpp
    ${MBET_NETSOCKET_TESTS_DIR}/tls/tlssocket_no_cert.cpp
    ${MBET_NETSOCKET_TESTS_DIR}/tls/tlssocket_open_destruct.cpp
    ${MBET_NETSOCKET_TESTS_DIR}/tls/tlssocket_open_limit.cpp
    ${MBET_NETSOCKET_TESTS_DIR}/tls/tlssocket_open_twice.cpp
    ${MBET_NETSOCKET_TESTS_DIR}/tls/tlssocket_recv_timeout.cpp
    ${MBET_NETSOCKET_TESTS_DIR}/tls/tlssocket_send_closed.cpp
    ${MBET_NETSOCKET_TESTS_DIR}/tls/tlssocket_send_repeat.cpp
    ${MBET_NETSOCKET_TESTS_DIR}/tls/tlssocket_send_timeout.cpp
    ${MBET_NETSOCKET_TESTS_DIR}/tls/tlssocket_send_unconnected.cpp
    ${MBET_NETSOCKET_TESTS_DIR}/tls/tlssocket_simultaneous.cpp
)

add_greentea_test(
  NAME
    netsocket-udp
  SOURCES
    ${MBET_NETSOCKET_TESTS_DIR}/udp/main.cpp
    ${MBET_NETSOCKET_TESTS_DIR}/udp/udp_tests.h
    ${MBET_NETSOCKET_TESTS_DIR}/udp/udpsocket_bind_address.cpp
    ${MBET_NETSOCKET_TESTS_DIR}/udp/udpsocket_bind_address_invalid.cpp
    ${MBET_NETSOCKET_TESTS_DIR}/udp/udpsocket_bind_address_null.cpp
    ${MBET_NETSOCKET_TESTS_DIR}/udp/udpsocket_bind_port.cpp
    ${MBET_NETSOCKET_TESTS_DIR}/udp/udpsocket_bind_port_fail.cpp
    ${MBET_NETSOCKET_TESTS_DIR}/udp/udpsocket_bind_unopened.cpp
    ${MBET_NETSOCKET_TESTS_DIR}/udp/udpsocket_bind_wrong_type.cpp
    ${MBET_NETSOCKET_TESTS_DIR}/udp/udpsocket_echotest_burst.cpp
    ${MBET_NETSOCKET_TESTS_DIR}/udp/udpsocket_echotest.cpp
    ${MBET_NETSOCKET_TESTS_DIR}/udp/udpsocket_open_close_repeat.cpp
    ${MBET_NETSOCKET_TESTS_DIR}/udp/udpsocket_open_destruct.cpp
    ${MBET_NETSOCKET_TESTS_DIR}/udp/udpsocket_open_limit.cpp
    ${MBET_NETSOCKET_TESTS_DIR}/udp/udpsocket_open_twice.cpp
    ${MBET_NETSOCKET_TESTS_DIR}/udp/udpsocket_recv_timeout.cpp
    ${MBET_NETSOCKET_TESTS_DIR}/udp/udpsocket_sendto_invalid.cpp
    ${MBET_NETSOCKET_TESTS_DIR}/udp/udpsocket_sendto_repeat.cpp
    ${MBET_NETSOCKET_TESTS_DIR}/udp/udpsocket_sendto_timeout.cpp
)
