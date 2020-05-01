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

# Configure target BSP, load common libraries
psoc6_configure_bsp()

# Configure target OS, load OS-specific libraries and applications
psoc6_configure_os()
