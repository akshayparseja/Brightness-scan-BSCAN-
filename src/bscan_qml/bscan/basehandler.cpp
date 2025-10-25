#include "basehandler.h"

BaseHandler::BaseHandler(QObject *parent) : QObject(parent)
{

}

bool BaseHandler::dbopen(){

    //    db.setDatabaseName(DB_LOCATION);
    QSqlDatabase db;
    db=QSqlDatabase::addDatabase("QSQLITE");
    db.setDatabaseName("../db/bscan.db");
    if(!db.open())qDebug()<<"problem";

    if(!db.open()){
        qDebug()<<"Failed to open database";
        return false;
    }
    else{
        qDebug()<<"Database connected.";
        return true;
    }
    return false;
}

QString BaseHandler::createDB()
{
    system(QString("touch "+QString(DB_LOCATION)).toStdString().c_str());
    QSqlQuery qry;
    QString cmd="CREATE TABLE \"doctors\" (\"id\"	INTEGER NOT NULL UNIQUE,\"doctor_id\"	TEXT,\"name\"	TEXT, \"lens_preset_one\"	TEXT, \"lens_preset_two\"	TEXT, \"lens_preset_three\"	TEXT, \"primary_formula\"	TEXT, \"email\"	TEXT, PRIMARY KEY(\"id\" AUTOINCREMENT))";
    qry.prepare(cmd);
    if(qry.exec()){
        qDebug()<<"Created doctor database";
    }
    else{
        return qry.lastError().text();
    }
    cmd="CREATE TABLE \"lenses\" (\"id\"	INTEGER NOT NULL,\"iol\"	TEXT,\"company\"	TEXT,\"type\"	TEXT, \"asrkt\"	REAL, \"asrkii\"	REAL, \"acd\"	REAL, \"sf\"	REAL, \"a0\"	REAL, \"a1\"	REAL, \"a2\"	REAL, PRIMARY KEY(\"id\" AUTOINCREMENT))";
    qry.prepare(cmd);
    if(qry.exec()){
        qDebug()<<"Created lens database";
    }
    else{
        return qry.lastError().text();
    }
    cmd="CREATE TABLE \"patients\" (\"id\"	INTEGER NOT NULL UNIQUE, \"patient_id\"	TEXT, \"name\"	TEXT, \"age\"	NUMERIC, \"gender\"	TEXT, \"doctor_id\"	TEXT, \"lk1\"	REAL, \"lk2\"	REAL, \"lk\"	REAL, \"rk1\"	REAL, \"rk2\"	REAL, \"rk\"	REAL,PRIMARY KEY(\"id\" AUTOINCREMENT))";
    qry.prepare(cmd);
    if(qry.exec()){
        qDebug()<<"Created patient database";
    }
    else{
        return qry.lastError().text();
    }
    cmd="CREATE TABLE \"preferences\" (\"id\"	INTEGER NOT NULL UNIQUE, \"hospital_name\"	TEXT, \"model_number\"	TEXT, \"serial_number\"	TEXT, \"software_version\"	TEXT, \"ac_velocity\"	REAL, \"l_velocity\"	REAL, \"v_velocity\"	REAL, \"av_velocity\"	REAL, PRIMARY KEY(\"id\" AUTOINCREMENT))";
    qry.prepare(cmd);
    if(qry.exec()){
        qDebug()<<"Created preferences database";
    }
    else{
        return qry.lastError().text();
    }
    cmd="CREATE TABLE \"scans\" (\"id\"	INTEGER NOT NULL UNIQUE, \"scan_id\"	TEXT, \"type\"	INTEGER, \"scan_location\"	INTEGER, PRIMARY KEY(\"id\" AUTOINCREMENT))";
    qry.prepare(cmd);
    if(qry.exec()){
        qDebug()<<"Created scans database";
    }
    else{
        return qry.lastError().text();
    }

}

void BaseHandler::dbclose(){
    db.close();
    db.removeDatabase(QSqlDatabase::defaultConnection);
}
