cmake_minimum_required(VERSION 2.8)
include(ExternalProject)


# Builds the project and creates a lib variable to be used in linking named TARGETLib
# LIBFILE must not have prefix nor suffix, and is expected to be static: libadatest.a -> adatest
macro(add_ada_library TARGET GPRFILE LIBFILE)

    # Always build and leave Ada dependencies to gprbuild
    ExternalProject_Add(
        ${TARGET}
        SOURCE_DIR ${CMAKE_CURRENT_SOURCE_DIR}
        BUILD_COMMAND gprbuild -P${CMAKE_CURRENT_SOURCE_DIR}/${GPRFILE} -XOBJ_DIR=${CMAKE_CURRENT_BINARY_DIR}${CMAKE_FILES_DIRECTORY} -XLIB_DIR=${CMAKE_CURRENT_BINARY_DIR}
        ALWAYS 1    # Force build, gprbuild will take care of dependencies
        # BUILD_ALWAYS 1 # For 3.0 higher versions?
        INSTALL_COMMAND ""
    )

    # Actual target library
    set(${TARGET}Lib ${CMAKE_CURRENT_BINARY_DIR}/${CMAKE_STATIC_LIBRARY_PREFIX}${LIBFILE}${CMAKE_STATIC_LIBRARY_SUFFIX})

    # Make the library depend on the external project, so anyone linking to it is implicitly depending on it
    add_custom_command(
        OUTPUT ${${TARGET}Lib}
        DEPENDS ${TARGET})                

endmacro(add_ada_library)


macro(add_ada_executable TARGET GPRFILE)

    # Always build and leave Ada dependencies to gprbuild
    ExternalProject_Add(
        ${TARGET}
        SOURCE_DIR ${CMAKE_CURRENT_SOURCE_DIR}
        BUILD_COMMAND gprbuild -P${CMAKE_CURRENT_SOURCE_DIR}/${GPRFILE} -XOBJ_DIR=${CMAKE_CURRENT_BINARY_DIR}${CMAKE_FILES_DIRECTORY} -XLIB_DIR=${CMAKE_CURRENT_BINARY_DIR}
        ALWAYS 1    # Force build, gprbuild will take care of dependencies
        # BUILD_ALWAYS 1 # For 3.0 higher versions?
        INSTALL_COMMAND ""
    )

endmacro(add_ada_executable)
