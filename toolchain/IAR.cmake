# https://cmake.org/cmake/help/latest/manual/cmake-toolchains.7.html

# Setting Linux is forcing th extension to be .o instead of .obj when building on Windows.
set(CMAKE_SYSTEM_NAME Linux)
set(CMAKE_EXECUTABLE_SUFFIX ".elf")

set(CMAKE_SYSTEM_PROCESSOR ARM)
set(CMAKE_TRY_COMPILE_TARGET_TYPE STATIC_LIBRARY)

set(IAR_TOOLCHAIN_DEFAULT_PATH "C:/Program Files (x86)/IAR Systems/Embedded Workbench 8.4/arm")
set(IAR_TOOLCHAIN_PATH ${IAR_TOOLCHAIN_DEFAULT_PATH} CACHE PATH "IAR toolchain path")

if(WIN32)
  set(TOOLCHAIN_EXT ".exe")
else()
  set(TOOLCHAIN_EXT "")
endif()

set(CMAKE_C_COMPILER ${IAR_TOOLCHAIN_PATH}/bin/iccarm${TOOLCHAIN_EXT} CACHE INTERNAL "C Compiler")
set(CMAKE_CXX_COMPILER ${IAR_TOOLCHAIN_PATH}/bin/iccarm${TOOLCHAIN_EXT} CACHE INTERNAL "C++ Compiler")
set(CMAKE_ASM_COMPILER ${IAR_TOOLCHAIN_PATH}/bin/iasmarm${TOOLCHAIN_EXT} CACHE INTERNAL "ASM Compiler")
set(CMAKE_AR ${IAR_TOOLCHAIN_PATH}/bin/iarchive${TOOLCHAIN_EXT} CACHE INTERNAL "Archiver")
set(CMAKE_LINKER ${IAR_TOOLCHAIN_PATH}/bin/ilinkarm${TOOLCHAIN_EXT} CACHE INTERNAL "Linker")

set(CMAKE_C_FLAGS "--silent -c --endian=little -e --enable_restrict --no_wrap_diagnostics" CACHE INTERNAL "C Compiler flags")
set(CMAKE_CXX_FLAGS "--silent -c --endian=little -e --enable_restrict --no_wrap_diagnostics --c++ --no_rtti --no_exceptions" CACHE INTERNAL "C++ Compiler flags")
set(CMAKE_ASM_FLAGS "-c -s+ -w+ -r" CACHE INTERNAL "ASM Compiler flags")
set(CMAKE_EXE_LINKER_FLAGS "--silent --manual_dynamic_initialization" CACHE INTERNAL "Linker flags")

set(CMAKE_C_FLAGS_DEBUG "-DDEBUG -Ol --debug" CACHE INTERNAL "C Compiler flags for Debug configuration")
set(CMAKE_CXX_FLAGS_DEBUG "-DDEBUG -Ol --debug" CACHE INTERNAL "C++ Compiler flags for Debug configuration")
set(CMAKE_ASM_FLAGS_DEBUG "-DDEBUG" CACHE INTERNAL "ASM Compiler flags for Debug configuration")
set(CMAKE_EXE_LINKER_FLAGS_DEBUG "" CACHE INTERNAL "Linker flags for Debug configuration")

set(CMAKE_C_FLAGS_RELEASE "-DNDEBUG -Ohs" CACHE INTERNAL "C Compiler flags for Release configuration")
set(CMAKE_CXX_FLAGS_RELEASE "-DNDEBUG -Ohs" CACHE INTERNAL "C++ Compiler flags for Release configuration")
set(CMAKE_ASM_FLAGS_RELEASE "-DNDEBUG" CACHE INTERNAL "ASM Compiler flags for Release configuration")
set(CMAKE_EXE_LINKER_FLAGS_RELEASE "" CACHE INTERNAL "Linker flags for Release configuration")

set(CMAKE_C_FLAGS_CM0P " --cpu Cortex-M0+" CACHE INTERNAL "C Compiler flags for CM0+ CPU core")
set(CMAKE_CXX_FLAGS_CM0P " --cpu Cortex-M0+" CACHE INTERNAL "C++ Compiler flags for CM0+ CPU core")
set(CMAKE_ASM_FLAGS_CM0P " --cpu Cortex-M0+" CACHE INTERNAL "ASM Compiler flags for CM0+ CPU core")
set(CMAKE_EXE_LINKER_FLAGS_CM0P " --cpu Cortex-M0+" CACHE INTERNAL "Linker flags for CM0+ CPU core")

set(CMAKE_C_FLAGS_CM4 " --cpu Cortex-M4" CACHE INTERNAL "C Compiler flags for CM4 CPU core")
set(CMAKE_CXX_FLAGS_CM4 " --cpu Cortex-M4" CACHE INTERNAL "C++ Compiler flags for CM4 CPU core")
set(CMAKE_ASM_FLAGS_CM4 " --cpu Cortex-M4" CACHE INTERNAL "ASM Compiler flags for CM4 CPU core")
set(CMAKE_EXE_LINKER_FLAGS_CM4 " --cpu Cortex-M4" CACHE INTERNAL "Linker flags for CM4 CPU core")

set(CMAKE_C_FLAGS_SOFTFP " --fpu FPv4-SP --aapcs std" CACHE INTERNAL "C Compiler flags for softfp ABI")
set(CMAKE_CXX_FLAGS_SOFTFP " --fpu FPv4-SP --aapcs std" CACHE INTERNAL "C++ Compiler flags for softfp ABI")
set(CMAKE_ASM_FLAGS_SOFTFP " --fpu FPv4-SP" CACHE INTERNAL "ASM Compiler flags for softfp ABI")
set(CMAKE_EXE_LINKER_FLAGS_SOFTFP " --fpu FPv4-SP" CACHE INTERNAL "Linker flags for softfp ABI")

set(CMAKE_C_FLAGS_HARDFP " --fpu FPv4-SP --aapcs vfp" CACHE INTERNAL "C Compiler flags for hardfp ABI")
set(CMAKE_CXX_FLAGS_HARDFP " --fpu FPv4-SP --aapcs vfp" CACHE INTERNAL "C++ Compiler flags for hardfp ABI")
set(CMAKE_ASM_FLAGS_HARDFP " --fpu FPv4-SP" CACHE INTERNAL "ASM Compiler flags for hardfp ABI")
set(CMAKE_EXE_LINKER_FLAGS_HARDFP " --fpu FPv4-SP" CACHE INTERNAL "Linker flags for hardfp ABI")

# Linker script and map file flags
set(TOOLCHAIN_LSFLAGS "--config=")
set(TOOLCHAIN_MAPFILE "--map=")
set(TOOLCHAIN_PREINCLUDE "--preinclude=")
