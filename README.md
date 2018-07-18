# ada4cmake
CMake macros for simple gnat project inclusion

Rationale
---------
gprbuild/gnatbuild/gnatmake are the simplest way of compiling gnat project files, with powerful dependency resolution built-in and binder/linker steps for proper Ada compliancy. Hence, trying to replicate all their features in CMake would be not only a huge task, but a pointless one.

My current workflow for projects in which I have to cooperate with people using CMake boils down
to this: provide my Ada code in a library they can link against easily and incorporate into the CMake project with minimal fuss. We all Ada lovers know that cooperation is simpler if we don't need to modify other people's workflow to acommodate our toolchain.

This project addresses a typical debian-family open-source setup, in which native packages are used, meaning standard gcc/g++/gnat.

The two macros here provided allow easy integration of Ada code in such a setup.

Usage
-----
**Note:** These macros only work for **out-of-source** building with CMake >= 2.8

In order to make available your Ada code through a library, just include the supplied `CMakeAda.cmake` file and use the following syntax:

```cmake
add_ada_library(TARGET GPRFILE LIBFILE)
# GPRFILE is in the CMakeLists.txt folder
# LIBFILE is the stripped library name, e.g. libadatest.a becomes adatest
```

and then link with:

```cmake
add_executable(main main.c)
target_link_libraries(main ${${TARGET}Lib})
add_dependencies(main ${TARGET})
# Supposing TARGET is AdaTest, you have to write
#    target_link_libraries(main ${AdaTestLib})
```

For executables entirely on the Ada side, things are even simpler:

```cmake
add_ada_executable(TARGET GPRFILE)
``` 

See the `example` folder for details:
```bash
cd example
mkdir build
cd build
cmake ..
make
```

