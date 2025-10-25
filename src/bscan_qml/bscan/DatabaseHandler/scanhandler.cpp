#include "scanhandler.h"

ScanHandler::ScanHandler(QObject *parent) : QObject(parent)
{

}

QString ScanHandler::addScan(QString doctorid, QString patientid, QString scanid, QString scantype, QString scan_location)
{
    if(checkScanID(doctorid))
        return QString("Record with scan exists");
    QSqlQuery qry;
    qry.prepare("INSERT into scans(scan_id,type,scan_location,patient_id, doctor_id) VALUES('"+scanid+"','"+scantype+"','"+scan_location+"','"+patientid+"','"+doctorid+"');");
    if(qry.exec()){
        return QString("Added new record");
    }
    return qry.lastQuery();
}

bool ScanHandler::checkScanID(QString scanid)
{
    QSqlQuery qry("SELECT COUNT(*) from scans where scan_id='"+scanid+"';");
    QSqlRecord rec=qry.record();

    int Col=rec.indexOf("COUNT(*)");
    while (qry.next()) {
        int n= qry.value(Col).toString().toInt();
        if(n>0)
            return true;
    }
    return false;
}

QStringList ScanHandler::getScans_Patient(QString patientid)
{
    QSqlQuery qry("SELECT scan_id from scans where patient_id='"+patientid+"';");
    QSqlRecord rec=qry.record();
    QStringList res;
    int Col=rec.indexOf("scan_id");
    while (qry.next()) {
        res.append(qry.value(Col).toString());
    }
    return res;
}

QStringList ScanHandler::getScans_Doctor(QString doctorid)
{
    QSqlQuery qry("SELECT scan_id from scans where doctor_id='"+doctorid+"';");
    QSqlRecord rec=qry.record();
    QStringList res;
    int Col=rec.indexOf("scan_id");
    while (qry.next()) {
        res.append(qry.value(Col).toString());
    }
    return res;
}

QString ScanHandler::deleteScan(QString scanid)
{
    QSqlQuery qry;
    qry.prepare("delete from scans where scan_id='"+scanid+"';");
    if(qry.exec()){
        return "Deleted reading";
    }
    return qry.lastError().text();
}

QString ScanHandler::deleteAll(QString patientid)
{
    QSqlQuery qry;
    qry.prepare("delete from scans where patient_id='"+patientid+"';");
    if(qry.exec()){
        return "Deleted reading";
    }
    return qry.lastError().text();
}

QString ScanHandler::generateID()
{
    int count=0;
    srand(time(NULL));
    u_int64_t id;
    u_int16_t a,b,c,d;
    while(true){
        count++;
        a=(u_int16_t)rand()%65535;
        b=(u_int16_t)rand()%65535;
        if(count<=3)
            id= a|(((u_int64_t)b)<<16);
        if(count>3)
        {
            c=(u_int16_t)random()%65535;
            id= a|(((u_int64_t)b)<<16)|(((u_int64_t)c)<<32);
        }
        if(count>7)
        {
            d=(u_int16_t)random()%65535;
            id= a|(((u_int64_t)b)<<16)|(((u_int64_t)c)<<32)|(((u_int64_t)d)<<48);
        }
        break;
    }
    if(id<0)
        id=-id;
    QString res="SCAN"+QString::number(id);
    if(checkScanID(res)==true)
        return generateID();
    return res;
}

QString ScanHandler::getDoctorID(QString scanid)
{
    QSqlQuery qry("SELECT doctor_id from scans where scan_id='"+scanid+"';");
    QSqlRecord rec=qry.record();
    QString res;
    int Col=rec.indexOf("doctor_id");
    while (qry.next()) {
        res.append(qry.value(Col).toString());
    }
    return res;
}

QString ScanHandler::getScanType(QString scanid)
{
    QSqlQuery qry("SELECT type from scans where scan_id='"+scanid+"';");
    QSqlRecord rec=qry.record();
    QString res;
    int Col=rec.indexOf("type");
    while (qry.next()) {
        res.append(qry.value(Col).toString());
    }
    return res;
}

QString ScanHandler::getPatientID(QString scanid)
{
    QSqlQuery qry("SELECT patient_id from scans where scan_id='"+scanid+"';");
    QSqlRecord rec=qry.record();
    QString res;
    int Col=rec.indexOf("patient_id");
    while (qry.next()) {
        res.append(qry.value(Col).toString());
    }
    return res;
}

QStringList ScanHandler::getAllAScans()
{
    QSqlQuery qry("SELECT scan_id from scans where type='ascan';");
    QSqlRecord rec=qry.record();
    QStringList res;
    int Col=rec.indexOf("scan_id");
    while (qry.next()) {
        res.append(qry.value(Col).toString());
    }
    return res;
}

QStringList ScanHandler::getAllBScanVideos()
{
    QSqlQuery qry("SELECT scan_id from scans where type='bscan_video';");
    QSqlRecord rec=qry.record();
    QStringList res;
    int Col=rec.indexOf("scan_id");
    while (qry.next()) {
        res.append(qry.value(Col).toString());
    }
    return res;
}

QStringList ScanHandler::getAllBScanFrames()
{
    QSqlQuery qry("SELECT scan_id from scans where type='bscan_frame';");
    QSqlRecord rec=qry.record();
    QStringList res;
    int Col=rec.indexOf("scan_id");
    while (qry.next()) {
        res.append(qry.value(Col).toString());
    }
    return res;
}
