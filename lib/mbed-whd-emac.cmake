set(MBED_WHD_EMAC_DIR ${MBED_OS_DIR}/features/netsocket/emac-drivers/TARGET_Cypress/COMPONENT_WHD)
set(MBED_WHD_EMAC_SOURCES
  ${MBED_WHD_EMAC_DIR}/interface/CyDhcpServer.h
  ${MBED_WHD_EMAC_DIR}/interface/CyDhcpServer.cpp
  ${MBED_WHD_EMAC_DIR}/interface/WhdAccessPoint.h
  ${MBED_WHD_EMAC_DIR}/interface/WhdAccessPoint.cpp
  ${MBED_WHD_EMAC_DIR}/interface/WhdSTAInterface.h
  ${MBED_WHD_EMAC_DIR}/interface/WhdSTAInterface.cpp
  ${MBED_WHD_EMAC_DIR}/interface/WhdSoftAPInterface.h
  ${MBED_WHD_EMAC_DIR}/interface/WhdSoftAPInterface.cpp
  ${MBED_WHD_EMAC_DIR}/interface/emac_eapol.h
  ${MBED_WHD_EMAC_DIR}/interface/whd_emac.h
  ${MBED_WHD_EMAC_DIR}/interface/whd_emac.cpp
  ${MBED_WHD_EMAC_DIR}/interface/whd_interface.h
  ${MBED_WHD_EMAC_DIR}/interface/whd_interface.cpp
  ${MBED_WHD_EMAC_DIR}/network/whd_network.h
  ${MBED_WHD_EMAC_DIR}/utils/cydhcp_server_debug.cpp
  ${MBED_WHD_EMAC_DIR}/utils/cynetwork_utils.h
  ${MBED_WHD_EMAC_DIR}/utils/cynetwork_utils.c
)
set(MBED_WHD_EMAC_INCLUDE_DIRS
  ${MBED_WHD_EMAC_DIR}/interface
  ${MBED_WHD_EMAC_DIR}/utils
)
set(MBED_WHD_EMAC_LINK_LIBRARIES
  wifi-host-driver
  whd-bsp-integration
  mbed-netsocket
  mbed-lwip
  mbed-lwip-sys
  mbed-lwipstack
)

add_library(mbed-whd-emac STATIC EXCLUDE_FROM_ALL ${MBED_WHD_EMAC_SOURCES})
target_include_directories(mbed-whd-emac PUBLIC ${MBED_WHD_EMAC_INCLUDE_DIRS})
target_link_libraries(mbed-whd-emac PUBLIC ${MBED_WHD_EMAC_LINK_LIBRARIES})
