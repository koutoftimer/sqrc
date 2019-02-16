SQRC (show QR code) is simple utility that takes data from the clipboard and shows you QR code.
It is very helpfull for transfering text data into you smartphone via QR code recognition.

# Installation

Using pip: `pip install sqrc`

# Usage

You have to execute command line

    $ sqrc

or use any other way to launch `sqrc` executable.

# Security notes

Utility consists from 3 external libraries:

1. [`pyperclip`][pyperclip] to access clipboard.
2. [`qrcode`][qrcode] to qenerate QR code for data in the clipboard.
3. [`Pillow`][pillow] to display generated image.

You should dive deaper to discover weak points but none of them is single man project. All dependencies have 20+ contributors.
It is very unlikely to push some maleware into source code.

   [pyperclip]: https://github.com/asweigart/pyperclip
   [qrcode]: https://github.com/lincolnloop/python-qrcode
   [pillow]: https://github.com/python-pillow/Pillow
