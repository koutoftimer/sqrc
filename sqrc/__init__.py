# -*- encoding: utf-8 -*-
import os
from qrcode import make
from pyperclip import paste
from PIL import Image


__all__ = ['main', 'QR_FILE']


# Temporary file will be placed in the same direcoty with executor.
BASE = os.path.dirname(__file__)
QR_FILE = os.path.join(BASE, 'qr.png')


def main():
    with open(QR_FILE, 'wb') as f:
        make(paste()).save(f)
    Image.open(QR_FILE).show()


if __name__ == '__main__':
    main()

