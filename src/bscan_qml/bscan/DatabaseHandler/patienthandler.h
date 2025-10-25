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

    Q_INVOKABLE QString generateID();
    Q_INVOKABLE QString getID(QString id);

    Q_INVOKABLE QString getName(QString id);
    Q_INVOKABLE QStringList getAllPatientName();

    Q_INVOKABLE QString getGender(QString id);
    Q_INVOKABLE QStringList getAllGender();
    Q_INVOKABLE QStringList getCurrentPatient();
    Q_INVOKABLE QString getAge(QString id);
    Q_INVOKABLE QString getDoctorId(QString id);

    Q_INVOKABLE QString getCurrentDoctorId();
    Q_INVOKABLE QString getRKOne(QString id);
    Q_INVOKABLE QString getRKTwo(QString id);
    Q_INVOKABLE QString getRK(QString id);
    Q_INVOKABLE QString getLKOne(QString id);
    Q_INVOKABLE QString getLKTwo(QString id);
    Q_INVOKABLE QString getLK(QString id);
    Q_INVOKABLE QStringList getPatientID(QString id);

    Q_INVOKABLE QString setName(QString id,QString name);
    Q_INVOKABLE QString setGender(QString id,QString gender);
    Q_INVOKABLE QString setAge(QString id,QString age);
    static QString setDoctorId(QString id,QString doctorid);
    Q_INVOKABLE QString setRKOne(QString id,QString rkone);
    Q_INVOKABLE QString setRKTwo(QString id,QString rktwo);
    Q_INVOKABLE QString setRK(QString id,QString rk);
    Q_INVOKABLE QString setLKOne(QString id,QString lkone);
    Q_INVOKABLE QString setLKTwo(QString id,QString lktwo);
    Q_INVOKABLE QString setLK(QString id,QString lk);

    Q_INVOKABLE QString addPatient(QString id,QString name,QString gender,QString age,QString contact,QString doctorid,QString lk1,QString lk2,QString lk,QString rk1,QString rk2,QString rk,QString opmode,QString opeye,QString opmethod);
    Q_INVOKABLE QString addPatientWithID(QString absid,QString id,QString name,QString gender,QString age,QString contact,QString doctorid,QString lk1,QString lk2,QString lk,QString rk1,QString rk2,QString rk,QString opmode,QString opeye,QString opmethod);
    Q_INVOKABLE QString addPatientMinimal(QString id,QString name,QString doctorid,QString lk1,QString lk2,QString lk,QString rk1,QString rk2,QString rk,QString opmode,QString opeye,QString opmethod);

    static Q_INVOKABLE QString deletePatient(QString id);
    Q_INVOKABLE QString deletePatientWithID(QString id);

    Q_INVOKABLE QStringList getPatients();
    Q_INVOKABLE QStringList getAllPatients();

    Q_INVOKABLE int count();

  Q_INVOKABLE  static bool checkPatientID(QString id);
signals:

};

#endif // PATIENTHANDLER_H
