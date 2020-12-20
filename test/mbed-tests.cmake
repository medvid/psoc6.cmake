# Define <TARGET_NAME>_GREENTEA target to execute mbedhtrun
macro(add_greentea_test)
  psoc6_add_executable(
    LINK_LIBRARIES
      mbed-utest
    ${ARGN}
  )
  # Define custom command for CMSIS-DAP programming
  add_custom_target(${TARGET_NAME}_GREENTEA
    # TODO: customizable path to python environment
    # TODO: customizable target ID
    COMMAND mbedhtrun
      -p /dev/ttyACM0:115200
      -f ${CMAKE_CURRENT_BINARY_DIR}/${TARGET_NAME}.hex
      -t 190113018b060816028b060800000000000000002e127069
      --sync 1 -P 60 -r pyocd -c pyocd -C 0
    DEPENDS ${TARGET_NAME}
    COMMENT "Run greentea test ${TARGET_NAME}"
    VERBATIM USES_TERMINAL
  )
endmacro()

# Add test libraries
include(test/mbed-unity.cmake)
include(test/mbed-greentea-client.cmake)
include(test/mbed-utest.cmake)

# Add test cases
include(test/mbed-drivers-tests.cmake)
include(test/mbed-platform-tests.cmake)
include(test/mbed-netsocket-tests.cmake)
