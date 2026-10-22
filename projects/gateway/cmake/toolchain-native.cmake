# toolchain-native.cmake
# HFT style - max latency, non-portable, host-specific
# Source: HFT repos: -O3 -march=native -mtune=native -flto -fno-exceptions -fno-rtti
# Observed in: preddy1232/hft-parser-generator, harshitsinghcode/shaurya, rl-hft-orderbook
# Result: movbe codegen, 20M msgs/s, 1.75us min

set(CMAKE_SYSTEM_NAME Linux)
set(CMAKE_SYSTEM_PROCESSOR x86_64)

# Prefer Clang 18+ for best -march=native codegen, fallback GCC
find_program(CLANG_18 clang++-18)
find_program(CLANG_17 clang++-17)
find_program(GCC_13 g++-13)

if(CLANG_18)
  set(CMAKE_C_COMPILER clang-18)
  set(CMAKE_CXX_COMPILER clang++-18)
elseif(CLANG_17)
  set(CMAKE_C_COMPILER clang-17)
  set(CMAKE_CXX_COMPILER clang++-17)
elseif(GCC_13)
  set(CMAKE_C_COMPILER gcc-13)
  set(CMAKE_CXX_COMPILER g++-13)
else()
  set(CMAKE_C_COMPILER clang++)
  set(CMAKE_CXX_COMPILER clang++)
endif()

# --- HFT hot path flags ---
# -fno-exceptions = latency poison (hidden control flow + unwind tables)
# -fno-rtti = eliminates type_info vtable overhead
# -O3 = full optimization including auto-vectorization and aggressive inlining
# -march=native = enables movbe, bmi2, avx2, fma on host
# -flto=auto = link-time optimization across TUs
add_compile_options(
  -O3
  -march=native
  -mtune=native
  -flto=auto
  -fno-exceptions
  -fno-rtti
  -funroll-loops
  -DNDEBUG
)

add_link_options(
  -march=native
  -mtune=native
  -flto=auto
)

# Optional: uncomment for max speed if IEEE754 breakage acceptable
# add_compile_options(-ffast-math -funsafe-math-optimizations)

# For HFT you still want format security
add_compile_options(-Wformat=2 -Werror=format-security -Wall -Wextra)

set(CMAKE_INTERPROCEDURAL_OPTIMIZATION TRUE)

# Usage:
# cmake -B build-native --toolchain cmake/toolchain-native.cmake -DHFT_MODE=ON -DCMAKE_BUILD_TYPE=Release
# cmake --build build-native -j
# objdump -d build-native/app | grep movbe  # should show movbe for big-endian loads
# ./build-native/app

# To verify movbe:
# g++ -O3 -march=native -S main.cpp -o - | grep movbe
