# /tests/CheckConformanceForTargetVerify.cmake
# Verifies that we actually ran vera++ on our custom target with the specified
# sources.
#
# See LICENCE.md for Copyright information.

include (${VERAPP_COMMON_UNIVERSAL_CMAKE_TESTS_DIRECTORY}/CMakeUnit.cmake)

set (DESTINATION_DIRECTORY
     ${CMAKE_CURRENT_BINARY_DIR}/subdirectory)

set (BUILD_OUTPUT ${CMAKE_CURRENT_BINARY_DIR}/BUILD.output)

assert_file_has_line_matching (${BUILD_OUTPUT}
                               "^.*vera.. .*Source.cpp.*$")
assert_file_does_not_have_line_matching (${BUILD_OUTPUT}
                                         "^.*vera.. .*GeneratedSource.cpp.*$")