# This is 'PlanScreen' CMakeLists.txt file. 'PlanScreen' is application plugin.
# It means that it was created specailly for 'fudy' project and probably
# will be never used outside of it.
# If you're goind to create reusable plugin make sure to build it as
# separate project with proper install commands and CMake.config file.

# 'PlanScreen' resource file. All files have 'plugin/' prefix
qt5_add_resources(PLUGIN_RESOURCES ${CMAKE_CURRENT_LIST_DIR}/PlanScreenPlugin.qrc)

add_library(
    PlanScreen
    SHARED

    ${CMAKE_CURRENT_LIST_DIR}/PlanScreenPlugin.h
    ${CMAKE_CURRENT_LIST_DIR}/PlanScreenPlugin.cpp
    ${CMAKE_CURRENT_LIST_DIR}/PlanScreen.h
    ${CMAKE_CURRENT_LIST_DIR}/PlanScreen.cpp

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
    PlanScreen
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
    PlanScreen
    PRIVATE
        Qt5::Core
        Qt5::Quick
        Qt5::Qml
)

# During plugin searching Qt will be looking for 'qmldir' file
# So we should place it next to our plugin lib.
add_custom_command(
    TARGET PlanScreen
    POST_BUILD
    COMMAND
        ${CMAKE_COMMAND} -E copy
        ${CMAKE_CURRENT_LIST_DIR}/qmldir
        $<TARGET_FILE_DIR:PlanScreen>/qmldir
)
