cmake_minimum_required(VERSION 3.5)
include(../CMakeAda.cmake)

add_ada_library(
        ada_lib         # Plain name of the library being built (e.g. libada_lib.a)
        adalibtest.gpr  # gpr file that builds it
        "lib")          # Folder in which it is put (e.g. ./lib)

add_executable(ada_main main.c)
target_link_libraries(ada_main ada_lib)

