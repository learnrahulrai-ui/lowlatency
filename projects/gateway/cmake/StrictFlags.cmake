# StrictFlags.cmake - Reconstructs what best companies actually use
# Source chain:
# - OpenSSF Hardening TL;DR + Google/Abseil -Wall -Wextra -Wpedantic -Werror
# - Full GCC dump from 2007: -Wabi -Wctor-dtor-privacy -Wnon-virtual-dtor etc.
# - Apache Arrow -Weverything suppression pattern
# - Bloomberg BDE: -march=westmere -m64 -D_GLIBCXX_USE_CXX11_ABI=0
# - HFT: -fno-exceptions -fno-rtti -O3 -march=native -mtune=native -flto

function(add_strict_flags TARGET)

  # === Common base for all compilers (Bloomberg + OpenSSF baseline) ===
  # These leave no trace in binary (warnings only)
  # Then hardening flags that DO affect binary

  if(CMAKE_CXX_COMPILER_ID MATCHES "GNU")
    # ---- GCC strictest practical set (200+ flags family) ----
    # Directly from exhaustive list: g++ -pedantic -Wall -Wabi -Wctor-dtor-privacy -Wnon-virtual-dtor -Wreorder -Weffc++ -Wstrict-null-sentinel -Wold-style-cast -Woverloaded-virtual -Wsign-promo -Winit-self -Wswitch-default -Wswitch-enum -Wunused-parameter -Wextra -Wunknown-pragmas -Wfloat-equal -Wundef -Wshadow -Wpointer-arith -Wcast-qual -Wcast-align -Wwrite-strings -Wconversion -Wsign-compare -Wunreachable-code
    target_compile_options(${TARGET} PRIVATE
      -Wall
      -Wextra
      -Wpedantic
      $<$<BOOL:${ENABLE_WERROR}>:-Werror>
      -Wformat=2
      -Werror=format-security
      -Wformat-overflow=2
      -Wformat-truncation=2
      -Wconversion
      -Wsign-conversion
      -Wfloat-conversion
      -Wimplicit-fallthrough=5
      -Wshadow=compatible-local
      -Wold-style-cast
      -Wzero-as-null-pointer-constant
      -Woverloaded-virtual
      -Wsign-promo
      -Wreorder
      -Wctor-dtor-privacy
      -Wstrict-null-sentinel
      -Winit-self
      -Wswitch-default
      -Wswitch-enum
      -Wunused-parameter
      -Wfloat-equal
      -Wundef
      -Wpointer-arith
      -Wcast-qual
      -Wcast-align=strict
      -Wwrite-strings
      -Wsign-compare
      -Wunreachable-code
      -Wdouble-promotion
      -Wnull-dereference
      -Wstrict-aliasing=3
      -Wstrict-overflow=5
      -Wduplicated-cond
      -Wduplicated-branches
      -Wlogical-op
      -Wrestrict
      -Wuseless-cast
      -Wsuggest-override
      -Wstringop-overflow=4
      -Wstringop-truncation
      -Warray-bounds=2
      -Walloc-zero
      -Wtrampolines
      $<$<VERSION_GREATER_EQUAL:${CMAKE_CXX_COMPILER_VERSION},14.0>:-Wnrvo>
    )

    # ---- Effective C++ (Scott Meyers) ----
    # Warn about violations of Effective C++ guidelines
    target_compile_options(${TARGET} PRIVATE -Weffc++ -Wno-non-virtual-dtor)

    # ---- Hardening (OpenSSF + production) ----
    if(ENABLE_HARDENING)
      target_compile_options(${TARGET} PRIVATE
        -U_FORTIFY_SOURCE
        -D_FORTIFY_SOURCE=3
        -D_GLIBCXX_ASSERTIONS
        -fstrict-flex-arrays=3
        -fstack-clash-protection
        -fstack-protector-strong
        -fcf-protection=full
        -ftrivial-auto-var-init=zero
        -fno-delete-null-pointer-checks
        -fno-strict-overflow
        -fno-strict-aliasing
        -fPIE
      )
      target_link_options(${TARGET} PRIVATE
        -Wl,-z,relro
        -Wl,-z,now
        -Wl,-z,noexecstack
        -Wl,-z,nodlopen
        -Wl,--as-needed
        -Wl,--no-copy-dt-needed-entries
        -pie
      )
    endif()

    # ---- Standard Library Debug Traps ----
    if(ENABLE_GLIBCXX_DEBUG)
      target_compile_definitions(${TARGET} PRIVATE
        _GLIBCXX_DEBUG
        _GLIBCXX_DEBUG_PEDANTIC
      )
    endif()

    # ---- Multi-threading company flags ----
    # Always need -pthread for std::thread, plus -fexceptions for glibc pthreads per OpenSSF
    target_compile_options(${TARGET} PRIVATE -pthread -fexceptions)
    target_link_options(${TARGET} PRIVATE -pthread)

    # ---- HFT mode override ----
    if(HFT_MODE)
      # HFT removes exceptions/RTTI - latency poison
      target_compile_options(${TARGET} PRIVATE
        -O3
        -march=native
        -mtune=native
        -flto=auto
        -fno-exceptions
        -fno-rtti
        -funroll-loops
        # -ffast-math breaks IEEE754, only opt-in for HFT
        # -ffast-math
      )
      target_link_options(${TARGET} PRIVATE -flto=auto -march=native)
      # HFT cannot have -fexceptions, so override pthreads exception need:
      # Use -fno-exceptions but keep -pthread linking
    else()
      # Normal mode O levels: -O1 basic, -O2 standard, -O3 aggressive
      # $<$<CONFIG:Release>:-O2> handled by CMake default, but we force for clarity
      target_compile_options(${TARGET} PRIVATE
        $<$<CONFIG:Release>:-O2>
        $<$<CONFIG:RelWithDebInfo>:-O2 -g>
        $<$<CONFIG:Debug>:-Og -g>
      )
    endif()

    # ---- Sanitizers ----
    if(ENABLE_ASAN)
      target_compile_options(${TARGET} PRIVATE -fsanitize=address -fno-omit-frame-pointer -g)
      target_link_options(${TARGET} PRIVATE -fsanitize=address)
    endif()
    if(ENABLE_UBSAN)
      target_compile_options(${TARGET} PRIVATE
        -fsanitize=undefined,bounds-strict,pointer-compare,pointer-subtract
        -fno-sanitize-recover=all -fno-omit-frame-pointer -g)
      target_link_options(${TARGET} PRIVATE -fsanitize=undefined,bounds-strict)
    endif()
    if(ENABLE_TSAN)
      # TSan best with -O1 -g per workshop practice
      target_compile_options(${TARGET} PRIVATE -fsanitize=thread -g -O1 -fno-omit-frame-pointer)
      target_link_options(${TARGET} PRIVATE -fsanitize=thread)
    endif()

  elseif(CMAKE_CXX_COMPILER_ID MATCHES "Clang")

    # ---- Clang strictest: -Weverything + strategic -Wno-* (from Arrow + crucible) ----
    # -Weverything enables ALL diagnostics, but contradicts itself, so suppress:
    target_compile_options(${TARGET} PRIVATE
      -Weverything
      # C++98 compat not relevant for C++20
      -Wno-c++98-compat
      -Wno-c++98-compat-pedantic
      -Wno-c++98-compat-extra-semi
      # Too noisy / intentional
      -Wno-padded
      -Wno-weak-vtables
      -Wno-weak-template-vtables
      -Wno-exit-time-destructors
      -Wno-global-constructors
      -Wno-covered-switch-default
      -Wno-switch-enum
      -Wno-undefined-reinterpret-cast
      -Wno-old-style-cast
      -Wno-float-equal
      -Wno-double-promotion
      -Wno-missing-prototypes
      -Wno-missing-variable-declarations
      -Wno-unused-macros
      -Wno-documentation
      -Wno-documentation-unknown-command
      -Wno-reserved-id-macro
      -Wno-undef
      -Wno-unsafe-buffer-usage
      # Keep conversion warnings but allow sign conversion optionally
      -Wconversion
      -Wno-sign-conversion
      -Wthread-safety
      -Wthread-safety-beta
      -Wthread-safety-negative
      -Wthread-safety-precise
      -Wcast-qual
      -Wcast-align
      -Wno-non-virtual-dtor
      $<$<BOOL:${ENABLE_WERROR}>:-Werror>
    )

    if(ENABLE_GLIBCXX_DEBUG)
      target_compile_definitions(${TARGET} PRIVATE
        _LIBCPP_HARDENING_MODE=_LIBCPP_HARDENING_MODE_DEBUG
      )
    endif()

    if(ENABLE_HARDENING)
      target_compile_options(${TARGET} PRIVATE
        -U_FORTIFY_SOURCE
        -D_FORTIFY_SOURCE=3
        -D_GLIBCXX_ASSERTIONS
        -D_LIBCPP_HARDENING_MODE=_LIBCPP_HARDENING_MODE_FAST
        -fstrict-flex-arrays=3
        -fstack-clash-protection
        -fstack-protector-strong
        -ftrivial-auto-var-init=zero
        -fPIE
      )
      target_link_options(${TARGET} PRIVATE
        -Wl,-z,relro
        -Wl,-z,now
        -Wl,-z,noexecstack
        -Wl,-z,nodlopen
        -pie
      )
    endif()

    target_compile_options(${TARGET} PRIVATE -pthread)
    target_link_options(${TARGET} PRIVATE -pthread)

    if(HFT_MODE)
      target_compile_options(${TARGET} PRIVATE -O3 -march=native -mtune=native -flto=auto -fno-exceptions -fno-rtti -funroll-loops)
      target_link_options(${TARGET} PRIVATE -flto=auto)
    endif()

    if(ENABLE_TSAN)
      target_compile_options(${TARGET} PRIVATE -fsanitize=thread -g -O1 -fno-omit-frame-pointer)
      target_link_options(${TARGET} PRIVATE -fsanitize=thread)
    endif()
    if(ENABLE_ASAN)
      target_compile_options(${TARGET} PRIVATE -fsanitize=address -fno-omit-frame-pointer -g)
      target_link_options(${TARGET} PRIVATE -fsanitize=address)
    endif()
    if(ENABLE_UBSAN)
      target_compile_options(${TARGET} PRIVATE
        -fsanitize=undefined,integer,nullability,float-divide-by-zero,implicit-conversion,local-bounds
        -fno-sanitize=unsigned-integer-overflow -fno-sanitize-recover=all -fno-omit-frame-pointer)
      target_link_options(${TARGET} PRIVATE -fsanitize=undefined,integer,nullability)
    endif()

  elseif(MSVC)
    # MSVC equivalent: /W4 /WX + suppress abseil warnings
    target_compile_options(${TARGET} PRIVATE
      /W4
      $<$<BOOL:${ENABLE_WERROR}>:/WX>
      /wd4702 /wd4100
      /permissive-
      /Zc:__cplusplus
      /utf-8
    )
    if(ENABLE_HARDENING)
      target_compile_options(${TARGET} PRIVATE /GS /guard:cf)
      target_link_options(${TARGET} PRIVATE /DYNAMICBASE /NXCOMPAT /GUARD:CF)
    endif()
  endif()

  # ---- Extra GCC analyzer (opt-in, 30+ checks, slow) ----
  # -fanalyzer + -Wanalyzer-double-free, -Wanalyzer-null-dereference, etc.
  if(CMAKE_CXX_COMPILER_ID STREQUAL "GNU" AND DEFINED ENABLE_ANALYZER AND ENABLE_ANALYZER)
    target_compile_options(${TARGET} PRIVATE
      -fanalyzer
      -Wanalyzer-double-free
      -Wanalyzer-double-fclose
      -Wanalyzer-use-after-free
      -Wanalyzer-null-dereference
      -Wanalyzer-possible-null-dereference
      -Wanalyzer-malloc-leak
      -Wanalyzer-file-leak
      -Wanalyzer-fd-leak
    )
  endif()

endfunction()
