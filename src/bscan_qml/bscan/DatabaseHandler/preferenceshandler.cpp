#include "preferenceshandler.h"

PreferencesHandler::PreferencesHandler(QObject *parent) : QObject(parent)
{

}

QString PreferencesHandler::getHospitalName()
{
    QSqlQuery qry("SELECT hospital_name FROM preferences WHERE id = 0;");
    QSqlRecord rec = qry.record();

    int Col = rec.indexOf("hospital_name");
    while(qry.next())
        return(qry.value(Col).toString());
    return QString("No record found for given id");
}

QString PreferencesHandler::getModelNumber(){
    QSqlQuery qry("SELECT model_number FROM preferences WHERE id = 0;");
    QSqlRecord rec = qry.record();

    int Col = rec.indexOf("model_number");
    while(qry.next())
        return(qry.value(Col).toString());
    return QString("No record found for given id");
}

QString PreferencesHandler::getSerialNumber(){
    QSqlQuery qry("SELECT serial_number FROM preferences WHERE id = 0;");
    QSqlRecord rec = qry.record();

    int Col = rec.indexOf("serial_number");
    while(qry.next())
        return(qry.value(Col).toString());
    return QString("No record found for given id");
}

QString PreferencesHandler::getSoftwareVersion(){
    QSqlQuery qry("SELECT software_version FROM preferences WHERE id = 0;");
    QSqlRecord rec = qry.record();

    int Col = rec.indexOf("software_version");
    while(qry.next())
        return(qry.value(Col).toString());
    return QString("No record found for given id");
}

QString PreferencesHandler::getACVelocity()
{
    QSqlQuery qry("SELECT ac_velocity FROM preferences WHERE id = 0;");
    QSqlRecord rec = qry.record();

    int Col = rec.indexOf("ac_velocity");
    while(qry.next())
        return(qry.value(Col).toString());
    return QString("No record found for given id");
}

QString PreferencesHandler::getLVelocity()
{
    QSqlQuery qry("SELECT l_velocity FROM preferences WHERE id = 0;");
    QSqlRecord rec = qry.record();

    int Col = rec.indexOf("l_velocity");
    while(qry.next())
        return(qry.value(Col).toString());
    return QString("No record found for given id");
}

QString PreferencesHandler::getVVelocity(){
    QSqlQuery qry("SELECT v_velocity FROM preferences WHERE id = 0;");
    QSqlRecord rec = qry.record();

    int Col = rec.indexOf("v_velocity");
    while(qry.next())
        return(qry.value(Col).toString());
    return QString("No record found for given id");
}

QString PreferencesHandler::getAVVelocity()
{
    QSqlQuery qry("SELECT av_velocity FROM preferences WHERE id = 0;");
    QSqlRecord rec = qry.record();

    int Col = rec.indexOf("av_velocity");
    while(qry.next())
        return(qry.value(Col).toString());
    return QString("No record found for given id");
}

QString PreferencesHandler::setHospitalName(QString val){
    QSqlQuery qry;
    qry.prepare("UPDATE preferences SET hospital_name ='" + val + "' WHERE id = 0 ;");
    if(qry.exec()){
        return QString("Changed hospital name");
    }
    return qry.lastError().text();
}

QString PreferencesHandler::setModelNumber(QString val){
    QSqlQuery qry;
    qry.prepare("UPDATE preferences SET model_number ='" + val + "' WHERE id = 0 ;");
    if(qry.exec()){
        return QString("Changed model number");
    }
    return qry.lastError().text();
}

QString PreferencesHandler::setSerialNumber(QString val){
    QSqlQuery qry;
    qry.prepare("UPDATE preferences SET serial_number ='" + val + "' WHERE id = 0 ;");
    if(qry.exec()){
        return QString("Changed serial number");
    }
    return qry.lastError().text();
}

QString PreferencesHandler::setSoftwareVersion(QString val){
    QSqlQuery qry;
    qry.prepare("UPDATE preferences SET software_version ='" + val + "' WHERE id = 0 ;");
    if(qry.exec()){
        return QString("Changed software version");
    }
    return qry.lastError().text();
}

QString PreferencesHandler::setACVelocity(QString val)
{
    QSqlQuery qry;
    qry.prepare("UPDATE preferences SET ac_velocity = "+val+" WHERE id = 0 ;");
    if(qry.exec()){
        return QString("Changed ac velocity");
    }
    return qry.lastError().text();
}

QString PreferencesHandler::setLVelocity(QString val)
{
    QSqlQuery qry;
    qry.prepare("UPDATE preferences SET l_velocity = "+val+" WHERE id = 0 ;");
    if(qry.exec()){
        return QString("Changed l velocity");
    }
    return qry.lastError().text();
}

QString PreferencesHandler::setVVelocity(QString val)
{
    QSqlQuery qry;
    qry.prepare("UPDATE preferences SET v_velocity = "+val+" WHERE id = 0 ;");
    if(qry.exec()){
        return QString("Changed v velocity");
    }
    return qry.lastError().text();
}

QString PreferencesHandler::setAVVelocity(QString val)
{
    QSqlQuery qry;
    qry.prepare("UPDATE preferences SET av_velocity = "+val+" WHERE id = 0 ;");
    if(qry.exec()){
        return QString("Changed av velocity");
    }
    return qry.lastError().text();
}

//QString PreferencesHandler::initDB(){
//    QSqlQuery qry;
//    qry.prepare("insert into preferences values(0,'Gotham General','bscan_touch','bscan-dev','vbeta0.0',NULL,NULL,NULL,NULL);");
//    if(qry.exec()){
//        return QString("Changed pir count");
//    }
//    return qry.lastError().text();
//}
