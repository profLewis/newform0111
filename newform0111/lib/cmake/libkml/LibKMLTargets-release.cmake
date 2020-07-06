#----------------------------------------------------------------
# Generated CMake target import file for configuration "Release".
#----------------------------------------------------------------

# Commands may need to know the format version.
set(CMAKE_IMPORT_FILE_VERSION 1)

# Import target "kmlbase" for configuration "Release"
set_property(TARGET kmlbase APPEND PROPERTY IMPORTED_CONFIGURATIONS RELEASE)
set_target_properties(kmlbase PROPERTIES
  IMPORTED_LINK_INTERFACE_LIBRARIES_RELEASE "/Users/plewis/Documents/GitHub/newform0111/newform0111/lib/libexpat.dylib;/Users/plewis/Documents/GitHub/newform0111/newform0111/lib/libz.dylib;/Users/plewis/Documents/GitHub/newform0111/newform0111/lib/libminizip.dylib;/Users/plewis/Documents/GitHub/newform0111/newform0111/lib/liburiparser.dylib;/Users/plewis/Documents/GitHub/newform0111/newform0111/lib/libexpat.dylib"
  IMPORTED_LOCATION_RELEASE "/Users/plewis/Documents/GitHub/newform0111/newform0111/lib/libkmlbase.1.3.0.dylib"
  IMPORTED_SONAME_RELEASE "libkmlbase.1.dylib"
  )

list(APPEND _IMPORT_CHECK_TARGETS kmlbase )
list(APPEND _IMPORT_CHECK_FILES_FOR_kmlbase "/Users/plewis/Documents/GitHub/newform0111/newform0111/lib/libkmlbase.1.3.0.dylib" )

# Import target "kmldom" for configuration "Release"
set_property(TARGET kmldom APPEND PROPERTY IMPORTED_CONFIGURATIONS RELEASE)
set_target_properties(kmldom PROPERTIES
  IMPORTED_LINK_INTERFACE_LIBRARIES_RELEASE "kmlbase"
  IMPORTED_LOCATION_RELEASE "/Users/plewis/Documents/GitHub/newform0111/newform0111/lib/libkmldom.1.3.0.dylib"
  IMPORTED_SONAME_RELEASE "libkmldom.1.dylib"
  )

list(APPEND _IMPORT_CHECK_TARGETS kmldom )
list(APPEND _IMPORT_CHECK_FILES_FOR_kmldom "/Users/plewis/Documents/GitHub/newform0111/newform0111/lib/libkmldom.1.3.0.dylib" )

# Import target "kmlxsd" for configuration "Release"
set_property(TARGET kmlxsd APPEND PROPERTY IMPORTED_CONFIGURATIONS RELEASE)
set_target_properties(kmlxsd PROPERTIES
  IMPORTED_LINK_INTERFACE_LIBRARIES_RELEASE "kmlbase"
  IMPORTED_LOCATION_RELEASE "/Users/plewis/Documents/GitHub/newform0111/newform0111/lib/libkmlxsd.1.3.0.dylib"
  IMPORTED_SONAME_RELEASE "libkmlxsd.1.dylib"
  )

list(APPEND _IMPORT_CHECK_TARGETS kmlxsd )
list(APPEND _IMPORT_CHECK_FILES_FOR_kmlxsd "/Users/plewis/Documents/GitHub/newform0111/newform0111/lib/libkmlxsd.1.3.0.dylib" )

# Import target "kmlengine" for configuration "Release"
set_property(TARGET kmlengine APPEND PROPERTY IMPORTED_CONFIGURATIONS RELEASE)
set_target_properties(kmlengine PROPERTIES
  IMPORTED_LINK_INTERFACE_LIBRARIES_RELEASE "kmlbase;kmldom"
  IMPORTED_LOCATION_RELEASE "/Users/plewis/Documents/GitHub/newform0111/newform0111/lib/libkmlengine.1.3.0.dylib"
  IMPORTED_SONAME_RELEASE "libkmlengine.1.dylib"
  )

list(APPEND _IMPORT_CHECK_TARGETS kmlengine )
list(APPEND _IMPORT_CHECK_FILES_FOR_kmlengine "/Users/plewis/Documents/GitHub/newform0111/newform0111/lib/libkmlengine.1.3.0.dylib" )

# Import target "kmlconvenience" for configuration "Release"
set_property(TARGET kmlconvenience APPEND PROPERTY IMPORTED_CONFIGURATIONS RELEASE)
set_target_properties(kmlconvenience PROPERTIES
  IMPORTED_LINK_INTERFACE_LIBRARIES_RELEASE "kmlengine;kmldom;kmlbase"
  IMPORTED_LOCATION_RELEASE "/Users/plewis/Documents/GitHub/newform0111/newform0111/lib/libkmlconvenience.1.3.0.dylib"
  IMPORTED_SONAME_RELEASE "libkmlconvenience.1.dylib"
  )

list(APPEND _IMPORT_CHECK_TARGETS kmlconvenience )
list(APPEND _IMPORT_CHECK_FILES_FOR_kmlconvenience "/Users/plewis/Documents/GitHub/newform0111/newform0111/lib/libkmlconvenience.1.3.0.dylib" )

# Import target "kmlregionator" for configuration "Release"
set_property(TARGET kmlregionator APPEND PROPERTY IMPORTED_CONFIGURATIONS RELEASE)
set_target_properties(kmlregionator PROPERTIES
  IMPORTED_LINK_INTERFACE_LIBRARIES_RELEASE "kmlbase;kmldom;kmlengine;kmlconvenience"
  IMPORTED_LOCATION_RELEASE "/Users/plewis/Documents/GitHub/newform0111/newform0111/lib/libkmlregionator.1.3.0.dylib"
  IMPORTED_SONAME_RELEASE "libkmlregionator.1.dylib"
  )

list(APPEND _IMPORT_CHECK_TARGETS kmlregionator )
list(APPEND _IMPORT_CHECK_FILES_FOR_kmlregionator "/Users/plewis/Documents/GitHub/newform0111/newform0111/lib/libkmlregionator.1.3.0.dylib" )

# Commands beyond this point should not need to know the version.
set(CMAKE_IMPORT_FILE_VERSION)
