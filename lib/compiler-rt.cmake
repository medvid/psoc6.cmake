FetchContent_Declare(
  compiler-rt
  SOURCE_DIR ${CMAKE_SOURCE_DIR}/lib/compiler-rt
  URL        https://github.com/llvm/llvm-project/releases/download/llvmorg-10.0.0/compiler-rt-10.0.0.src.tar.xz
  URL_HASH   SHA256=6a7da64d3a0a7320577b68b9ca4933bdcab676e898b759850e827333c3282c75
)
FetchContent_MakeAvailable(compiler-rt)
