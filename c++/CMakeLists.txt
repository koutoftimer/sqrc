cmake_minimum_required(VERSION 3.23)

project(sqrc)

add_subdirectory(libs/QR-Code-generator/cpp)

add_subdirectory(resources)
add_subdirectory(src)

# For CPack cmake 4.2+ required
# you can build latest stable from the sources here
# https://cmake.org/download/#latest
#
# 1. Download appimagetool as in ./build-app-image.sh and symlink it
# $ ln -s appimagetool-x86_64.AppImage appimagetool
# 2. Build an app
# $ cmake -B build/ && cmake --build build/ -j$(nproc)
# 3. Use CPack to build AppImage
# $ cpack --config build/CPackConfig.cmake -B build/
set(CPACK_PACKAGE_NAME "sqrc")
set(CPACK_PACKAGE_VENDOR "Ruslan Kovtun")
set(CPACK_PACKAGE_DESCRIPTION_SUMMARY "Qt6 QR Code Generator")
set(CPACK_PACKAGE_VERSION "1.0.0")

set(CPACK_GENERATOR "AppImage")

set(CPACK_PACKAGE_ICON "sqrc.svg")

include(CPack)
