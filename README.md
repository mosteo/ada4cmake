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
add_ada_library(TARGET GPRFILE RELDIR)
# TARGET is the plain name of the library (e.g., adatest for libadatesta.a)
# GPRFILE is the GPR project file that builds the above library
# RELDIR is the relative folder in which gprbuild builds the library (e.g. lib)
```

and then link with:

```cmake
add_executable(main main.c)
target_link_libraries(main plainlibname)
# There is no need to make a explicit dependency on the library
```

For executables built in pure Ada (no C/C++ main file) there is a similar function:

```cmake
add_ada_executable(TARGET GPRFILE RELDIR)
# TARGET is the plain name of the executable
# GPRFILE is the GPR project file that builds said executable
# RELDIR is the relative folder in which gprbuild builds it
``` 

See the `example` folder for details:
```bash
cd example
mkdir build
cd build
cmake ..
make
```

Finally, since these TARGETs are created as IMPORTED, should you need to install them they should be referred as FILES and not TARGETS in the install command.