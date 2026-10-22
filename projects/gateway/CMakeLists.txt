cmake_minimum_required(VERSION 3.10)
project(Gateway VERSION 1.0 LANGUAGES CXX)

# Require C++17 standard
set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED ON)
set(CMAKE_CXX_EXTENSIONS OFF)

# Build configuration options (matching Tradeweb / OpenSSF / HFT flag taxonomy)
option(ENABLE_WERROR "Treat compiler warnings as errors" ON)
option(ENABLE_HARDENING "Enable OpenSSF / production hardening flags" ON)
option(ENABLE_ANALYZER "Enable GCC static path analyzer (-fanalyzer)" OFF)
option(ENABLE_ASAN "Enable AddressSanitizer" OFF)
option(ENABLE_UBSAN "Enable UndefinedBehaviorSanitizer" OFF)
option(ENABLE_TSAN "Enable ThreadSanitizer" OFF)
option(ENABLE_GLIBCXX_DEBUG "Enable standard library debug traps" OFF)
option(HFT_MODE "Enable aggressive HFT optimizations (-O3, -march=native, LTO)" OFF)

find_package(Threads REQUIRED)

# Executable target
add_executable(gateway
    src/main.cpp
)

target_include_directories(gateway PRIVATE
    ${CMAKE_CURRENT_SOURCE_DIR}/src
)

target_link_libraries(gateway PRIVATE
    Threads::Threads
)

# Apply strict compiler flags
include(${CMAKE_CURRENT_SOURCE_DIR}/cmake/StrictFlags.cmake)
add_strict_flags(gateway)

# Smoke tests / CLI harness
enable_testing()
add_test(NAME gateway_smoke COMMAND gateway)
add_test(NAME gateway_decode_smoke COMMAND gateway decode dummy.bin)
add_test(NAME gateway_risk_smoke COMMAND gateway risk dummy.bin)
add_test(NAME gateway_grid_smoke COMMAND gateway grid dummy.txt)

message(STATUS "=== Gateway Build Configuration ===")
message(STATUS "C++ Compiler: ${CMAKE_CXX_COMPILER_ID} ${CMAKE_CXX_COMPILER_VERSION}")
message(STATUS "C++ Standard: C++${CMAKE_CXX_STANDARD}")
message(STATUS "Strict Warnings (-Werror): ${ENABLE_WERROR}")
message(STATUS "Hardening Enabled: ${ENABLE_HARDENING}")
message(STATUS "HFT Mode: ${HFT_MODE}")
message(STATUS "Sanitizers: ASan=${ENABLE_ASAN}, UBSan=${ENABLE_UBSAN}, TSan=${ENABLE_TSAN}")
