TEMPLATE = app

QT += qml quick widgets sql multimedia
CONFIG += link_pkgconfig
PKGCONFIG += opencv
SOURCES += main.cpp \
    DatabaseHandler/basehandler.cpp \
    DatabaseHandler/doctorhandler.cpp \
    DatabaseHandler/patienthandler.cpp \
    DatabaseHandler/preferenceshandler.cpp \
    DatabaseHandler/scanhandler.cpp \
#    basehandler.cpp \
#    doctordatabase.cpp \
    mousememory.cpp \
 \#    patienthandler.cpp
    videoimageprovider.cpp

RESOURCES += qml.qrc

# Additional import path used to resolve QML modules in Qt Creator's code model
QML_IMPORT_PATH =

# Default rules for deployment.
include(deployment.pri)
static {
    QT += svg
    QTPLUGIN += qtvirtualkeyboardplugin
}
HEADERS += \
    DatabaseHandler/basehandler.h \
    DatabaseHandler/doctorhandler.h \
    DatabaseHandler/patienthandler.h \
    DatabaseHandler/preferenceshandler.h \
    DatabaseHandler/scanhandler.h \
#    basehandler.h \
#    constants.h \
#    doctordatabase.h \
    General/constants.h \
    mousememory.h \
 \#    patienthandler.h
    videoimageprovider.h

#disable-xcb {
#    message("The disable-xcb option has been deprecated. Please use disable-desktop instead.")
#    CONFIG += disable-desktop
#}


