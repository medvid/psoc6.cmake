psoc6_load_library(
  NAME mbed-os
  VERSION 6.0.0-beta-1
  URL https://github.com/ARMmbed/mbed-os
  TAG mbed-os-6.0.0-beta-1
)

include(lib/mbed-platform.cmake)
include(lib/mbed-drivers.cmake)
include(lib/mbed-hal.cmake)
include(lib/mbed-rtos.cmake)
include(lib/mbed-target.cmake)
include(lib/mbed-blockdevice.cmake)
include(lib/mbed-tls.cmake)
include(lib/mbed-trace.cmake)
include(lib/mbed-filesystem.cmake)
include(lib/mbed-littlefs.cmake)
include(lib/mbed-fatfs.cmake)
include(lib/mbed-flashiap.cmake)
include(lib/mbed-kvstore.cmake)
include(lib/mbed-qcbor.cmake)
include(lib/mbed-tcose.cmake)
include(lib/mbed-psa.cmake)
include(lib/mbed-tls-platform.cmake)
include(lib/mbed-events.cmake)
include(lib/mbed-client-randlib.cmake)
include(lib/mbed-nanostack-libservice.cmake)
include(lib/mbed-nanostack-hal.cmake)
include(lib/mbed-nanostack-eventloop.cmake)
include(lib/mbed-netsocket.cmake)
include(lib/mbed-lwip.cmake)
include(lib/mbed-lwip-sys.cmake)
include(lib/mbed-lwipstack.cmake)
include(lib/mbed-whd-emac.cmake)
