FIND_PATH(
    MBEDTLS_INCLUDE_DIR
    NAMES mbedtls/version.h
    HINTS $ENV{MBEDTLS_DIR}/include
        ${PC_MBEDTLS_INCLUDEDIR}
        ${CMAKE_INSTALL_PREFIX}/include
    PATHS /usr/local/include
          /usr/include
)

FIND_LIBRARY(
    MBEDTLS_LIBRARY
    NAMES mbedtls
    HINTS $ENV{MBEDTLS_DIR}/lib
        ${PC_MBEDTLS_LIBDIR}
        ${CMAKE_INSTALL_PREFIX}/lib
        ${CMAKE_INSTALL_PREFIX}/lib64
    PATHS /usr/local/lib
          /usr/local/lib64
          /usr/lib
          /usr/lib64
)

FIND_LIBRARY(
    MBEDCRYPTO_LIBRARY
    NAMES mbedcrypto
    HINTS $ENV{MBEDTLS_DIR}/lib
        ${PC_MBEDTLS_LIBDIR}
        ${CMAKE_INSTALL_PREFIX}/lib
        ${CMAKE_INSTALL_PREFIX}/lib64
    PATHS /usr/local/lib
          /usr/local/lib64
          /usr/lib
          /usr/lib64
)

set(MBEDTLS_INCLUDE_DIRS ${MBEDTLS_INCLUDE_DIR})
set(MBEDTLS_LIBRARIES ${MBEDTLS_LIBRARY} ${MBEDCRYPTO_LIBRARY})

message(STATUS "MBEDTLS LIBRARIES " ${MBEDTLS_LIBRARIES})
message(STATUS "MBEDTLS INCLUDE DIRS " ${MBEDTLS_INCLUDE_DIRS})

INCLUDE(FindPackageHandleStandardArgs)
FIND_PACKAGE_HANDLE_STANDARD_ARGS(MBEDTLS DEFAULT_MSG MBEDTLS_LIBRARY MBEDCRYPTO_LIBRARY MBEDTLS_INCLUDE_DIR)
MARK_AS_ADVANCED(MBEDTLS_LIBRARY MBEDCRYPTO_LIBRARY MBEDTLS_INCLUDE_DIRS)
