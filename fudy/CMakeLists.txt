cmake_minimum_required(VERSION 3.14)

project(fudy VERSION 0.1 LANGUAGES CXX)

set(CMAKE_AUTOUIC ON)
set(CMAKE_AUTOMOC ON)
set(CMAKE_AUTORCC ON)

set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED ON)
set(CMAKE_TOOLCHAIN_FILE "${CMAKE_BINARY_DIR}/conan_toolchain.cmake")

option(BUILD_SHARED_LIBS "Set the default library type for add_library to STATIC" OFF)

find_package(QT NAMES Qt6 Qt5 REQUIRED)
find_package(Qt${QT_VERSION_MAJOR} REQUIRED COMPONENTS Core Quick Qml Sql LinguistTools)

include(cmake/conanpackage.cmake)
include(cmake/TranslationUtils.cmake)

set(headers
    NoteScreen/StickNoteController.h
    NoteScreen/StickNoteModel.h
    translations/translation/translation.h
    FudyUtils.h
)

set(sources
    NoteScreen/StickNoteController.cpp
    NoteScreen/StickNoteModel.cpp
    translations/translation/translation.cpp
    FudyUtils.cpp
)

set(TS_FILES
    translations/fudy_cn.ts
    translations/fudy_ja.ts
    translations/fudy_us.ts
    translations/fudy_vn.ts
)

set(resources
    qml.qrc
    image.qrc
)

set(PROJECT_SOURCES
        main.cpp
        ${headers}
        ${sources}
        ${resources}
)

if (QT_VERSION VERSION_LESS 5.15.0)
    qt5_add_translation(QM_FILES ${TS_FILES})
else()
    qt_add_translation(QM_FILES ${TS_FILES})
endif()

add_app_translations_resource(APP_RES ${QM_FILES})
add_qt_translations_resource(QT_RES cn ja us vn)

if(${QT_VERSION_MAJOR} GREATER_EQUAL 6)
    qt_add_executable(fudy
        MANUAL_FINALIZATION
        ${PROJECT_SOURCES}
        ${APP_RES}
        ${QT_RES}
)
else()
    add_executable(fudy
        ${PROJECT_SOURCES}
        ${APP_RES}
        ${QT_RES}
    )
endif()

if (NOT TARGET StylingComponents)
     add_subdirectory(StylingComponents "${CMAKE_CURRENT_BINARY_DIR}/StylingComponents" )
endif()

find_package(cereal REQUIRED)

target_link_libraries(fudy
  PRIVATE Qt${QT_VERSION_MAJOR}::Core
  Qt${QT_VERSION_MAJOR}::Quick
  Qt${QT_VERSION_MAJOR}::Qml
  Qt${QT_VERSION_MAJOR}::Sql
  cereal::cereal
  StylingComponents
)

add_dependencies(fudy
    StylingComponents
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
