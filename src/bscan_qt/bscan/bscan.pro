QT       += core gui sql

greaterThan(QT_MAJOR_VERSION, 4): QT += widgets

CONFIG += c++11

# The following define makes your compiler emit warnings if you use
# any Qt feature that has been marked deprecated (the exact warnings
# depend on your compiler). Please consult the documentation of the
# deprecated API in order to know how to port your code away from it.
DEFINES += QT_DEPRECATED_WARNINGS

# You can also make your code fail to compile if it uses deprecated APIs.
# In order to do so, uncomment the following line.
# You can also select to disable deprecated APIs only up to a certain version of Qt.
#DEFINES += QT_DISABLE_DEPRECATED_BEFORE=0x060000    # disables all the APIs deprecated before Qt 6.0.0

SOURCES += \
    DatabaseHandler/basehandler.cpp \
    DatabaseHandler/basehandler.cpp \
    DatabaseHandler/doctorhandler.cpp \
    DatabaseHandler/doctorhandler.cpp \
    DatabaseHandler/patienthandler.cpp \
    DatabaseHandler/patienthandler.cpp \
    DatabaseHandler/preferenceshandler.cpp \
    DatabaseHandler/preferenceshandler.cpp \
    DatabaseHandler/scanhandler.cpp \
    DatabaseHandler/scanhandler.cpp \
    main.cpp \
    homescreen.cpp

HEADERS += \
    DatabaseHandler/basehandler.h \
    DatabaseHandler/basehandler.h \
    DatabaseHandler/doctorhandler.h \
    DatabaseHandler/doctorhandler.h \
    DatabaseHandler/patienthandler.h \
    DatabaseHandler/patienthandler.h \
    DatabaseHandler/preferenceshandler.h \
    DatabaseHandler/preferenceshandler.h \
    DatabaseHandler/scanhandler.h \
    DatabaseHandler/scanhandler.h \
    General/constants.h \
    homescreen.h

FORMS += \
    homescreen.ui

# Default rules for deployment.
qnx: target.path = /tmp/$${TARGET}/bin
else: unix:!android: target.path = /opt/$${TARGET}/bin
!isEmpty(target.path): INSTALLS += target
