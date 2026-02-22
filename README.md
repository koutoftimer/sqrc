SQRC (show QR code) is simple utility that takes data from the clipboard and shows you QR code.
It is very helpfull for transfering text data into you smartphone via QR code recognition.

# C++ version

![C++ Qt version preview](https://user-images.githubusercontent.com/4004825/53089779-2eaaaa00-3516-11e9-9307-2b60f12802c2.jpg)

You have to build it manually or take a look at [Issues tab][issue-portable] it could be that executable for your OS has already been built.

## Build guide (outdated)

**Update:** after switching to Qt6 I've only tested building from source using
cmake. I've built AppImage using both `sh ./c++/build-app-image.sh` and `CPack` as
suggested inside `./c++/CMakeLists.txt`.

Used Qt SDK version 5.12.1.

Aquire source code with submodules:

```bash
$ git clone --recurse-submodules https://github.com/koutoftimer/sqrc.git
```

### Build with dynamicaly linked Qt libraries

Use `QtCreator` or any other way to build `c++/sqrc-qt/sqrc-qt.pro` project.

Linux users can use `build-app-image.sh` to create [AppImage][appimage] bundle. It behaves much like staticaly 
linked executable from user's perspective but take about 25% more space. On the other hand it is much faster 
then compiling static Qt library.

### Build with staticaly linked Qt libraries

#### Build static Qt

1. Download [Qt sources v5.12.1][qt-sources]. It can be fine to work with any 5.\* but I was using 5.12.1, no other version were tested.
2. Extract it and configure with 
```
$ ./configure -opensource -confirm-license -release -static \
    -c++std c++14 -nomake examples -nomake tests -nomake tools \
    -prefix ./build
```
Windows users should use `configure.bat` instead.
3. Run `make -j$(nproc) && make -j$(nproc) install`. This will take a while.

#### Build sqrc

1. Go to sqrc's root directory.
2. Make `build` directory and go into it.

```
$ cd c++
$ mkdir build
$ cd build
```
3. Launch `qmake` built with Qt
```
$ /path/to/Qt/build/bin/qmake ../src/sqrc.pro
```
4. Build sqrc with `make`. You can specify `release` option, otherwise both release and debug versions will be in correcponding directories.
```
$ make -j$(nproc) release
```

#### Cross build for Windows with [MXE][mxe]

1. Clone it or download archive for this commit [https://github.com/mxe/mxe/tree/ecca1162cba6017c3b73348312cbebc83e3e47f3](mxe-commit).
You can use any, but I was lucky with this particular one.
2. Check your [system requirements for MXE](mxe-requirements)
3. Go to MXE's root directory and install Qt5 with following command
```
$ make -j$(nproc) qt5
```
This will take a while.
4. To build sqrc with MXE's Qt5 static library do
```
$ PATH="/path/to/mxe/usr/bin:$PATH" /path/to/mxe/i686-w64-mingw32.static/qt5/bin/qmake ../src/sqrc-qt.pro
$ PATH="/path/to/mxe/usr/bin:$PATH" make -j$(nproc)
```
You can specify `release` option, otherwise both release and debug versions will be in correcponding directories.

# Python version

If you already have `python` on your working machine, you can download pythonic version from `pip` in single
command and start using it.

## Installation

Using pip: `pip install sqrc`

## Usage

You have to execute command line

    $ sqrc

or use any other way to launch `sqrc` executable.

## Security notes

Utility consists from 3 external libraries:

1. [`pyperclip`][pyperclip] to access clipboard.
2. [`qrcode`][qrcode] to qenerate QR code for data in the clipboard.
3. [`Pillow`][pillow] to display generated image.

You should dive deaper to discover weak points but none of them is single man project. All dependencies have 20+ contributors.
It is very unlikely to push some maleware into source code.

   [pyperclip]: https://github.com/asweigart/pyperclip
   [qrcode]: https://github.com/lincolnloop/python-qrcode
   [pillow]: https://github.com/python-pillow/Pillow
   [qt-sources]: http://download.qt.io/archive/qt/5.12/5.12.1/single/
   [mxe]: http://mxe.cc
   [mxe-commit]: https://github.com/mxe/mxe/tree/ecca1162cba6017c3b73348312cbebc83e3e47f3
   [mxe-requirements]: https://mxe.cc/#requirements
   [appimage]: https://appimage.org/
   [issue-portable]: https://github.com/koutoftimer/sqrc/issues/1
