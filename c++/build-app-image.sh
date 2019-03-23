#!/usr/bin/env bash

load_tools() {
    readonly -A tools=(
        ['appimagetool-x86_64.AppImage']='https://github.com/AppImage/AppImageKit/releases/download/continuous/appimagetool-x86_64.AppImage'
        ['linuxdeploy-x86_64.AppImage']='https://github.com/linuxdeploy/linuxdeploy/releases/download/continuous/linuxdeploy-x86_64.AppImage'
        ['linuxdeploy-plugin-qt-x86_64.AppImage']='https://github.com/linuxdeploy/linuxdeploy-plugin-qt/releases/download/continuous/linuxdeploy-plugin-qt-x86_64.AppImage'
    )
    for tool in ${!tools[@]}; do
        [ ! -f "$tool" ] && wget "${tools[$tool]}"
        [ ! -x "$tool" ] && chmod +x "${tools[$tool]}"
    done

    echo [ + ] Tools ready.
}

load_tools

if [ "$CI" == "" ] && [ -d /dev/shm ]; then
    TEMP_BASE=/dev/shm
else
    TEMP_BASE=/tmp
fi

BUILD_DIR=$(mktemp -d -p "$TEMP_BASE" sqrc-build-XXXXXX)
PROJECT_ROOT=$(readlink -f $(dirname $0))
export QML_SOURCES_PATHS="$PROJECT_ROOT"/src

if [ -d $BUILD_DIR ]; then
    rm -rf $BUILD_DIR
    mkdir $BUILD_DIR
fi

pushd "$BUILD_DIR"

cmake "$PROJECT_ROOT" -DCMAKE_INSTALL_PREFIX=/usr \
  && make -j$(nproc) \
  && make install DESTDIR=AppDir \
  && $PROJECT_ROOT/linuxdeploy-x86_64.AppImage --appdir AppDir --plugin qt --output appimage \
  && mv SQRC-x86_64.AppImage $PROJECT_ROOT

popd
rm -rf $BUILD_DIR
