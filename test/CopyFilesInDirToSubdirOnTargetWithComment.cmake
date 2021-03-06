# /tests/CopyFilesInDirToSubdirOnTargetWithComment.cmake
# Tests setting up a new target to attach a custom command to copy
# files in a directory to a subdirectory.
#
# We pass "" to match as that causes grep to match anything.
#
# See LICENCE.md for Copyright information

include (VeraPPUtilities)
include (CMakeUnit)

set (CMAKE_MODULE_PATH
     ${VERAPP_COMMON_UNIVERSAL_CMAKE_DIRECTORY}
     ${CMAKE_MODULE_PATH})

find_package (VeraPP REQUIRED)

set (DIRECTORY_WITH_FILES
     ${CMAKE_CURRENT_BINARY_DIR}/Directory/)
set (DESTINATION_DIRECTORY
     ${DIRECTORY_WITH_FILES}Destination/)
set (FIRST_FILE
     ${DIRECTORY_WITH_FILES}FirstFile)

file (MAKE_DIRECTORY ${DIRECTORY_WITH_FILES})
file (MAKE_DIRECTORY ${DESTINATION_DIRECTORY})
file (WRITE ${FIRST_FILE} "")

verapp_copy_files_in_dir_to_subdir_on_target (copy_files
                                              COMMENT "My File"
                                              DIRECTORY ${DIRECTORY_WITH_FILES}
                                              DESTINATION
                                              ${DESTINATION_DIRECTORY}
                                              MATCH "*FirstFile")

add_custom_target (on_all ALL)
add_dependencies (on_all copy_files)