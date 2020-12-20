# This application provides custom design.modus for the below boards
psoc6_check_bsp(
  CY8CKIT-062-BLE
  CY8CKIT-062-WIFI-BT
  CY8CKIT-062S2-43012
  CY8CKIT-064B0S2-4343W
  CY8CPROTO-062-4343W
  CY8CPROTO-062S3-4343W
  CYW9P62S1-43012EVB-01
  CYW9P62S1-43438EVB-01
)

project(low-power-capsense-freertos)

psoc6_load_application(
  NAME mtb-example-psoc6-low-power-capsense-freertos
  VERSION 1.0.0
)
psoc6_add_executable(
  SOURCES
    ${APP_DIR}/source/main.c
    ${APP_DIR}/source/capsense.h
    ${APP_DIR}/source/capsense.c
    ${APP_DIR}/source/low_power_config.h
    ${APP_DIR}/source/TARGET_${BSP_NAME}/low_power_config.c
  INCLUDE_DIRS
    ${APP_DIR}/source
  LINK_LIBRARIES
    capsense
    mtb-hal-cat1
    retarget-io
    freertos
  LINKER_SCRIPT
    ${APP_DIR}/linker_script/TARGET_${BSP_NAME}/COMPONENT_CM4/TOOLCHAIN_${MTB_TOOLCHAIN}/${BSP_LINKER_SCRIPT_NAME}${TOOLCHAIN_SUFFIX_LS}
  DESIGN_MODUS
    ${APP_DIR}/COMPONENT_CUSTOM_DESIGN_MODUS/TARGET_${BSP_NAME}/design.modus
  DESIGN_CAPSENSE
    ${APP_DIR}/COMPONENT_CUSTOM_DESIGN_MODUS/TARGET_${BSP_NAME}/design.cycapsense
)
