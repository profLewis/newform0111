#----------------------------------------------------------------
# Generated CMake target import file for configuration "Debug".
#----------------------------------------------------------------

# Commands may need to know the format version.
set(CMAKE_IMPORT_FILE_VERSION 1)

# Import target "geotiff_library" for configuration "Debug"
set_property(TARGET geotiff_library APPEND PROPERTY IMPORTED_CONFIGURATIONS DEBUG)
set_target_properties(geotiff_library PROPERTIES
  IMPORTED_LINK_INTERFACE_LIBRARIES_DEBUG "/Users/plewis/Documents/GitHub/newform0111/newform0111/lib/libtiff.dylib;/Users/plewis/Documents/GitHub/newform0111/newform0111/lib/libproj.dylib;/Users/plewis/Documents/GitHub/newform0111/newform0111/lib/libz.dylib;/Users/plewis/Documents/GitHub/newform0111/newform0111/lib/libjpeg.dylib"
  IMPORTED_LOCATION_DEBUG "${_IMPORT_PREFIX}/lib/libgeotiff.5.0.1.dylib"
  IMPORTED_SONAME_DEBUG "/Users/plewis/Documents/GitHub/newform0111/newform0111/lib/libgeotiff.5.dylib"
  )

list(APPEND _IMPORT_CHECK_TARGETS geotiff_library )
list(APPEND _IMPORT_CHECK_FILES_FOR_geotiff_library "${_IMPORT_PREFIX}/lib/libgeotiff.5.0.1.dylib" )

# Commands beyond this point should not need to know the version.
set(CMAKE_IMPORT_FILE_VERSION)
