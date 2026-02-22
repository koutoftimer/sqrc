# https://doc.qt.io/qt-6/cmake-get-started.html
set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED ON)
set(CMAKE_BUILD_TYPE RELEASE)
set(CMAKE_INCLUDE_CURRENT_DIR ON)
set(CMAKE_AUTOMOC ON)
set(CMAKE_AUTOUIC ON)

foreach(_COMPONENT Widgets Core Gui Svg SvgWidgets)
    find_package(Qt6 CONFIG REQUIRED ${_COMPONENT})
    list(APPEND qt_libs Qt6::${_COMPONENT})
endforeach(_COMPONENT)

qt_standard_project_setup()

qt_add_executable(sqrc
    mainwindow.ui mainwindow.cpp
    qsquarelayout.cpp
    main.cpp
)

target_link_libraries(sqrc PRIVATE ${qt_libs} qrcodegen)

target_include_directories(sqrc PRIVATE ../libs/QR-Code-generator/cpp/)

install(TARGETS sqrc
    BUNDLE  DESTINATION .
    RUNTIME DESTINATION ${CMAKE_INSTALL_BINDIR}
)

include(GNUInstallDirs)

qt_generate_deploy_app_script(
    TARGET sqrc
    OUTPUT_SCRIPT deploy_script
    NO_UNSUPPORTED_PLATFORM_ERROR
)
install(SCRIPT ${deploy_script})
