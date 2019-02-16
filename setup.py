import setuptools

with open("README.md", "r") as fh:
    long_description = fh.read()

setuptools.setup(
    name="sqrc",
    version="0.0.2",
    author="Ruslan Kovtun",
    author_email="koutoftimer@gmail.com",
    description="SQRC (show QR code) is simple utility that takes data from the clipboard and shows you QR code.",
    install_requires=[
        "pyperclip==1.7.0",
        "Pillow==5.4.1",
        "qrcode==6.1"
    ],
    license="GPLv3",
    long_description=long_description,
    long_description_content_type="text/markdown",
    url="https://github.com/koutoftimer/sqrc",
    packages=setuptools.find_packages(),
    classifiers=[
		"Development Status :: 3 - Alpha",
		"Environment :: Console",
		"Intended Audience :: End Users/Desktop",
		"License :: OSI Approved :: GNU General Public License v3 (GPLv3)",
		"Operating System :: OS Independent",
        "Programming Language :: Python :: 3",
		"Topic :: Utilities"
    ],
    data_files=[
        ('', ['LICENSE', 'README.md']),
    ],
	entry_points={
        'console_scripts': [
            'sqrc=sqrc:main',
        ],
    },
)
