#include "patienthandler.h"

PatientHandler::PatientHandler(QObject *parent) : QObject(parent)
{

}

QString PatientHandler::generateID()
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
    QString res="PAT"+QString::number(id);
    if(checkPatientID(res)==true)
        return generateID();
    return res;
}

QStringList PatientHandler::getID(QString id)
{
    QSqlQuery qry("select id from patients where patient_id='"+id+"';");
    QSqlRecord rec = qry.record();
    QStringList res;
    int Col = rec.indexOf("id");
    while (qry.next())
        res.append(qry.value(Col).toString());
    return res;
}

QString PatientHandler::getName(QString id){
    QSqlQuery qry("select name from patients where patient_id='"+id+"';");
    QSqlRecord rec=qry.record();
    QString res;
    int Col=rec.indexOf("name");
    while(qry.next())
        res.append(qry.value(Col).toString());
    return res;
}

QString PatientHandler::getGender(QString id){
    QSqlQuery qry("select gender from patients where patient_id='"+id+"';");
    QSqlRecord rec=qry.record();
    QString res;
    int Col=rec.indexOf("gender");
    while(qry.next())
        res.append(qry.value(Col).toString());
    return res;
}

QString PatientHandler::getAge(QString id){
    QSqlQuery qry("select age from patients where patient_id='"+id+"';");
    QSqlRecord rec=qry.record();
    QString res;
    int Col=rec.indexOf("age");
    while(qry.next())
        res.append(qry.value(Col).toString());
    return res;
}

QString PatientHandler::getDoctorId(QString id){
    QSqlQuery qry("select doctor_id from patients where patient_id='"+id+"';");
    QSqlRecord rec=qry.record();
    QString res;
    int Col=rec.indexOf("doctor_id");
    while(qry.next())
        res.append(qry.value(Col).toString());
    return res;
}

QString PatientHandler::getRKOne(QString id){
    QSqlQuery qry("select rk1 from patients where patient_id='"+id+"';");
    QSqlRecord rec=qry.record();
    QString res;
    int Col=rec.indexOf("rk1");
    while(qry.next())
        res.append(qry.value(Col).toString());
    return res;
}

QString PatientHandler::getRKTwo(QString id){
    QSqlQuery qry("select rk2 from patients where patient_id='"+id+"';");
    QSqlRecord rec=qry.record();
    QString res;
    int Col=rec.indexOf("rk2");
    while(qry.next())
        res.append(qry.value(Col).toString());
    return res;
}

QString PatientHandler::getRK(QString id){
    QSqlQuery qry("select rk from patients where patient_id='"+id+"';");
    QSqlRecord rec=qry.record();
    QString res;
    int Col=rec.indexOf("rk");
    while(qry.next())
        res.append(qry.value(Col).toString());
    return res;
}

QString PatientHandler::getLKOne(QString id){
    QSqlQuery qry("select lk1 from patients where patient_id='"+id+"';");
    QSqlRecord rec=qry.record();
    QString res;
    int Col=rec.indexOf("lk1");
    while(qry.next())
        res.append(qry.value(Col).toString());
    return res;
}

QString PatientHandler::getLKTwo(QString id){
    QSqlQuery qry("select lk2 from patients where patient_id='"+id+"';");
    QSqlRecord rec=qry.record();
    QString res;
    int Col=rec.indexOf("lk2");
    while(qry.next())
        res.append(qry.value(Col).toString());
    return res;
}

QString PatientHandler::getLK(QString id){
    QSqlQuery qry("select lk from patients where patient_id='"+id+"';");
    QSqlRecord rec=qry.record();
    QString res;
    int Col=rec.indexOf("lk");
    while(qry.next())
        res.append(qry.value(Col).toString());
    return res;
}

QString PatientHandler::getPatientID(QString id)
{
    QSqlQuery qry("select patient_id from patients where id="+id+";");
    QSqlRecord rec=qry.record();
    QString res;
    int Col=rec.indexOf("patient_id");
    while(qry.next())
        res.append(qry.value(Col).toString());
    return res;
}

bool PatientHandler::checkPatientID(QString id){
    QSqlQuery qry("SELECT COUNT(*) from patients where patient_id='"+id+"';");
    QSqlRecord rec=qry.record();

    int Col=rec.indexOf("COUNT(*)");
    while (qry.next()) {
        int n= qry.value(Col).toString().toInt();
        if(n>0)
            return true;
    }
    return false;
}

QString PatientHandler::setName(QString id, QString name){
    if(!checkPatientID(id))
        return QString("No matching record found");
    QSqlQuery qry;
    qry.prepare("UPDATE patients SET name='"+name+"' where patient_id='"+id+"';");
    if(qry.exec()){
        return QString("Changed patient name");
    }
    return qry.lastError().text();
}

QString PatientHandler::setGender(QString id, QString gender){
    if(!checkPatientID(id))
        return QString("No matching record found");
    QSqlQuery qry;
    qry.prepare("UPDATE patients SET gender='"+gender+"' where patient_id='"+id+"';");
    if(qry.exec()){
        return QString("Changed patient gender");
    }
    return qry.lastError().text();
}

QString PatientHandler::setAge(QString id, QString age){
    if(!checkPatientID(id))
        return QString("No matching record found");
    QSqlQuery qry;
    qry.prepare("UPDATE patients SET age="+age+" where patient_id='"+id+"';");
    if(qry.exec()){
        return QString("Changed patient age");
    }
    return qry.lastError().text();
}

QString PatientHandler::setDoctorId(QString id, QString doctorid){
    if(!checkPatientID(id))
        return QString("No matching record found");
    QSqlQuery qry;
    qry.prepare("UPDATE patients SET doctor_id='"+doctorid+"' where patient_id='"+id+"';");
    if(qry.exec()){
        return QString("Changed patient name");
    }
    return qry.lastError().text();
}

QString PatientHandler::setRKOne(QString id, QString rkone){
    if(!checkPatientID(id))
        return QString("No matching record found");
    QSqlQuery qry;
    qry.prepare("UPDATE patients SET rk1="+rkone+" where patient_id='"+id+"';");
    if(qry.exec()){
        return QString("Changed RK One");
    }
    return qry.lastError().text();
}

QString PatientHandler::setRKTwo(QString id, QString rktwo){
    if(!checkPatientID(id))
        return QString("No matching record found");
    QSqlQuery qry;
    qry.prepare("UPDATE patients SET rk2="+rktwo+" where patient_id='"+id+"';");
    if(qry.exec()){
        return QString("Changed RK Two");
    }
    return qry.lastError().text();
}

QString PatientHandler::setRK(QString id, QString rk){
    if(!checkPatientID(id))
        return QString("No matching record found");
    QSqlQuery qry;
    qry.prepare("UPDATE patients SET rk="+rk+" where patient_id='"+id+"';");
    if(qry.exec()){
        return QString("Changed RK");
    }
    return qry.lastError().text();
}

QString PatientHandler::setLKOne(QString id, QString lkone){
    if(!checkPatientID(id))
        return QString("No matching record found");
    QSqlQuery qry;
    qry.prepare("UPDATE patients SET lk1="+lkone+" where patient_id='"+id+"';");
    if(qry.exec()){
        return QString("Changed LK One");
    }
    return qry.lastError().text();
}

QString PatientHandler::setLKTwo(QString id, QString lktwo){
    if(!checkPatientID(id))
        return QString("No matching record found");
    QSqlQuery qry;
    qry.prepare("UPDATE patients SET lk2="+lktwo+" where patient_id='"+id+"';");
    if(qry.exec()){
        return QString("Changed LK Two");
    }
    return qry.lastError().text();
}

QString PatientHandler::setLK(QString id, QString lk){
    if(!checkPatientID(id))
        return QString("No matching record found");
    QSqlQuery qry;
    qry.prepare("UPDATE patients SET lk="+lk+" where patient_id='"+id+"';");
    if(qry.exec()){
        return QString("Changed LK");
    }
    return qry.lastError().text();
}

QString PatientHandler::addPatient(QString id, QString name, QString gender, QString age, QString contact, QString doctorid, QString lk1, QString lk2, QString lk, QString rk1, QString rk2, QString rk, QString opmode, QString opeye, QString opmethod){
    if(checkPatientID(id))
        return QString("Record with ID exists");
    QSqlQuery qry;
    qry.prepare("INSERT into patients(patient_id,name,gender,age,doctor_id,lk1,lk2,lk,rk1,rk2,rk) VALUES('"+id+"','"+name+"',"+gender+","+age+",'"+doctorid+"',"+lk1+","+lk2+","+lk+","+rk1+","+rk2+","+rk+");");
    if(qry.exec()){
        return QString("Added new record");
    }
    return qry.lastError().text();
}

QString PatientHandler::addPatientWithID(QString absid, QString id, QString name, QString gender, QString age, QString contact, QString doctorid, QString lk1, QString lk2, QString lk, QString rk1, QString rk2, QString rk, QString opmode, QString opeye, QString opmethod)
{
    if(checkPatientID(id))
        return QString("Record with ID exists");
    QSqlQuery qry;
    qry.prepare("INSERT into patients(id,patient_id,name,gender,age,doctor_id,lk1,lk2,lk,rk1,rk2,rk) VALUES("+absid+",'"+id+"','"+name+"',"+gender+","+age+",'"+doctorid+"',"+lk1+","+lk2+","+lk+","+rk1+","+rk2+","+rk+");");
    if(qry.exec()){
        return QString("Added new record");
    }
    return qry.lastError().text();
}

QString PatientHandler::addPatientMinimal(QString id, QString name, QString doctorid, QString lk1, QString lk2, QString lk, QString rk1, QString rk2, QString rk, QString opmode, QString opeye, QString opmethod)
{
    if(checkPatientID(id))
        return QString("Record with ID exists");
    QSqlQuery qry;
    qry.prepare("INSERT into patients(patient_id,name,doctor_id,lk1,lk2,lk,rk1,rk2,rk) VALUES('"+id+"','"+name+"',"+lk1+","+lk2+","+lk+","+rk1+","+rk2+","+rk+");");
    if(qry.exec()){
        return QString("Added new record");
    }
    return qry.lastError().text();
}

QString PatientHandler::deletePatient(QString id)
{
    if(!checkPatientID(id))
        return "No matching record found";
    QSqlQuery qry;
    qry.prepare("DELETE from patients where patient_id='"+id+"' and id<>0;");
    if(qry.exec()){
        return "Patient deleted succesfully";
    }
    return qry.lastError().text();
}

QString PatientHandler::deletePatientWithID(QString id){
    if(!checkPatientID(id))
        return "No matching record found";
    QSqlQuery qry;
    qry.prepare("DELETE from patients where id="+id+" and id<>0;");
    if(qry.exec()){
        return "Patient deleted succesfully";
    }
    return qry.lastError().text();
}

QStringList PatientHandler::getPatients(){
    QSqlQuery qry("select patient_id from patients where id!=0;");
    QSqlRecord rec = qry.record();
    QStringList res;
    int Col = rec.indexOf("patient_id");
    while (qry.next())
        res.append(qry.value(Col).toString());
    return res;
}

QStringList PatientHandler::getAllPatients()
{
    QSqlQuery qry("select patient_id from patient;");
    QSqlRecord rec = qry.record();
    QStringList res;
    int Col = rec.indexOf("patient_id");
    while (qry.next())
        res.append(qry.value(Col).toString());
    return res;
}

int PatientHandler::count()
{
    QSqlQuery qry("select patient_id from patients where id<>0;");
    QSqlRecord rec = qry.record();
    QStringList res;
    int Col = rec.indexOf("patient_id");
    while (qry.next())
        res.append(qry.value(Col).toString());
    return res.size();
}

