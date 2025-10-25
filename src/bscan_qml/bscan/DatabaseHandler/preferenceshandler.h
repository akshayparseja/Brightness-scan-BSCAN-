#ifndef PREFERENCESHANDLER_H
#define PREFERENCESHANDLER_H

#include <QObject>
#include "DatabaseHandler/basehandler.h"
#include <QtSql>
#include <QFileInfo>
#include <QDebug>

class PreferencesHandler : public QObject
{
    Q_OBJECT
public:
    explicit PreferencesHandler(QObject *parent = nullptr);

    static QString getHospitalName();
    static QString getModelNumber();
    static QString getSerialNumber();
    static QString getSoftwareVersion();
    static QString getACVelocity();
    static QString getLVelocity();
    static QString getVVelocity();
    static QString getAVVelocity();

    static QString setHospitalName(QString val);
    static QString setModelNumber(QString val);
    static QString setSerialNumber(QString val);
    static QString setSoftwareVersion(QString val);
    static QString setACVelocity(QString val);
    static QString setLVelocity(QString val);
    static QString setVVelocity(QString val);
    static QString setAVVelocity(QString val);

signals:

};

#endif // PREFERENCESHANDLER_H
