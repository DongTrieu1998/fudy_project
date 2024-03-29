# This is 'TodoScreen' CMakeLists.txt file. 'TodoScreen' is application plugin.
# It means that it was created specailly for 'fudy' project and probably
# will be never used outside of it.
# If you're goind to create reusable plugin make sure to build it as
# separate project with proper install commands and CMake.config file.

# 'TodoScreen' resource file. All files have 'plugin/' prefix
qt5_add_resources(PLUGIN_RESOURCES ${CMAKE_CURRENT_LIST_DIR}/TodoScreenPlugin.qrc)

add_library(
    TodoScreen
    SHARED

    ${CMAKE_CURRENT_LIST_DIR}/TodoScreenPlugin.h
    ${CMAKE_CURRENT_LIST_DIR}/TodoScreenPlugin.cpp
    ${CMAKE_CURRENT_LIST_DIR}/TodoScreen.h
    ${CMAKE_CURRENT_LIST_DIR}/TodoScreen.cpp

    # It's not important to include 'qmldir' or 'plugin.qmltypes' here,
    # but it will make IDEs (such as Qt Creator) to include them in project tree
    ${CMAKE_CURRENT_LIST_DIR}/qmldir
    ${CMAKE_CURRENT_LIST_DIR}/plugin.qmltypes

    ${PLUGIN_RESOURCES}
    # Plugin resources file
)

set(CMAKE_AUTOMOC ON)
find_package(Qt5 REQUIRED COMPONENTS Quick Core Qml)

target_compile_features(
    TodoScreen
    PRIVATE
        cxx_auto_type
        cxx_generic_lambdas
)

if ("${CMAKE_CXX_COMPILER_ID}" STREQUAL "GNU")
    target_compile_options(
        ${PROJECT_NAME}
        PRIVATE
            -Wall
            -Wextra
            -Wpedantic
    )
endif()

target_link_libraries(
    TodoScreen
    PRIVATE
        Qt5::Core
        Qt5::Quick
        Qt5::Qml
)

# During plugin searching Qt will be looking for 'qmldir' file
# So we should place it next to our plugin lib.
add_custom_command(
    TARGET TodoScreen
    POST_BUILD
    COMMAND
        ${CMAKE_COMMAND} -E copy
        ${CMAKE_CURRENT_LIST_DIR}/qmldir
        $<TARGET_FILE_DIR:TodoScreen>/qmldir
)
