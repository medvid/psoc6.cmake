psoc6_load_library(
  NAME secure-sockets
  VERSION 1.0.1
)

set(SECURE_SOCKETS_SOURCES
  ${SECURE_SOCKETS_DIR}/include/cy_secure_sockets.h
  ${SECURE_SOCKETS_DIR}/include/cy_secure_sockets_debug.h
  ${SECURE_SOCKETS_DIR}/include/cy_secure_sockets_error.h
  ${SECURE_SOCKETS_DIR}/include/cy_tls.h
  ${SECURE_SOCKETS_DIR}/include/cy_tls_debug.h
  ${SECURE_SOCKETS_DIR}/source/COMPONENT_LWIP/cy_secure_sockets.c
  ${SECURE_SOCKETS_DIR}/source/COMPONENT_MBEDTLS/cy_tls.c
)
set(SECURE_SOCKETS_INCLUDE_DIRS
  ${SECURE_SOCKETS_DIR}/include
)
set(SECURE_SOCKETS_LIBRARIES
  psoc6hal
  abstraction-rtos
  lwip
  mbedtls
  connectivity-utilities
)

add_library(secure-sockets STATIC ${SECURE_SOCKETS_SOURCES})
target_include_directories(secure-sockets PUBLIC ${SECURE_SOCKETS_INCLUDE_DIRS})
target_link_libraries(secure-sockets PUBLIC ${SECURE_SOCKETS_LIBRARIES})
