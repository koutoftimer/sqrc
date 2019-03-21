cmake_minimum_required(VERSION 3.1.0)

project(sqrc)

set(CMAKE_CXX_STANDARD 14)
# Find includes in corresponding build directories
set(CMAKE_INCLUDE_CURRENT_DIR ON)
# Instruct CMake to run moc automatically when needed
set(CMAKE_AUTOMOC ON)
# Create code from a list of Qt designer ui files
set(CMAKE_AUTOUIC ON)
# set(CMAKE_PREFIX_PATH /srv/git/mxe/usr/i686-w64-mingw32.static/qt5/lib/cmake/)
set(CMAKE_PREFIX_PATH /srv/git/qt-static/lib/cmake/)

# Find the QtWidgets library
foreach(_COMPONENT Widgets Core Gui Svg)
    find_package(Qt5${_COMPONENT} CONFIG REQUIRED)
    list(APPEND qt_libs Qt5::${_COMPONENT})
endforeach(_COMPONENT)

# Populate a CMake variable with the sources
set(sqrc_SRC
    src/mainwindow.ui
    src/mainwindow.cpp
    src/qsquarelayout.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/libs/QR-Code-generator/cpp/BitBuffer.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/libs/QR-Code-generator/cpp/QrCode.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/libs/QR-Code-generator/cpp/QrSegment.cpp
    src/main.cpp
)
# Tell CMake to create the helloworld executable
add_executable(sqrc ${sqrc_SRC})
# Use the Widgets module from Qt 5
target_link_libraries(sqrc ${qt_libs}) 

target_include_directories(sqrc PUBLIC
    ${CMAKE_CURRENT_SOURCE_DIR}/libs/QR-Code-generator/cpp/
)

set(CMAKE_BUILD_TYPE RELEASE)
