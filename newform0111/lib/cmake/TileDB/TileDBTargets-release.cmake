#----------------------------------------------------------------
# Generated CMake target import file for configuration "Release".
#----------------------------------------------------------------

# Commands may need to know the format version.
set(CMAKE_IMPORT_FILE_VERSION 1)

# Import target "TileDB::tiledb_shared" for configuration "Release"
set_property(TARGET TileDB::tiledb_shared APPEND PROPERTY IMPORTED_CONFIGURATIONS RELEASE)
set_target_properties(TileDB::tiledb_shared PROPERTIES
  IMPORTED_LINK_DEPENDENT_LIBRARIES_RELEASE "TBB::tbb"
  IMPORTED_LOCATION_RELEASE "${_IMPORT_PREFIX}/lib/libtiledb.dylib"
  IMPORTED_SONAME_RELEASE "@rpath/libtiledb.dylib"
  )

list(APPEND _IMPORT_CHECK_TARGETS TileDB::tiledb_shared )
list(APPEND _IMPORT_CHECK_FILES_FOR_TileDB::tiledb_shared "${_IMPORT_PREFIX}/lib/libtiledb.dylib" )

# Commands beyond this point should not need to know the version.
set(CMAKE_IMPORT_FILE_VERSION)
