#-------------------------------------------------
#
# Project created by QtCreator 2019-02-17T21:41:59
#
#-------------------------------------------------

QT       += core gui svg

greaterThan(QT_MAJOR_VERSION, 4): QT += widgets

TARGET = sqrc-qt
TEMPLATE = app

# The following define makes your compiler emit warnings if you use
# any feature of Qt which has been marked as deprecated (the exact warnings
# depend on your compiler). Please consult the documentation of the
# deprecated API in order to know how to port your code away from it.
DEFINES += QT_DEPRECATED_WARNINGS

# You can also make your code fail to compile if you use deprecated APIs.
# In order to do so, uncomment the following line.
# You can also select to disable deprecated APIs only up to a certain version of Qt.
#DEFINES += QT_DISABLE_DEPRECATED_BEFORE=0x060000    # disables all the APIs deprecated before Qt 6.0.0

DEPENDPATH  += "../libs/QR-Code-generator/cpp"
INCLUDEPATH += "../libs/QR-Code-generator/cpp"

CONFIG += c++14 static-runtime static debug_and_release

SOURCES += \
        main.cpp \
        mainwindow.cpp \
        ../libs/QR-Code-generator/cpp/QrCode.cpp \
        ../libs/QR-Code-generator/cpp/QrSegment.cpp \
        ../libs/QR-Code-generator/cpp/BitBuffer.cpp \
        qsquarelayout.cpp

HEADERS += \
        mainwindow.h \
        qsquarelayout.h

FORMS += \
        mainwindow.ui

# Default rules for deployment.
qnx: target.path = /tmp/$${TARGET}/bin
else: unix:!android: target.path = /opt/$${TARGET}/bin
!isEmpty(target.path): INSTALLS += target
