#ifndef DOCTORHANDLER_H
#define DOCTORHANDLER_H

#include <QObject>
#include "DatabaseHandler/basehandler.h"
#include <QtSql>
#include <QDebug>
#include <QFileInfo>
//#include "DatabaseHandler/patienthandler.h"
#include <stdlib.h>

class DoctorHandler : public QObject
{
    Q_OBJECT
public:
    explicit DoctorHandler(QObject *parent = nullptr);
//    static bool checkDoctorID(QString id);
    Q_INVOKABLE QString generateID();
    Q_INVOKABLE QStringList getID(QString id);
    Q_INVOKABLE QStringList getDoctorID(QString id);
    Q_INVOKABLE QStringList getCurrentDoctor();
//    Q_INVOKABLE QString getCurrentDoctorName();
//    Q_INVOKABLE QString getCurrentDoctorEmail();

    Q_INVOKABLE QStringList getAllDoctorId();
    Q_INVOKABLE QList<QString> getAllDoctorsName();
    Q_INVOKABLE QString getDoctorName(QString id);
    Q_INVOKABLE QString getDoctorLensPresetOne(QString id);
    Q_INVOKABLE QString getDoctorLensPresetTwo(QString id);
    Q_INVOKABLE QString getDoctorLensPresetThree(QString id);
    Q_INVOKABLE QString getDoctorPrimaryFormula(QString id);
    Q_INVOKABLE QStringList getAllDoctorPrimaryFormula();
    Q_INVOKABLE QString getDoctorEmail(QString id);
    Q_INVOKABLE QStringList getDoctors();
    Q_INVOKABLE QStringList getAllDoctors();
    Q_INVOKABLE QStringList getPatients(QString id);
    Q_INVOKABLE QStringList getAllPatients(QString id);
    Q_INVOKABLE bool checkDoctorID(QString id);

    Q_INVOKABLE QString setDoctorName(QString id,QString dname);
    Q_INVOKABLE QString setDoctorLensPresetOne(QString id,QString lensone);
    Q_INVOKABLE QString setDoctorLensPresetTwo(QString id,QString lenstwo);
    Q_INVOKABLE QString setDoctorLensPresetThree(QString id,QString lensthree);
    Q_INVOKABLE QString setDoctorPrimaryFormula(QString id,QString formula);
    Q_INVOKABLE QString setDoctorEmail(QString id, QString email);
//    Q_INVOKABLE QStringList getAllDoctorEmail();
    Q_INVOKABLE QString deleteDoctor(QString id);
    Q_INVOKABLE QString deleteDoctorWithID(QString id);

    Q_INVOKABLE QString addDoctor(QString id,QString name,QString lensone,QString lenstwo,QString lensthree,QString formula, QString email);
    Q_INVOKABLE QString addDoctorWithID(QString absid,QString id,QString name,QString lensone,QString lenstwo,QString lensthree,QString formula, QString email);

    Q_INVOKABLE int count();
private:
    BaseHandler *local;
};

#endif // DOCTORHANDLER_H
