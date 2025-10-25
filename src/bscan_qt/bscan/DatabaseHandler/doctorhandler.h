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

    static QString generateID();
    static QStringList getID(QString id);
    static QString getDoctorID(QString id);
    static QString getDoctorName(QString id);
    static QString getDoctorLensPresetOne(QString id);
    static QString getDoctorLensPresetTwo(QString id);
    static QString getDoctorLensPresetThree(QString id);
    static QString getDoctorPrimaryFormula(QString id);
    static QString getDoctorEmail(QString id);
    static QStringList getDoctors();
    static QStringList getAllDoctors();
    static QStringList getPatients(QString id);
    static QStringList getAllPatients(QString id);
    static bool checkDoctorID(QString id);

    static QString setDoctorName(QString id,QString dname);
    static QString setDoctorLensPresetOne(QString id,QString lensone);
    static QString setDoctorLensPresetTwo(QString id,QString lenstwo);
    static QString setDoctorLensPresetThree(QString id,QString lensthree);
    static QString setDoctorPrimaryFormula(QString id,QString formula);
    static QString setDoctorEmail(QString id, QString email);

    static QString deleteDoctor(QString id);
    static QString deleteDoctorWithID(QString id);

    static QString addDoctor(QString id,QString name,QString lensone,QString lenstwo,QString lensthree,QString formula, QString email);
    static QString addDoctorWithID(QString absid,QString id,QString name,QString lensone,QString lenstwo,QString lensthree,QString formula, QString email);

    static int count();
private:
    BaseHandler *local;
};

#endif // DOCTORHANDLER_H
