#!/usr/bin/env bash

# Provide custom path to qmake for Qt6 if you have qmake related errors
# export QMAKE=/usr/lib64/qt6/bin/qmake

die() {
    echo -e "\n\033[0;31m[ERROR]\033[0m $1" >&2
    exit 1
}

BUILD_DIR=$(mktemp -d -p "$TEMP_BASE" sqrc-build-XXXXXX) || die "Could not create temporary directory"
PROJECT_ROOT=$(readlink -f $(dirname $0))

load_tools() {
    readonly -A tools=(
        ['appimagetool-x86_64.AppImage']='https://github.com/AppImage/AppImageKit/releases/download/continuous/appimagetool-x86_64.AppImage'
        ['linuxdeploy-x86_64.AppImage']='https://github.com/linuxdeploy/linuxdeploy/releases/download/continuous/linuxdeploy-x86_64.AppImage'
        ['linuxdeploy-plugin-qt-x86_64.AppImage']='https://github.com/linuxdeploy/linuxdeploy-plugin-qt/releases/download/continuous/linuxdeploy-plugin-qt-x86_64.AppImage'
    )
    for tool in ${!tools[@]}; do
        local tool_path="$PROJECT_ROOT/$tool"
        local tool_url="${tools[$tool]}"
        if [ ! -f "$tool_path" ]; then
            curl --output "$tool_path" --location "$tool_url" || die "Failed to download $tool"
        fi
        if [ ! -x "$tool_path" ]; then
            chmod +x "$tool_path" || die "Failed to make $tool executable"
        fi
    done

    echo [ + ] Tools ready.
}

load_tools

TEMP_BASE=/tmp

export QML_SOURCES_PATHS="$PROJECT_ROOT"/src

if [ -d $BUILD_DIR ]; then
    rm -rf $BUILD_DIR
    mkdir $BUILD_DIR
fi

pushd "$BUILD_DIR"

cmake "$PROJECT_ROOT" -DCMAKE_INSTALL_PREFIX=/usr || die "CMake configuration failed"
make -j$(nproc) || die "Build failed"
make install DESTDIR=AppDir || die "Installation to AppDir failed"

export NO_STRIP=1
"$PROJECT_ROOT/linuxdeploy-x86_64.AppImage" --appdir AppDir --plugin qt --executable src/sqrc --output appimage || die "linuxdeploy failed"

mv SQRC-x86_64.AppImage $PROJECT_ROOT || die "Can't retrieve final AppImage"

popd
rm -rf $BUILD_DIR
