# -*- encoding: utf-8 -*-
import os
from tempfile import TemporaryFile

from PIL import Image
from pyperclip import paste
from qrcode import make


__all__ = ['main']
__version__ = '0.0.3'


def main():
    f = TemporaryFile()
    make(paste()).save(f)
    Image.open(f).show()


if __name__ == '__main__':
    main()

