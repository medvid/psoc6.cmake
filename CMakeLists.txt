# CMake 3.16 required for ARMClang toolchain support
# CMake 3.14 required for FetchContent module
cmake_minimum_required(VERSION 3.16)

# Load psoc6_* macros
include(psoc6.cmake)

# Load ModusToolbox tool definitions
psoc6_add_tools(VERSION 2.1)

# Configure toolchain definitions
psoc6_configure_toolchain()

# Define project name, set enabled languages
project(psoc6 C CXX ASM)

# https://cmake.org/cmake/help/latest/prop_tgt/CXX_STANDARD.html
set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED ON)
set(CMAKE_CXX_EXTENSIONS OFF)

# Configure target BSP, load common libraries
psoc6_configure_bsp()

# Configure target OS, load OS-specific libraries and applications
psoc6_configure_os()

# https://reproducible-builds.org/docs/build-path/
if(CMAKE_C_COMPILER_VERSION VERSION_GREATER 8)
  file(RELATIVE_PATH _file_prefix ${CMAKE_BINARY_DIR} ${CMAKE_SOURCE_DIR})
  string(APPEND CMAKE_C_FLAGS " -ffile-prefix-map=${_file_prefix}=")
  string(APPEND CMAKE_CXX_FLAGS " -ffile-prefix-map=${_file_prefix}=")
  unset(_file_prefix)
endif()
