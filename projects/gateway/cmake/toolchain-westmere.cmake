# toolchain-westmere.cmake
# Bloomberg BDE style - reproducible, portable, ABI-pinned
# Source: BDE compiler profile: set(CMAKE_C_FLAGS "-march=westmere -m64") + -D_GLIBCXX_USE_CXX11_ABI=0
# Use for production releases where binary must run on any westmere+ machine

set(CMAKE_SYSTEM_NAME Linux)
set(CMAKE_SYSTEM_PROCESSOR x86_64)

# Use GCC 12+ for _FORTIFY_SOURCE=3 support
find_program(GCC_12 g++-12)
find_program(GCC_13 g++-13)
find_program(GCC_DEFAULT g++)

if(GCC_13)
  set(CMAKE_C_COMPILER gcc-13)
  set(CMAKE_CXX_COMPILER g++-13)
elseif(GCC_12)
  set(CMAKE_C_COMPILER gcc-12)
  set(CMAKE_CXX_COMPILER g++-12)
else()
  set(CMAKE_C_COMPILER gcc)
  set(CMAKE_CXX_COMPILER g++)
endif()

# --- Bloomberg ABI pinning ---
add_compile_options(-march=westmere -m64 -mtune=generic)
add_compile_definitions(_GLIBCXX_USE_CXX11_ABI=0)

# --- OpenSSF hardening that works on westmere ---
add_compile_options(
  -O2
  -fstack-protector-strong
  -fstack-clash-protection
  -fcf-protection=full
  -fPIE
  -fstrict-flex-arrays=3
  -D_FORTIFY_SOURCE=3
  -D_GLIBCXX_ASSERTIONS
)
add_link_options(
  -pie
  -Wl,-z,relro
  -Wl,-z,now
  -Wl,-z,noexecstack
  -Wl,-z,nodlopen
  -Wl,--as-needed
)

# --- Strict warnings (same as StrictFlags.cmake but enforced at toolchain level) ---
add_compile_options(
  -Wall -Wextra -Wpedantic
  -Wformat=2 -Werror=format-security
  -Wconversion -Wimplicit-fallthrough=5
)

set(CMAKE_TRY_COMPILE_TARGET_TYPE STATIC_LIBRARY)

# Usage:
# cmake -B build-westmere --toolchain cmake/toolchain-westmere.cmake -DCMAKE_BUILD_TYPE=Release
# cmake --build build-westmere
# file build-westmere/app -> should show x86-64, not native
