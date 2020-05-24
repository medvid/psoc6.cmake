# https://cmake.org/cmake/help/latest/manual/cmake-toolchains.7.html

# Setting Linux is forcing the extension to be .o instead of .obj when building on Windows.
set(CMAKE_SYSTEM_NAME Linux)
set(CMAKE_EXECUTABLE_SUFFIX ".elf")

set(CMAKE_SYSTEM_PROCESSOR cortex-m4)
set(CMAKE_TRY_COMPILE_TARGET_TYPE STATIC_LIBRARY)

if(DEFINED ENV{LLVM_TOOLCHAIN_PATH})
  set(LLVM_TOOLCHAIN_DEFAULT_PATH "$ENV{LLVM_TOOLCHAIN_PATH}")
elseif(WIN32)
  set(LLVM_TOOLCHAIN_DEFAULT_PATH "C:/Program Files/LLVM")
elseif(APPLE)
  set(LLVM_TOOLCHAIN_DEFAULT_PATH "/usr/local/opt/llvm") # homebrew install location
else()
  set(LLVM_TOOLCHAIN_DEFAULT_PATH "/usr")
endif()
set(LLVM_TOOLCHAIN_PATH ${LLVM_TOOLCHAIN_DEFAULT_PATH} CACHE PATH "LLVM toolchain path")

if(WIN32)
  set(TOOLCHAIN_EXT ".exe")
else()
  set(TOOLCHAIN_EXT "")
endif()

set(CMAKE_C_COMPILER ${LLVM_TOOLCHAIN_PATH}/bin/clang${TOOLCHAIN_EXT} CACHE INTERNAL "C Compiler")
set(CMAKE_CXX_COMPILER ${LLVM_TOOLCHAIN_PATH}/bin/clang++${TOOLCHAIN_EXT} CACHE INTERNAL "C++ Compiler")
set(CMAKE_ASM_COMPILER ${LLVM_TOOLCHAIN_PATH}/bin/clang${TOOLCHAIN_EXT} CACHE INTERNAL "ASM Compiler")
set(CMAKE_AR ${LLVM_TOOLCHAIN_PATH}/bin/llvm-ar${TOOLCHAIN_EXT} CACHE INTERNAL "Archiver")
set(CMAKE_LINKER ${LLVM_TOOLCHAIN_PATH}/bin/clang${TOOLCHAIN_EXT} CACHE INTERNAL "Linker")

set(TARGET_TRIPLE "arm-none-eabi")
set(CMAKE_C_FLAGS "-target arm-none-eabi -mthumb -ffunction-sections -fdata-sections -g -Wall -std=gnu99" CACHE INTERNAL "C Compiler flags")
set(CMAKE_CXX_FLAGS "-target arm-none-eabi -mthumb -ffunction-sections -fdata-sections -g -Wall -std=c++11 -fno-rtti -fno-exceptions" CACHE INTERNAL "C++ Compiler flags")
set(CMAKE_ASM_FLAGS "-target arm-none-eabi -mthumb -ffunction-sections -fdata-sections -g -Wall -x assembler-with-cpp" CACHE INTERNAL "ASM Compiler flags")
set(CMAKE_EXE_LINKER_FLAGS "-target arm-none-eabi -mthumb -ffunction-sections -fdata-sections -g -Wall -Wl,--gc-sections -nostdlib -v" CACHE INTERNAL "Linker flags")

set(CMAKE_C_FLAGS_DEBUG "-DDEBUG -Og" CACHE INTERNAL "C Compiler flags for Debug configuration")
set(CMAKE_CXX_FLAGS_DEBUG "-DDEBUG -Og" CACHE INTERNAL "C++ Compiler flags for Debug configuration")
set(CMAKE_ASM_FLAGS_DEBUG "-DDEBUG -Og" CACHE INTERNAL "ASM Compiler flags for Debug configuration")
set(CMAKE_EXE_LINKER_FLAGS_DEBUG "" CACHE INTERNAL "Linker flags for Debug configuration")

set(CMAKE_C_FLAGS_RELEASE "-DNDEBUG -Os" CACHE INTERNAL "C Compiler flags for Release configuration")
set(CMAKE_CXX_FLAGS_RELEASE "-DNDEBUG -Os" CACHE INTERNAL "C++ Compiler flags for Release configuration")
set(CMAKE_ASM_FLAGS_RELEASE "-DNDEBUG -Os" CACHE INTERNAL "ASM Compiler flags for Release configuration")
set(CMAKE_EXE_LINKER_FLAGS_RELEASE "" CACHE INTERNAL "Linker flags for Release configuration")

set(CMAKE_C_FLAGS_CM0P " -mcpu=cortex-m0plus" CACHE INTERNAL "C Compiler flags for CM0+ CPU core")
set(CMAKE_CXX_FLAGS_CM0P " -mcpu=cortex-m0plus" CACHE INTERNAL "C++ Compiler flags for CM0+ CPU core")
set(CMAKE_ASM_FLAGS_CM0P " -mcpu=cortex-m0plus" CACHE INTERNAL "ASM Compiler flags for CM0+ CPU core")
set(CMAKE_EXE_LINKER_FLAGS_CM0P " -mcpu=cortex-m0plus" CACHE INTERNAL "Linker flags for CM0+ CPU core")

set(CMAKE_C_FLAGS_CM4 " -mcpu=cortex-m4" CACHE INTERNAL "C Compiler flags for CM4 CPU core")
set(CMAKE_CXX_FLAGS_CM4 " -mcpu=cortex-m4" CACHE INTERNAL "C++ Compiler flags for CM4 CPU core")
set(CMAKE_ASM_FLAGS_CM4 " -mcpu=cortex-m4" CACHE INTERNAL "ASM Compiler flags for CM4 CPU core")
set(CMAKE_EXE_LINKER_FLAGS_CM4 " -mcpu=cortex-m4" CACHE INTERNAL "Linker flags for CM4 CPU core")

set(CMAKE_C_FLAGS_SOFTFP " -mfloat-abi=softfp -mfpu=fpv4-sp-d16" CACHE INTERNAL "C Compiler flags for softfp ABI")
set(CMAKE_CXX_FLAGS_SOFTFP " -mfloat-abi=softfp -mfpu=fpv4-sp-d16" CACHE INTERNAL "C++ Compiler flags for softfp ABI")
set(CMAKE_ASM_FLAGS_SOFTFP " -mfloat-abi=softfp -mfpu=fpv4-sp-d16" CACHE INTERNAL "ASM Compiler flags for softfp ABI")
set(CMAKE_EXE_LINKER_FLAGS_SOFTFP " -mfloat-abi=softfp -mfpu=fpv4-sp-d16" CACHE INTERNAL "Linker flags for softfp ABI")

set(CMAKE_C_FLAGS_HARDFP " -mfloat-abi=hard -mfpu=fpv4-sp-d16" CACHE INTERNAL "C Compiler flags for hardfp ABI")
set(CMAKE_CXX_FLAGS_HARDFP " -mfloat-abi=hard -mfpu=fpv4-sp-d16" CACHE INTERNAL "C++ Compiler flags for hardfp ABI")
set(CMAKE_ASM_FLAGS_HARDFP " -mfloat-abi=hard -mfpu=fpv4-sp-d16" CACHE INTERNAL "ASM Compiler flags for hardfp ABI")
set(CMAKE_EXE_LINKER_FLAGS_HARDFP " -mfloat-abi=hard -mfpu=fpv4-sp-d16" CACHE INTERNAL "Linker flags for hardfp ABI")

# Linker script, map file and preinclude flags
set(TOOLCHAIN_LSFLAGS "-T")
set(TOOLCHAIN_MAPFILE "-Wl,-Map,")
set(TOOLCHAIN_PREINCLUDE "-include ")

# https://reproducible-builds.org/docs/build-path/
if(CMAKE_C_COMPILER_VERSION VERSION_GREATER_EQUAL 11)
  file(RELATIVE_PATH _file_prefix ${CMAKE_BINARY_DIR} ${CMAKE_SOURCE_DIR})
  string(APPEND CMAKE_C_FLAGS " -ffile-prefix-map=${_file_prefix}=")
  string(APPEND CMAKE_CXX_FLAGS " -ffile-prefix-map=${_file_prefix}=")
  unset(_file_prefix)
endif()

# Set directort with custom LLVM port sources
set(LLVM_PORT_DIR ${CMAKE_SOURCE_DIR}/toolchain/llvm)

# Use GCC standard libraries
include_directories(${CY_TOOLS_PATHS}/gcc-7.2.1/arm-none-eabi/include)
set(NEWLIB_LIB_DIR ${CY_TOOLS_PATHS}/gcc-7.2.1/arm-none-eabi/lib/thumb/v7e-m/fpv4-sp/softfp)
set(GCC_LIB_DIR ${CY_TOOLS_PATHS}/gcc-7.2.1/lib/gcc/arm-none-eabi/7.2.1/thumb/v7e-m/fpv4-sp/softfp)
set(GCC_LINK_LIBRARIES
  -L${GCC_LIB_DIR}
  -L${NEWLIB_LIB_DIR}
  ${GCC_LIB_DIR}/crtbegin.o
  ${GCC_LIB_DIR}/crtend.o
  ${GCC_LIB_DIR}/crtfastmath.o
  ${GCC_LIB_DIR}/crti.o
  ${GCC_LIB_DIR}/crtn.o
)
