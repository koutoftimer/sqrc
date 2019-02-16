import os
import clipboard
import qrcode
from PIL import Image


# Temporary file will be placed in the same direcoty with executor.
BASE = os.path.dirname(__file__)
QR_FILE = os.path.join(BASE, 'qr.png')


def main():
    link = clipboard.paste()
    qr = qrcode.make(link)
    with open(QR_FILE, 'wb') as f:
        qr.save(f)
    Image.open(QR_FILE).show()


if __name__ == '__main__':
    main()

