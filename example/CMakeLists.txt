cmake_minimum_required(VERSION 2.8)
include(../CMakeAda.cmake)

add_ada_library(AdaTest adalibtest.gpr adatest)

add_executable(main_ada main.c)
target_link_libraries(main_ada ${AdaTestLib})
