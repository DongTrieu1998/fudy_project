cmake_minimum_required(VERSION 3.14)

project(styling_components LANGUAGES CXX)

set(CMAKE_AUTOUIC ON)
set(CMAKE_AUTOMOC ON)
set(CMAKE_AUTORCC ON)
set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

find_package(QT NAMES Qt6 Qt5 REQUIRED COMPONENTS Quick Core Qml)
find_package(Qt${QT_VERSION_MAJOR} REQUIRED COMPONENTS Core Quick Core Qml)

# 'styling_components' resource file.
qt5_add_resources(PLUGIN_RESOURCES ${CMAKE_CURRENT_LIST_DIR}/src.qrc)


add_library(
    styling_components
    SHARED

    StylingComponents.h
    StylingComponents.cpp

    myColor.h
    myColor.cpp

    myFont.h
    myFont.cpp

    # It's not important to include 'qmldir' or 'plugin.qmltypes' here,
    # but it will make IDEs (such as Qt Creator) to include them in project tree
    qmldir
    plugin.qmltypes

    ${PLUGIN_RESOURCES}     # Plugin resources file

)

target_link_libraries(
    styling_components
    PRIVATE
        Qt5::Core
        Qt5::Quick
        Qt5::Qml

)

target_compile_definitions(styling_components PRIVATE STYLING_COMPONENT_LIBRARY)
