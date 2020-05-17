# https://cmake.org/cmake/help/latest/command/include_guard.html
include_guard(GLOBAL)

# https://cmake.org/cmake/help/latest/module/FetchContent.html
# https://cliutils.gitlab.io/modern-cmake/chapters/projects/fetch.html
include(FetchContent)

# Set paths to the ModusToolbox tools:
# CY_TOOLS_PATHS - base tools directory (ModusToolbox/tools_X.Y)
# CY_TOOL_CFG_BACKEND_CLI - Device Configurator Backend CLI
# CY_TOOL_CAPSENSE_CLI - CapSense Configurator CLI
# CY_TOOL_QSPI_CLI - QSPI Configurator CLI
# CY_TOOL_USBDEV_CLI - USB Device Configurator CLI
# CY_TOOL_SEGLCD_CLI - Segment LCD Configurator CLI
# CY_TOOL_BT_CLI - Bluetooth Configurator CLI
#
# This macro can be used in one of two ways:
#
# A. Define CY_TOOLS_PATHS as CMake option or system environment variable
#    Example:
#      cmake -DCY_TOOLS_PATHS=C:/ModusToolbox/tools_2.1
#      psoc6_add_tools()
#
# B. Pass optional VERSION argument to this macro to find the ModusToolbox
#    tools at the default location:
#    Windows: ${USERPROFILE}/ModusToolbox/tools_${VERSION}
#    Linux:   ${HOME}/ModusToolbox/tools_${VERSION}
#    MacOS:   /Applications/ModusToolbox/tools_${VERSION}
#    Example:
#      psoc6_add_tools(VERSION 2.1)
#
macro(psoc6_add_tools)
  # Check CY_TOOLS_PATHS is set as environment variable
  if(NOT DEFINED CY_TOOLS_PATHS AND DEFINED ENV{CY_TOOLS_PATHS})
    set(CY_TOOLS_PATHS "$ENV{CY_TOOLS_PATHS}")
  endif()

  # Try to determine the default path for a provided tools VERSION
  if(NOT DEFINED CY_TOOLS_PATHS)
    # Parse the expected one-value arguments
    cmake_parse_arguments(TOOLS "" "VERSION" "" ${ARGN})

    # VERSION is the required argument
    if(NOT DEFINED TOOLS_VERSION)
      message(FATAL_ERROR "psoc6_add_tools: missing required VERSION argument.")
    endif()

    # Determine the default path to ModusToolbox installation
    if(WIN32) # Windows
      set(MODUSTOOLBOX_DIR "$ENV{USERPROFILE}/ModusToolbox")
    elseif(APPLE) # MacOS
      set(MODUSTOOLBOX_DIR "/Applications/ModusToolbox")
    else() # Linux
      set(MODUSTOOLBOX_DIR "$ENV{HOME}/ModusToolbox")
    endif()

    set(CY_TOOLS_PATHS ${MODUSTOOLBOX_DIR}/tools_${TOOLS_VERSION})

    # Clear the local variables
    unset(MODUSTOOLBOX_DIR)
  endif()

  # Check the directory exists
  if(NOT IS_DIRECTORY ${CY_TOOLS_PATHS})
    message(FATAL_ERROR "psoc6_add_tools: CY_TOOLS_PATHS=${CY_TOOLS_PATHS} doesn't exist.")
  endif()

  # Convert Windows path (C:\Users) to UNIX path (C:/Users)
  STRING(REGEX REPLACE "\\\\" "/" CY_TOOLS_PATHS ${CY_TOOLS_PATHS})

  # Diagnostic output
  message(STATUS "CY_TOOLS_PATHS=${CY_TOOLS_PATHS}")

  # Set ModusToolbox tool paths
  set(CY_TOOL_CFG_BACKEND_CLI ${CY_TOOLS_PATHS}/cfg-backend-cli/cfg-backend-cli)
  set(CY_TOOL_CAPSENSE_CLI ${CY_TOOLS_PATHS}/capsense-configurator/capsense-configurator-cli)
  set(CY_TOOL_QSPI_CLI ${CY_TOOLS_PATHS}/qspi-configurator/qspi-configurator-cli)
  set(CY_TOOL_USBDEV_CLI ${CY_TOOLS_PATHS}/usbdev-configurator/usbdev-configurator-cli)
  set(CY_TOOL_SEGLCD_CLI ${CY_TOOLS_PATHS}/seglcd-configurator/seglcd-configurator-cli)
  set(CY_TOOL_BT_CLI ${CY_TOOLS_PATHS}/bt-configurator/bt-configurator-cli)

  # Set OpenOCD related paths
  set(CY_OPENOCD_BIN ${CY_TOOLS_PATHS}/openocd/bin/openocd)
  set(CY_OPENOCD_SCRIPTS ${CY_TOOLS_PATHS}/openocd/scripts)
endmacro()

# Configure toolchain definitions
macro(psoc6_configure_toolchain)
  set(TOOLCHAIN GCC CACHE STRING "Target toolchain")
  set_property(CACHE TOOLCHAIN PROPERTY STRINGS GCC ARM IAR)

  set(_toolchain_cmake ${CMAKE_CURRENT_SOURCE_DIR}/toolchain/${TOOLCHAIN}.cmake)
  if(NOT EXISTS ${_toolchain_cmake})
    message(FATAL_ERROR "Invalid TOOLCHAIN: ${TOOLCHAIN}.")
  endif()
  include(${_toolchain_cmake})
  unset(_toolchain_cmake)
endmacro()

# Configure BSP target definitions
macro(psoc6_configure_bsp)
  set(TARGET "" CACHE STRING "Target BSP")
  if("${TARGET}" STREQUAL "")
    message(FATAL_ERROR "psoc6_configure_bsp: TARGET is not set.")
  endif()

  set(_bsp_cmake ${CMAKE_CURRENT_SOURCE_DIR}/bsp/${TARGET}.cmake)
  if(NOT EXISTS ${_bsp_cmake})
    message(FATAL_ERROR "psoc6_configure_bsp: invalid TARGET: ${TARGET}.")
  endif()
  include(${_bsp_cmake})
  unset(_bsp_cmake)
endmacro()

# Configure OS target definitions
macro(psoc6_configure_os)
  set(OS "NOOS" CACHE STRING "Target OS")
  set_property(CACHE OS PROPERTY STRINGS NOOS FREERTOS RTX)

  string(TOLOWER ${OS} _os)
  set(_os_cmake ${CMAKE_CURRENT_SOURCE_DIR}/os/${_os}.cmake)
  unset(_os)
  if(NOT EXISTS ${_os_cmake})
    message(FATAL_ERROR "psoc6_configure_os: invalid OS: ${OS}.")
  endif()
  include(${_os_cmake})
  unset(_os_cmake)
endmacro()

# Add component to the global COMPONENTS list (used to conditionally include library sources)
# Also, add -DCOMPONENT_${component} to the global C preprocessor definitions
macro(psoc6_add_component component)
  list(APPEND COMPONENTS ${component})
  add_definitions(-DCOMPONENT_${component})
endmacro()

# Set target device MPN
macro(psoc6_set_device device)
  if("${device}" STREQUAL "")
    message(FATAL_ERROR "psoc6_set_device: missing required 'device' argument.")
  endif()

  # Initialize global DEVICE variable
  set(DEVICE ${device} CACHE STRING "Target device MPN")

  # Add -DDEVICE to project-level macro definitions
  string(REPLACE "-" "_" device_macro ${DEVICE})
  add_definitions(-D${device_macro})
  unset(device_macro)
endmacro()

# Add CPU-specific compilation definitions
# Variables CMAKE_${LANG}_FLAGS_${core} must be defined in the toolchain configuration
# CPU core names: CM4, CM0P
macro(psoc6_set_core)
  # Select target CPU core
  set(CORE CM4 CACHE STRING "Target CPU core")
  set_property(CACHE CORE PROPERTY STRINGS CM4 CM0P)

  psoc6_add_component(${CORE})

  string(APPEND CMAKE_C_FLAGS ${CMAKE_C_FLAGS_${CORE}})
  string(APPEND CMAKE_CXX_FLAGS ${CMAKE_CXX_FLAGS_${CORE}})
  string(APPEND CMAKE_ASM_FLAGS ${CMAKE_ASM_FLAGS_${CORE}})
  string(APPEND CMAKE_EXE_LINKER_FLAGS ${CMAKE_EXE_LINKER_FLAGS_${CORE}})
endmacro()

# Add floating point ABI-specific compilation definitions
# Also, add VFP component to the global COMPONENTS list
# VFP ABI names: SOFTFP HARDFP
macro(psoc6_set_vfp)
  set(VFP SOFTFP CACHE STRING "Target FPU ABI")
  set_property(CACHE VFP PROPERTY STRINGS SOFTFP HARDFP)

  psoc6_add_component(${VFP})

  string(APPEND CMAKE_C_FLAGS ${CMAKE_C_FLAGS_${VFP}})
  string(APPEND CMAKE_CXX_FLAGS ${CMAKE_CXX_FLAGS_${VFP}})
  string(APPEND CMAKE_ASM_FLAGS ${CMAKE_ASM_FLAGS_${VFP}})
  string(APPEND CMAKE_EXE_LINKER_FLAGS ${CMAKE_EXE_LINKER_FLAGS_${VFP}})
endmacro()

# Fetch BSP from online Git repository
macro(psoc6_load_bsp)
  # Parse the expected one-value arguments
  cmake_parse_arguments(BSP "" "NAME;VERSION;URL;TAG;DIR" "" ${ARGN})

  # NAME is the required argument
  if(NOT DEFINED BSP_NAME)
    message(FATAL_ERROR "psoc6_load_bsp: missing required NAME argument.")
  endif()

  # Some assets use Mbed-compatible BSP name ('-' -> '_')
  STRING(REGEX REPLACE "-" "_" MBED_BSP_NAME ${BSP_NAME})

  # VERSION is the required argument
  if(NOT DEFINED BSP_VERSION)
    message(FATAL_ERROR "psoc6_load_bsp: missing required VERSION argument.")
  endif()

  # If URL is not set, assume this is standard BSP from Cypress GitHub
  if(NOT DEFINED BSP_URL)
    set(BSP_URL https://github.com/cypresssemiconductorco/TARGET_${BSP_NAME})
  endif()

  # If TAG is not set, assume standard release tag
  if(NOT DEFINED BSP_TAG)
    set(BSP_TAG release-v${BSP_VERSION})
  endif()

  # If DIR is not set, use the BSP_NAME sub-directory
  if(NOT DEFINED BSP_DIR)
    set(BSP_DIR ${CMAKE_CURRENT_LIST_DIR}/${BSP_NAME})
  endif()

  # Fetch the BSP sources from GitHub
  FetchContent_Declare(
    ${BSP_NAME}
    GIT_REPOSITORY ${BSP_URL}
    GIT_TAG        ${BSP_TAG}
    SOURCE_DIR     ${BSP_DIR}
    GIT_PROGRESS   TRUE
    USES_TERMINAL_DOWNLOAD TRUE
  )
  if("$ENV{PSOC6_FORCE_FETCH}" OR NOT IS_DIRECTORY ${BSP_DIR}/.git)
    MESSAGE(STATUS "Fetch ${BSP_URL}/#${BSP_TAG} to ${BSP_DIR}")
    FetchContent_Populate(${BSP_NAME})
  endif()
endmacro()

# Translate library name to CMake variable prefix
# Example: core-lib -> CORE_LIB
macro(psoc6_lib_name_to_prefix lib_name lib_prefix)
  string(TOUPPER "${lib_name}" ${lib_prefix})
  string(REPLACE "-" "_" ${lib_prefix} "${${lib_prefix}}")
endmacro()

# Fetch library from online Git repository
macro(psoc6_load_library)
  # Parse the expected one-value arguments
  cmake_parse_arguments(LIB "" "NAME;VERSION;URL;TAG;DIR" "" ${ARGN})

  # NAME is the required argument
  if(NOT DEFINED LIB_NAME)
    message(FATAL_ERROR "psoc6_load_library: missing required NAME argument.")
  endif()

  # VERSION is the required argument
  if(NOT DEFINED LIB_VERSION)
    message(FATAL_ERROR "psoc6_load_library: missing required VERSION argument.")
  endif()

  # If URL is not set, assume this is standard lirbary from Cypress GitHub
  if(NOT DEFINED LIB_URL)
    set(LIB_URL https://github.com/cypresssemiconductorco/${LIB_NAME})
  endif()

  # If TAG is not set, assume standard release tag
  if(NOT DEFINED LIB_TAG)
    set(LIB_TAG release-v${LIB_VERSION})
  endif()

  # If DIR is not set, use the LIB_NAME sub-directory
  if(NOT DEFINED LIB_DIR)
    set(LIB_DIR ${CMAKE_CURRENT_LIST_DIR}/${LIB_NAME})
  endif()

  # Determine the unique library prefix
  psoc6_lib_name_to_prefix(${LIB_NAME} LIB_PREFIX)

  # Create project-scope variables with the library prefix
  set(${LIB_PREFIX}_NAME    ${LIB_NAME})
  set(${LIB_PREFIX}_VERSION ${LIB_VERSION})
  set(${LIB_PREFIX}_URL     ${LIB_URL})
  set(${LIB_PREFIX}_DIR     ${LIB_DIR})

  # Fetch the library sources from GitHub
  FetchContent_Declare(
    ${LIB_NAME}
    GIT_REPOSITORY ${LIB_URL}
    GIT_TAG        ${LIB_TAG}
    SOURCE_DIR     ${LIB_DIR}
    GIT_PROGRESS   TRUE
    USES_TERMINAL_DOWNLOAD TRUE

  )
  FetchContent_GetProperties(${LIB_NAME})
  if("$ENV{PSOC6_FORCE_FETCH}" OR NOT IS_DIRECTORY ${LIB_DIR}/.git)
    MESSAGE(STATUS "Fetch ${LIB_URL}/#${LIB_TAG} to ${LIB_DIR}")
    FetchContent_Populate(${LIB_NAME})
  endif()

  # Clear the unprefixed variables from the project scope
  unset(LIB_NAME)
  unset(LIB_VERSION)
  unset(LIB_URL)
  unset(LIB_TAG)
  unset(LIB_DIR)
  unset(LIB_PREFIX)
endmacro()

# Fetch application from online Git repository
macro(psoc6_load_application)
  # Parse the expected one-value arguments
  cmake_parse_arguments(APP "" "NAME;VERSION;URL;TAG;DIR" "" ${ARGN})

  # NAME is the required argument
  if(NOT DEFINED APP_NAME)
    message(FATAL_ERROR "psoc6_load_application: missing required NAME argument.")
  endif()

  # VERSION is the required argument
  if(NOT DEFINED APP_VERSION)
    message(FATAL_ERROR "psoc6_load_application: missing required VERSION argument.")
  endif()

  # If URL is not set, assume this is standard lirbary from Cypress GitHub
  if(NOT DEFINED APP_URL)
    set(APP_URL https://github.com/cypresssemiconductorco/${APP_NAME})
  endif()

  # If TAG is not set, assume standard release tag
  if(NOT DEFINED APP_TAG)
    set(APP_TAG release-v${APP_VERSION})
  endif()

  # If DIR is not set, use the PROJECT_NAME sub-directory
  if(NOT DEFINED APP_DIR)
    set(APP_DIR ${CMAKE_CURRENT_LIST_DIR}/${PROJECT_NAME})
  endif()

  # Fetch the library sources from GitHub
  FetchContent_Declare(
    ${APP_NAME}
    GIT_REPOSITORY ${APP_URL}
    GIT_TAG        ${APP_TAG}
    SOURCE_DIR     ${APP_DIR}
    GIT_PROGRESS   TRUE
    USES_TERMINAL_DOWNLOAD TRUE
  )
  FetchContent_GetProperties(${APP_NAME})
  if("$ENV{PSOC6_FORCE_FETCH}" OR NOT IS_DIRECTORY ${APP_DIR}/.git)
    MESSAGE(STATUS "Fetch ${APP_URL}/#${APP_TAG} to ${APP_DIR}")
    FetchContent_Populate(${APP_NAME})
  endif()

  # Clear the unprefixed variables from the project scope
  unset(APP_NAME)
  unset(APP_VERSION)
  unset(APP_URL)
  unset(APP_TAG)
endmacro()

# Discover custom local application
macro(psoc6_find_application)
  # Parse the expected one-value arguments
  cmake_parse_arguments(APP "" "NAME;DIR" "" ${ARGN})

  # If NAME is not set, use the CMake project name
  if(NOT DEFINED APP_NAME)
    set(TARGET_NAME ${PROJECT_NAME})
  endif()

  # If DIR is not set, use 'ROOT/app/PROJECT_NAME'
  if(NOT DEFINED APP_DIR)
    set(APP_DIR ${CMAKE_SOURCE_DIR}/../app/${PROJECT_NAME})
  endif()
endmacro()

# Set variables and custom recipes for design.modus GeneratedSource
macro(psoc6_add_design_modus design_modus var_source_dir var_sources)
  if(${ARGC} GREATER 3)
    set(generated_sources ${ARGN})
  else()
    # Default list matches standard peripheral selections in the BSP design.modus
    set(generated_sources
      cycfg.h
      cycfg.c
      cycfg_clocks.h
      cycfg_clocks.c
      cycfg_notices.h
      cycfg_peripherals.h
      cycfg_peripherals.c
      cycfg_pins.h
      cycfg_pins.c
      cycfg_routing.h
      cycfg_routing.c
      cycfg_system.h
      cycfg_system.c
    )
  endif()

  if(NOT EXISTS ${design_modus})
    message(FATAL_ERROR "psoc6_add_design_modus: ${design_modus} doesn't exist.")
  endif()

  # Initialize var_source_dir and var_sources
  get_filename_component(design_dir ${design_modus} DIRECTORY)
  set(${var_source_dir} ${design_dir}/GeneratedSource)
  list(TRANSFORM generated_sources
    PREPEND ${${var_source_dir}}/
    OUTPUT_VARIABLE ${var_sources}
  )
  unset(generated_sources)
  unset(design_dir)

  # Check lib/psoc6pdl.cmake is already included
  if(NOT DEFINED PSOC6PDL_DIR)
    message(FATAL_ERROR "psoc6_add_design_modus: PSOC6PDL_DIR is not defined.")
  endif()
  if(NOT EXISTS ${PSOC6PDL_DIR}/devicesupport.xml)
    message(FATAL_ERROR "psoc6_add_design_modus: ${PSOC6PDL_DIR} doesn't point to device support library.")
  endif()

  # Define custom recipe to update design.modus generated source
  add_custom_command(
    COMMAND ${CY_TOOL_CFG_BACKEND_CLI} --library ${PSOC6PDL_DIR}/devicesupport.xml --tools ${CY_TOOLS_PATHS} --build ${design_modus} --readonly
    DEPENDS ${design_modus}
    OUTPUT  ${${var_sources}}
    COMMENT "Generating Device Configuration for ${design_modus}"
  )
endmacro()

# Set variables and custom recipes for design.cycapsense GeneratedSource
macro(psoc6_add_design_capsense design_capsense var_source_dir var_sources)
  if(NOT EXISTS ${design_capsense})
    message(FATAL_ERROR "psoc6_add_design_capsense: ${design_capsense} doesn't exist.")
  endif()

  # Initialize var_source_dir and var_sources
  get_filename_component(design_dir ${design_capsense} DIRECTORY)
  set(${var_source_dir} ${design_dir}/GeneratedSource)
  set(${var_sources}
    ${${var_source_dir}}/cycfg_capsense.h
    ${${var_source_dir}}/cycfg_capsense.c
  )
  unset(design_dir)

  # Define custom recipe to update design.cycapsense generated source
  add_custom_command(
    COMMAND ${CY_TOOL_CAPSENSE_CLI} -c ${design_capsense}
    DEPENDS ${design_capsense}
    OUTPUT  ${${var_sources}}
    COMMENT "Generating CapSense Configuration for ${design_capsense}"
  )
endmacro()

# Set variables and custom recipes for design.cyqspi GeneratedSource
macro(psoc6_add_design_qspi design_qspi var_source_dir var_sources)
  if(NOT EXISTS ${design_qspi})
    message(FATAL_ERROR "psoc6_add_design_qspi: ${design_qspi} doesn't exist.")
  endif()

  # Initialize var_source_dir and var_sources
  get_filename_component(design_dir ${design_qspi} DIRECTORY)
  set(${var_source_dir} ${design_dir}/GeneratedSource)
  set(${var_sources}
    ${${var_source_dir}}/cycfg_qspi_memslot.h
    ${${var_source_dir}}/cycfg_qspi_memslot.c
  )
  unset(design_dir)

  # Define custom recipe to update design.cyqspi generated source
  add_custom_command(
    COMMAND ${CY_TOOL_QSPI_CLI} -c ${design_qspi}
    DEPENDS ${design_qspi}
    OUTPUT  ${${var_sources}}
    COMMENT "Generating CapSense Configuration for ${design_qspi}"
  )
endmacro()

# Set variables and custom recipes for design.cyusbdev GeneratedSource
macro(psoc6_add_design_usbdev design_usbdev var_source_dir var_sources)
  if(NOT EXISTS ${design_usbdev})
    message(FATAL_ERROR "psoc6_add_design_usbdev: ${design_usbdev} doesn't exist.")
  endif()

  # Initialize var_source_dir and var_sources
  get_filename_component(design_dir ${design_usbdev} DIRECTORY)
  set(${var_source_dir} ${design_dir}/GeneratedSource)
  set(${var_sources}
    ${${var_source_dir}}/cycfg_usbdev.h
    ${${var_source_dir}}/cycfg_usbdev.c
  )
  unset(design_dir)

  # Define custom recipe to update design.cyusbdev generated source
  add_custom_command(
    COMMAND ${CY_TOOL_USBDEV_CLI} -c ${design_usbdev}
    DEPENDS ${design_usbdev}
    OUTPUT  ${${var_sources}}
    COMMENT "Generating USB Device Configuration for ${design_usbdev}"
  )
endmacro()

# Set variables and custom recipes for design.cyseglcd GeneratedSource
macro(psoc6_add_design_seglcd design_seglcd var_source_dir var_sources)
  if(NOT EXISTS ${design_seglcd})
    message(FATAL_ERROR "psoc6_add_design_seglcd: ${design_seglcd} doesn't exist.")
  endif()

  # Initialize var_source_dir and var_sources
  get_filename_component(design_dir ${design_seglcd} DIRECTORY)
  set(${var_source_dir} ${design_dir}/GeneratedSource)
  set(${var_sources}
    ${${var_source_dir}}/cycfg_seglcd.h
    ${${var_source_dir}}/cycfg_seglcd.c
  )
  unset(design_dir)

  # Define custom recipe to update design.cyseglcd generated source
  add_custom_command(
    COMMAND ${CY_TOOL_SEGLCD_CLI} -c ${design_seglcd}
    DEPENDS ${design_seglcd}
    OUTPUT  ${${var_sources}}
    COMMENT "Generating Segment LCD Configuration for ${design_seglcd}"
  )
endmacro()

# Set variables and custom recipes for design.cybt GeneratedSource
macro(psoc6_add_design_bt design_bt var_source_dir var_sources)
  if(NOT EXISTS ${design_bt})
    message(FATAL_ERROR "psoc6_add_design_bt: ${design_bt} doesn't exist.")
  endif()

  # Initialize var_source_dir and var_sources
  get_filename_component(design_dir ${design_bt} DIRECTORY)
  set(${var_source_dir} ${design_dir}/GeneratedSource)
  set(${var_sources}
    ${${var_source_dir}}/cycfg_ble.h
    ${${var_source_dir}}/cycfg_ble.c
  )
  unset(design_dir)

  # Define custom recipe to update design.cybt generated source
  add_custom_command(
    COMMAND ${CY_TOOL_BT_CLI} -c ${design_bt}
    DEPENDS ${design_bt}
    OUTPUT  ${${var_sources}}
    COMMENT "Generating Bluetooth Configuration for ${design_bt}"
  )
endmacro()

macro(psoc6_add_bsp_design_modus design_modus)
  psoc6_add_design_modus(
    ${design_modus}
    BSP_GENERATED_SOURCE_DIR
    BSP_GENERATED_SOURCES
    ${ARGN}
  )
  add_library(bsp_design_modus STATIC EXCLUDE_FROM_ALL ${BSP_GENERATED_SOURCES})
  target_include_directories(bsp_design_modus PUBLIC ${BSP_GENERATED_SOURCE_DIR})
  target_link_libraries(bsp_design_modus PUBLIC psoc6pdl psoc6hal)
  # BSP sources include cycfg.h
  target_include_directories(bsp PUBLIC ${BSP_GENERATED_SOURCE_DIR})
endmacro()

macro(psoc6_add_bsp_design_capsense design_capsense)
  psoc6_add_design_capsense(
    ${design_capsense}
    BSP_CAPSENSE_GENERATED_SOURCE_DIR
    BSP_CAPSENSE_GENERATED_SOURCES
  )
  add_library(bsp_design_capsense STATIC EXCLUDE_FROM_ALL ${BSP_CAPSENSE_GENERATED_SOURCES})
  target_include_directories(bsp_design_capsense PUBLIC ${BSP_CAPSENSE_GENERATED_SOURCE_DIR})
  target_link_libraries(bsp_design_capsense PUBLIC psoc6pdl capsense)
endmacro()

macro(psoc6_add_bsp_design_qspi design_qspi)
  psoc6_add_design_qspi(
    ${design_qspi}
    BSP_QSPI_GENERATED_SOURCE_DIR
    BSP_QSPI_GENERATED_SOURCES
  )
  add_library(bsp_design_qspi STATIC EXCLUDE_FROM_ALL ${BSP_QSPI_GENERATED_SOURCES})
  target_include_directories(bsp_design_qspi PUBLIC ${BSP_QSPI_GENERATED_SOURCE_DIR})
  target_link_libraries(bsp_design_qspi PUBLIC psoc6pdl)
endmacro()

# Set application target variables and recipes
macro(psoc6_add_executable)
  # Parse the expected arguments
  cmake_parse_arguments(TARGET ""
    "NAME;DESIGN_MODUS;DESIGN_CAPSENSE;DESIGN_QSPI;DESIGN_USBDEV;DESIGN_SEGLCD;DESIGN_BT;LINKER_SCRIPT"
    "SOURCES;INCLUDE_DIRS;DEFINES;LINK_LIBRARIES;GENERATED_SOURCES"
    ${ARGN}
  )

  # If NAME is not set, use the CMake project name
  if(NOT DEFINED TARGET_NAME)
    set(TARGET_NAME ${PROJECT_NAME})
  endif()

  # Define executable target, add application sources
  add_executable(${TARGET_NAME} ${TARGET_SOURCES})

  # Add application-specific include dirs
  target_include_directories(${TARGET_NAME} PRIVATE ${TARGET_INCLUDE_DIRS})

  # Add application-specific -DDEFINES
  target_compile_definitions(${TARGET_NAME} PRIVATE ${TARGET_DEFINES})

  # Link the BSP lirbary
  if(TARGET bsp)
    list(APPEND TARGET_LINK_LIBRARIES bsp)
  endif()

  # Link the prebuilt CM0+ image
  if(TARGET psoc6cm0p)
    list(APPEND TARGET_LINK_LIBRARIES psoc6cm0p)
  endif()

  # Check if the application provides custom design.modus
  if(DEFINED TARGET_DESIGN_MODUS)
    psoc6_add_design_modus(
      ${TARGET_DESIGN_MODUS}
      CUSTOM_GENERATED_SOURCE_DIR
      CUSTOM_GENERATED_SOURCES
      ${TARGET_GENERATED_SOURCES}
    )
    target_sources(${TARGET_NAME} PRIVATE ${CUSTOM_GENERATED_SOURCES})
    target_include_directories(${TARGET_NAME} PRIVATE ${CUSTOM_GENERATED_SOURCE_DIR})
  elseif(TARGET bsp_design_modus)
    list(APPEND TARGET_LINK_LIBRARIES bsp_design_modus)
  endif()

  # Check if the application provides custom design.cycapsense
  if(DEFINED TARGET_DESIGN_CAPSENSE)
    psoc6_add_design_capsense(
      ${TARGET_DESIGN_CAPSENSE}
      CUSTOM_CAPSENSE_GENERATED_SOURCE_DIR
      CUSTOM_CAPSENSE_GENERATED_SOURCES
    )
    target_sources(${TARGET_NAME} PRIVATE ${CUSTOM_CAPSENSE_GENERATED_SOURCES})
    target_include_directories(${TARGET_NAME} PRIVATE ${CUSTOM_CAPSENSE_GENERATED_SOURCE_DIR})
  elseif(TARGET bsp_design_capsense)
    list(APPEND TARGET_LINK_LIBRARIES bsp_design_capsense)
  endif()

  # Check if the application provides custom design.cyqspi
  if(DEFINED TARGET_DESIGN_QSPI)
    psoc6_add_design_qspi(
      ${TARGET_DESIGN_QSPI}
      CUSTOM_QSPI_GENERATED_SOURCE_DIR
      CUSTOM_QSPI_GENERATED_SOURCES
    )
    target_sources(${TARGET_NAME} PRIVATE ${CUSTOM_QSPI_GENERATED_SOURCES})
    target_include_directories(${TARGET_NAME} PRIVATE ${CUSTOM_QSPI_GENERATED_SOURCE_DIR})
  elseif(TARGET bsp_design_qspi)
    target_link_libraries(${TARGET_NAME} PRIVATE bsp_design_qspi)
  endif()

  # Check if the application provides custom design.cyusbdev
  if(DEFINED TARGET_DESIGN_USBDEV)
    psoc6_add_design_usbdev(
      ${TARGET_DESIGN_USBDEV}
      CUSTOM_USBDEV_GENERATED_SOURCE_DIR
      CUSTOM_USBDEV_GENERATED_SOURCES
    )
    target_sources(${TARGET_NAME} PRIVATE ${CUSTOM_USBDEV_GENERATED_SOURCES})
    target_include_directories(${TARGET_NAME} PRIVATE ${CUSTOM_USBDEV_GENERATED_SOURCE_DIR})
  endif()

  # Check if the application provides custom design.cyseglcd
  if(DEFINED TARGET_DESIGN_SEGLCD)
    psoc6_add_design_seglcd(
      ${TARGET_DESIGN_SEGLCD}
      CUSTOM_SEGLCD_GENERATED_SOURCE_DIR
      CUSTOM_SEGLCD_GENERATED_SOURCES
    )
    target_sources(${TARGET_NAME} PRIVATE ${CUSTOM_SEGLCD_GENERATED_SOURCES})
    target_include_directories(${TARGET_NAME} PRIVATE ${CUSTOM_SEGLCD_GENERATED_SOURCE_DIR})
  endif()

  # Check if the application provides custom design.cybt
  if(DEFINED TARGET_DESIGN_BT)
    psoc6_add_design_bt(
      ${TARGET_DESIGN_BT}
      CUSTOM_BT_GENERATED_SOURCE_DIR
      CUSTOM_BT_GENERATED_SOURCES
    )
    target_sources(${TARGET_NAME} PRIVATE ${CUSTOM_BT_GENERATED_SOURCES})
    target_include_directories(${TARGET_NAME} PRIVATE ${CUSTOM_BT_GENERATED_SOURCE_DIR})
  endif()

  # Include all dependent libraries
  if(${TOOLCHAIN} STREQUAL GCC)
    # Ensure all weak symbols can be overriden by the strong overrides defined in the static libraries
    target_link_libraries(${TARGET_NAME} PRIVATE "-Wl,--whole-archive" ${TARGET_LINK_LIBRARIES} "-Wl,--no-whole-archive")
  else()
    # TODO: verify the similar hack is not needed for ARM and IAR toolchains
    target_link_libraries(${TARGET_NAME} PRIVATE bsp ${TARGET_LINK_LIBRARIES})
  endif()

  # If LINKER_SCRIPT is not set, use the BSP linker script
  if(NOT DEFINED TARGET_LINKER_SCRIPT)
    if(DEFINED BSP_LINKER_SCRIPT)
      set(TARGET_LINKER_SCRIPT ${BSP_LINKER_SCRIPT})
    else()
      message(FATAL_ERROR "psoc6_add_executable: specify either target LINKER_SCRIPT or BSP_LINKER_SCRIPT.")
    endif()
  endif()

  # Set linker related options
  set_target_properties(${TARGET_NAME} PROPERTIES
    SUFFIX ".elf"
    LINK_FLAGS "${TOOLCHAIN_LSFLAGS}${TARGET_LINKER_SCRIPT} ${TOOLCHAIN_MAPFILE}${CMAKE_CURRENT_BINARY_DIR}/${TARGET_NAME}.map"
  )

  # Define custom command for CMSIS-DAP programming
  add_custom_target(${TARGET_NAME}_PROGRAM
    COMMAND ${CY_OPENOCD_BIN}
      -s ${CY_OPENOCD_SCRIPTS}
      -f ${OPENOCD_CFG}
      -c "if [catch {program $<TARGET_FILE:${TARGET_NAME}>} ] { echo {** Program operation failed **} } else { echo {** Program operation completed successfully **} }"
      -c "reset_config srst_only;reset run;psoc6.dap dpreg 0x04 0x00;shutdown"
    DEPENDS ${TARGET_NAME}
    COMMENT "Program ${TARGET_NAME} application"
    VERBATIM USES_TERMINAL
  )
endmacro()

# Check the application is applicable to the target BSP
macro(psoc6_check_bsp)
  set(_match FALSE)
  foreach(arg ${ARGN})
    if(${TARGET} STREQUAL ${arg})
      set(_match TRUE)
      break()
    endif()
  endforeach()
  if(NOT ${_match})
    return()
  endif()
endmacro()
