cmake_minimum_required(VERSION 3.14)

project(fudy VERSION 0.1 LANGUAGES CXX)

set(CMAKE_AUTOUIC ON)
set(CMAKE_AUTOMOC ON)
set(CMAKE_AUTORCC ON)

set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

find_package(QT NAMES Qt6 Qt5 REQUIRED COMPONENTS Core Quick Qml)
find_package(Qt${QT_VERSION_MAJOR} REQUIRED COMPONENTS Core Quick Qml)

set(resources
    qml.qrc
    image.qrc
)

set(PROJECT_SOURCES
        main.cpp
        ${resources}
)

if(${QT_VERSION_MAJOR} GREATER_EQUAL 6)
    qt_add_executable(fudy
        MANUAL_FINALIZATION
        ${PROJECT_SOURCES}
    )
# Define target properties for Android with Qt 6 as:
#    set_property(TARGET fudy APPEND PROPERTY QT_ANDROID_PACKAGE_SOURCE_DIR
#                 ${CMAKE_CURRENT_SOURCE_DIR}/android)
# For more information, see https://doc.qt.io/qt-6/qt-add-executable.html#target-creation
else()
    if(ANDROID)
        add_library(fudy SHARED
            ${PROJECT_SOURCES}
        )
# Define properties for Android with Qt 5 after find_package() calls as:
#    set(ANDROID_PACKAGE_SOURCE_DIR "${CMAKE_CURRENT_SOURCE_DIR}/android")
    else()
        add_executable(fudy
          ${PROJECT_SOURCES}
        )
    endif()
endif()

if (NOT TARGET StylingComponents)
     add_subdirectory(StylingComponents "${CMAKE_CURRENT_BINARY_DIR}/StylingComponents" )
endif() 

if (NOT TARGET NoteScreen)
     add_subdirectory(NoteScreen "${CMAKE_CURRENT_BINARY_DIR}/NoteScreen")
endif()

if (NOT TARGET PlanScreen)
     add_subdirectory(PlanScreen "${CMAKE_CURRENT_BINARY_DIR}/PlanScreen")
endif()

if (NOT TARGET TodoScreen)
     add_subdirectory(TodoScreen "${CMAKE_CURRENT_BINARY_DIR}/TodoScreen")
endif()

if (NOT TARGET WorkspaceScreen)
     add_subdirectory(WorkspaceScreen "${CMAKE_CURRENT_BINARY_DIR}/WorkspaceScreen")
endif()

target_link_libraries(fudy
  PRIVATE Qt${QT_VERSION_MAJOR}::Core
  Qt${QT_VERSION_MAJOR}::Quick
  Qt${QT_VERSION_MAJOR}::Qml
  StylingComponents
  NoteScreen
  PlanScreen
  TodoScreen
  WorkspaceScreen
)

add_dependencies(fudy
    StylingComponents
    NoteScreen
    PlanScreen
    TodoScreen
    WorkspaceScreen
)

# Qt for iOS sets MACOSX_BUNDLE_GUI_IDENTIFIER automatically since Qt 6.1.
# If you are developing for iOS or macOS you should consider setting an
# explicit, fixed bundle identifier manually though.
if(${QT_VERSION} VERSION_LESS 6.1.0)
  set(BUNDLE_ID_OPTION MACOSX_BUNDLE_GUI_IDENTIFIER com.example.fudy)
endif()
set_target_properties(fudy PROPERTIES
    ${BUNDLE_ID_OPTION}
    MACOSX_BUNDLE_BUNDLE_VERSION ${PROJECT_VERSION}
    MACOSX_BUNDLE_SHORT_VERSION_STRING ${PROJECT_VERSION_MAJOR}.${PROJECT_VERSION_MINOR}
    MACOSX_BUNDLE TRUE
    WIN32_EXECUTABLE TRUE
)

include(GNUInstallDirs)
install(TARGETS fudy
    BUNDLE DESTINATION .
    LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR})

if(QT_VERSION_MAJOR EQUAL 6)
    qt_import_qml_plugins(fudy)
    qt_finalize_executable(fudy)
endif()
