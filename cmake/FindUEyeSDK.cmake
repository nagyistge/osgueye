# - Find UEye SDK
# Find the native UEye headers and libraries.
#
#  UEYE_SDK_INCLUDE_DIRS - where to find uEye.h, etc.
#  UEYE_SDK_LIBRARIES    - List of libraries when using UEye.
#  UEYE_SDK_FOUND        - True if UEye found.


SET(UEYE_SDK_ROOT_DIR
    "${UEYE_SDK_ROOT_DIR}"
    CACHE
    PATH
    "Root directory to search for UEye SDK")

# Look for the header file.
FIND_PATH(UEYE_SDK_INCLUDE_DIRS NAMES uEye.h HINTS 
	${UEYE_SDK_ROOT_DIR}/include )
	
FIND_PATH(UEYE_SDK_INCLUDE_DIRS NAMES uEye.h HINTS 
	${UEYE_SDK_ROOT_DIR}/include )

# Determine architecture
IF(CMAKE_SIZEOF_VOID_P MATCHES "8")
	FIND_LIBRARY(UEYE_SDK_LIBRARY NAMES uEye_api_64 ueye_tools_64 HINTS ${UEYE_SDK_ROOT_DIR} ${UEYE_SDK_ROOT_DIR}/Lib)
	FIND_LIBRARY(UEYE_SDK_LIBRARY_DEBUG NAMES uEye_api_64 ueye_tools_64 HINTS ${UEYE_SDK_ROOT_DIR} ${UEYE_SDK_ROOT_DIR}/Lib)
ELSE()
    # Look for the library.
	FIND_LIBRARY(UEYE_SDK_LIBRARY NAMES uEye_api uEye_tools HINTS ${UEYE_SDK_ROOT_DIR} ${UEYE_SDK_ROOT_DIR}/Lib)
	FIND_LIBRARY(UEYE_SDK_LIBRARY_DEBUG NAMES uEye_api uEye_tools HINTS ${UEYE_SDK_ROOT_DIR} ${UEYE_SDK_ROOT_DIR}/Lib)
ENDIF()

MARK_AS_ADVANCED(UEYE_SDK_LIBRARY)
MARK_AS_ADVANCED(UEYE_SDK_LIBRARY_DEBUG)


SET(UEYE_SDK_LIBRARIES optimized ${UEYE_SDK_LIBRARY} debug ${UEYE_SDK_LIBRARY_DEBUG})

# handle the QUIETLY and REQUIRED arguments and set UEYE_SDK_FOUND to TRUE if
# all listed variables are TRUE
INCLUDE(FindPackageHandleStandardArgs)
FIND_PACKAGE_HANDLE_STANDARD_ARGS(UEyeSDK DEFAULT_MSG UEYE_SDK_LIBRARIES UEYE_SDK_INCLUDE_DIRS)

MARK_AS_ADVANCED(UEYE_SDK_LIBRARIES UEYE_SDK_INCLUDE_DIRS)
