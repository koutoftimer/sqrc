SQRC (show QR code) is simple utility that takes data from the clipboard and shows you QR code.
It is very helpfull for transfering text data into you smartphone via QR code recognition.

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

# C++ version

![C++ Qt version preview](https://user-images.githubusercontent.com/4004825/53089779-2eaaaa00-3516-11e9-9307-2b60f12802c2.jpg)

You have to build it manually.

## Build guide

Used Qt SDK version 5.12.1.

1. Aquire source code with submodules:

```bash
$ git clone --recurse-submodules https://github.com/koutoftimer/sqrc.git
```

2. Use `QtCreator` or any other way to build `c++/sqrc-qt/sqrc-qt.pro` project.

   [pyperclip]: https://github.com/asweigart/pyperclip
   [qrcode]: https://github.com/lincolnloop/python-qrcode
   [pillow]: https://github.com/python-pillow/Pillow
