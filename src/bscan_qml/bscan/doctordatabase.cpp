#include "doctordatabase.h"
#include <QDebug>

#include "iostream"
#include "stdio.h"
#include <QtSql>
doctordatabase::doctordatabase(QObject *parent) : QObject(parent)
{

}

QStringList doctordatabase::getDoctorId()
{
    qDebug()<<"start";


    QSqlQuery qry("select doctor_id from doctors;");
    QSqlRecord rec = qry.record();
    QStringList res;
    int Col = rec.indexOf("doctor_id");
    while (qry.next())
        res.append(qry.value(Col).toString());
    return res;

}
QString doctordatabase::getDoctorName(QString id)
{
    QSqlQuery qry("select name from doctors where doctor_id='"+id+"';");
    QSqlRecord rec=qry.record();
    QString res;
    int Col=rec.indexOf("name");
    while(qry.next())
        res.append(qry.value(Col).toString());
    return res;
}

QList<QString> doctordatabase::getAllDoctorsName()
{
    QSqlQuery qry("select name from doctors");
    QSqlRecord rec=qry.record();
    QList<QString> res;
    int Col=rec.indexOf("name");
    while(qry.next())
        res.append(qry.value(Col).toString());
    return res;

}
QStringList doctordatabase::getDoctorEmail()
{
    QSqlQuery qry("select email from doctors");
    QSqlRecord rec=qry.record();
    QStringList res;
    int Col=rec.indexOf("email");
    while(qry.next())
        res.append(qry.value(Col).toString());
    return res;
}
