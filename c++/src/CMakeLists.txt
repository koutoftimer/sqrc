project(binary)

set(CMAKE_CXX_STANDARD 14)
set(CMAKE_BUILD_TYPE RELEASE)
set(CMAKE_INCLUDE_CURRENT_DIR ON)
set(CMAKE_AUTOMOC ON)
set(CMAKE_AUTOUIC ON)

foreach(_COMPONENT Widgets Core Gui Svg)
    find_package(Qt5${_COMPONENT} CONFIG REQUIRED)
    list(APPEND qt_libs Qt5::${_COMPONENT})
endforeach(_COMPONENT)

set(sqrc_SRC mainwindow.ui mainwindow.cpp qsquarelayout.cpp main.cpp)

add_executable(sqrc ${sqrc_SRC})
target_link_libraries(sqrc ${qt_libs} qrcodegen) 

install(TARGETS sqrc RUNTIME DESTINATION bin)
