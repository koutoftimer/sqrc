cmake_minimum_required(VERSION 3.1.0)

project(sqrc)

# Find includes in corresponding build directories
set(CMAKE_INCLUDE_CURRENT_DIR ON)
# Instruct CMake to run moc automatically when needed
set(CMAKE_AUTOMOC ON)
# Create code from a list of Qt designer ui files
set(CMAKE_AUTOUIC ON)

# Find the QtWidgets library
find_package(Qt5Widgets CONFIG REQUIRED)
find_package(Qt5Core CONFIG REQUIRED)
find_package(Qt5Gui CONFIG REQUIRED)
find_package(Qt5Svg CONFIG REQUIRED)

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
target_link_libraries(sqrc 
    Qt5::Widgets 
    Qt5::Core
    Qt5::Gui
    Qt5::Svg
)

target_include_directories(sqrc PUBLIC
    ${CMAKE_CURRENT_SOURCE_DIR}/libs/QR-Code-generator/cpp/
)

