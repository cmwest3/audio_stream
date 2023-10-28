include(FindPackageHandleStandardArgs)
 
# Try to find libraries

# Try to find libraries
find_library(ASOUND_C_LIBRARIES
  NAMES asound
  DOC "ASOUND C libraries"
)

find_library(ASOUND_CXX_LIBRARIES
  NAMES asound
  DOC "ASOUND C++ libraries"
)
 
# Try to find headers
 
find_path(ASOUND_CXX_INCLUDES
  NAMES asoundlib.h
  DOC "ALSA C++ header"
)

# Try to find headers
find_path(ASOUND_C_INCLUDES
  NAMES asoundlib.h
  DOC "ASOUND C header"
)
 
# Handle QUIET and REQUIRED and check the necessary \
# variables were set and if so
# set ``ASOUND_FOUND``
find_package_handle_standard_args(ASOUND REQUIRED_VARS ASOUND_C_LIBRARIES ASOUND_CXX_LIBRARIES ASOUND_CXX_INCLUDES ASOUND_C_INCLUDES)
 
if (ASOUND_FOUND)
  set(ASOUND_INCLUDE_DIRS "${ASOUND_C_INCLUDES}" "${ASOUND_CXX_INCLUDES}")
  list(REMOVE_DUPLICATES ASOUND_INCLUDE_DIRS)
 
  if (NOT TARGET ASOUND::ASOUND)
    add_library(ASOUND::ASOUND UNKNOWN IMPORTED)
    set_target_properties(ASOUND::ASOUND PROPERTIES
      INTERFACE_INCLUDE_DIRECTORIES "${ASOUND_C_INCLUDES}"
      IMPORTED_LOCATION "${ASOUND_C_LIBRARIES}")
  endif()
endif()
