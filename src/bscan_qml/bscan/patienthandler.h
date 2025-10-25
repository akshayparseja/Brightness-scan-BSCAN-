#ifndef PATIENTHANDLER_H
#define PATIENTHANDLER_H

#include <QObject>
#include "DatabaseHandler/basehandler.h"
#include <QtSql>
#include <QFileInfo>
#include <QDebug>
#include <stdlib.h>

class PatientHandler : public QObject
{
    Q_OBJECT
public:
    explicit PatientHandler(QObject *parent = nullptr);

    static QString generateID();
    static QStringList getID(QString id);
    static QString getName(QString id);
    static QString getGender(QString id);
    static QString getAge(QString id);
    static QString getDoctorId(QString id);
    static QString getRKOne(QString id);
    static QString getRKTwo(QString id);
    static QString getRK(QString id);
    static QString getLKOne(QString id);
    static QString getLKTwo(QString id);
    static QString getLK(QString id);
    static QString getPatientID(QString id);

    static QString setName(QString id,QString name);
    static QString setGender(QString id,QString gender);
    static QString setAge(QString id,QString age);
    static QString setDoctorId(QString id,QString doctorid);
    static QString setRKOne(QString id,QString rkone);
    static QString setRKTwo(QString id,QString rktwo);
    static QString setRK(QString id,QString rk);
    static QString setLKOne(QString id,QString lkone);
    static QString setLKTwo(QString id,QString lktwo);
    static QString setLK(QString id,QString lk);

    static QString addPatient(QString id,QString name,QString gender,QString age,QString contact,QString doctorid,QString lk1,QString lk2,QString lk,QString rk1,QString rk2,QString rk,QString opmode,QString opeye,QString opmethod);
    static QString addPatientWithID(QString absid,QString id,QString name,QString gender,QString age,QString contact,QString doctorid,QString lk1,QString lk2,QString lk,QString rk1,QString rk2,QString rk,QString opmode,QString opeye,QString opmethod);
    static QString addPatientMinimal(QString id,QString name,QString doctorid,QString lk1,QString lk2,QString lk,QString rk1,QString rk2,QString rk,QString opmode,QString opeye,QString opmethod);

    static QString deletePatient(QString id);
    static QString deletePatientWithID(QString id);

    static QStringList getPatients();
    static QStringList getAllPatients();

    static int count();

    static bool checkPatientID(QString id);
signals:

};

#endif // PATIENTHANDLER_H
