TEMPLATE = app

QT += qml quick
CONFIG += c++11

SOURCES += main.cpp \
    sockets.cpp \
    fileio.cpp

RESOURCES += qml.qrc

# Additional import path used to resolve QML modules in Qt Creator's code model
QML_IMPORT_PATH =

# Default rules for deployment.
include(deployment.pri)

target.path = /home/pi/
INSTALLS += target

QML_IMPORT_PATH += /usr/lib/arm-linux-gnueabihf/qt5/qml/QtGraphicalEffects

HEADERS += \
    sockets.h \
    fileio.h
