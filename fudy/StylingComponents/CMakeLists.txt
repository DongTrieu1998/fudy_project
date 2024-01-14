cmake_minimum_required(VERSION 3.14)

project(StylingComponents VERSION 0.1 LANGUAGES CXX)

find_package(QT NAMES Qt6 Qt5 REQUIRED COMPONENTS Core Quick Qml)
find_package(Qt${QT_VERSION_MAJOR} REQUIRED COMPONENTS Core Quick Qml)

set(styling_components_headers
    FudyColor.h
    FudyFont.h
)

set(styling_components_sources
    FudyColor.cpp
    FudyFont.cpp
)

set (sources
	${styling_components_headers}
        ${styling_components_sources}
)

add_library(StylingComponents STATIC ${sources}
)

target_link_libraries(StylingComponents
  PRIVATE Qt${QT_VERSION_MAJOR}::Core
  Qt${QT_VERSION_MAJOR}::Quick
  Qt${QT_VERSION_MAJOR}::Qml
)
