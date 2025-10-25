#include "doctorhandler.h"
#include "patienthandler.h"
DoctorHandler::DoctorHandler(QObject *parent) : QObject(parent)
{

}

QString DoctorHandler::generateID(){
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
    QString res="DOC"+QString::number(id);
    if(checkDoctorID(res)==true)
        return generateID();
    return res;
}

QStringList DoctorHandler::getID(QString id){
    QSqlQuery qry("select id from doctors where doctor_id='"+id+"';");
    QSqlRecord rec = qry.record();
    QStringList res;
    int Col = rec.indexOf("id");
    while (qry.next())
        res.append(qry.value(Col).toString());
    return res;
}

QString DoctorHandler::getDoctorName(QString id){
    QSqlQuery qry("select name from doctors where doctor_id='"+id+"';");
    QSqlRecord rec=qry.record();
    QString res;
    int Col=rec.indexOf("name");
    while(qry.next())
        res.append(qry.value(Col).toString());
    return res;
}

QString DoctorHandler::getDoctorLensPresetOne(QString id){
    QSqlQuery qry("select lens_preset_one from doctors where doctor_id='"+id+"';");
    QSqlRecord rec=qry.record();
    QString res;
    int Col=rec.indexOf("lens_preset_one");
    while(qry.next())
        res.append(qry.value(Col).toString());
    return res;
}

QString DoctorHandler::getDoctorLensPresetTwo(QString id){
    QSqlQuery qry("select lens_preset_two from doctors where doctor_id='"+id+"';");
    QSqlRecord rec=qry.record();
    QString res;
    int Col=rec.indexOf("lens_preset_two");
    while(qry.next())
        res.append(qry.value(Col).toString());
    return res;
}

QString DoctorHandler::getDoctorLensPresetThree(QString id){
    QSqlQuery qry("select lens_preset_three from doctors where doctor_id='"+id+"';");
    QSqlRecord rec=qry.record();
    QString res;
    int Col=rec.indexOf("lens_preset_three");
    while(qry.next())
        res.append(qry.value(Col).toString());
    return res;
}

QString DoctorHandler::getDoctorPrimaryFormula(QString id){
    QSqlQuery qry("select primary_formula from doctors where doctor_id='"+id+"';");
    QSqlRecord rec=qry.record();
    QString res;
    int Col=rec.indexOf("primary_formula");
    while(qry.next())
        res.append(qry.value(Col).toString());
    return res;
}

QString DoctorHandler::getDoctorEmail(QString id){
    QSqlQuery qry("select email from doctors where doctor_id='"+id+"';");
    QSqlRecord rec=qry.record();
    QString res;
    int Col=rec.indexOf("email");
    while(qry.next())
        res.append(qry.value(Col).toString());
    return res;
}

bool DoctorHandler::checkDoctorID(QString id){
    QSqlQuery qry("SELECT COUNT(*) from doctors where doctor_id='"+id+"';");
    QSqlRecord rec=qry.record();

    int Col=rec.indexOf("COUNT(*)");
    while (qry.next()) {
        int n= qry.value(Col).toString().toInt();
        if(n>0)
            return true;
    }
    return false;
}

QString DoctorHandler::setDoctorName(QString id, QString dname){
    if(!checkDoctorID(id))
        return QString("No matching record found");
    QSqlQuery qry;
    qry.prepare("UPDATE doctors SET name='"+dname+"' where doctor_id='"+id+"';");
    if(qry.exec()){
        return QString("Changed doctor name");
    }
    return qry.lastError().text();
}

QString DoctorHandler::setDoctorLensPresetOne(QString id, QString lensone){
    if(!checkDoctorID(id))
        return QString("No matching record found");
    QSqlQuery qry;
    qry.prepare("UPDATE doctors SET lens_preset_one='"+lensone+"' where doctor_id='"+id+"';");
    if(qry.exec()){
        return QString("Changed doctor lens preset one");
    }
    return qry.lastError().text();
}

QString DoctorHandler::setDoctorLensPresetTwo(QString id, QString lenstwo){
    if(!checkDoctorID(id))
        return QString("No matching record found");
    QSqlQuery qry;
    qry.prepare("UPDATE doctors SET lens_preset_two='"+lenstwo+"' where doctor_id='"+id+"';");
    if(qry.exec()){
        return QString("Changed doctor lens preset two");
    }
    return qry.lastError().text();
}

QString DoctorHandler::setDoctorLensPresetThree(QString id, QString lensthree){
    if(!checkDoctorID(id))
        return QString("No matching record found");
    QSqlQuery qry;
    qry.prepare("UPDATE doctors SET lens_preset_three='"+lensthree+"' where doctor_id='"+id+"';");
    if(qry.exec()){
        return QString("Changed doctor lens preset three");
    }
    return qry.lastError().text();
}

QString DoctorHandler::setDoctorPrimaryFormula(QString id, QString formula){
    if(!checkDoctorID(id))
        return QString("No matching record found");
    QSqlQuery qry;
    qry.prepare("UPDATE doctors SET primary_formula='"+formula+"' where doctor_id='"+id+"';");
    if(qry.exec()){
        return QString("Changed doctor primary formula");
    }
    return qry.lastError().text();
}

QString DoctorHandler::setDoctorEmail(QString id, QString email){
    if(!checkDoctorID(id))
        return QString("No matching record found");
    QSqlQuery qry;
    qry.prepare("UPDATE doctors SET email='"+email+"' where doctor_id='"+id+"';");
    if(qry.exec()){
        return QString("Changed doctor email");
    }
    return qry.lastError().text();
}
QStringList DoctorHandler::getDoctors(){
    QSqlQuery qry("select doctor_id from doctors where id!=0;");
    QSqlRecord rec = qry.record();
    QStringList res;
    int Col = rec.indexOf("doctor_id");
    while (qry.next())
        res.append(qry.value(Col).toString());
    return res;
}

QStringList DoctorHandler::getAllDoctors()
{
    QSqlQuery qry("select doctor_id from doctors;");
    QSqlRecord rec = qry.record();
    QStringList res;
    int Col = rec.indexOf("doctor_id");
    while (qry.next())
        res.append(qry.value(Col).toString());
    return res;
}

QStringList DoctorHandler::getPatients(QString id){
    QSqlQuery qry("select patient_id from patients where doctor_id='"+id+"' and id!=0;");
    QSqlRecord rec = qry.record();
    QStringList res;
    int Col = rec.indexOf("patient_id");
    while (qry.next())
        res.append(qry.value(Col).toString());
    return res;
}

QStringList DoctorHandler::getAllPatients(QString id)
{
    QSqlQuery qry("select patient_id from patients where doctor_id='"+id+"';");
    QSqlRecord rec = qry.record();
    QStringList res;
    int Col = rec.indexOf("patient_id");
    while (qry.next())
        res.append(qry.value(Col).toString());
    return res;
}

QString DoctorHandler::deleteDoctor(QString id){
    if(!checkDoctorID(id))
        return "No matching record found";
    QSqlQuery qry;
    qry.prepare("DELETE from doctors where doctor_id='"+id+"';");
    if(qry.exec()){
        return "Doctor deleted succesfully";
    }
    QStringList pats=DoctorHandler::getPatients(id);
    for(int i=0;i<pats.size();i++){
        //        PatientHandler::deletePatient(pats.at(i));
        PatientHandler::setDoctorId(pats.at(i),"");
    }
    return qry.lastError().text();
}

QString DoctorHandler::getDoctorID(QString id){
    QSqlQuery qry("select doctor_id from doctors where id="+id+";");
    QSqlRecord rec=qry.record();
    QString res;
    int Col=rec.indexOf("doctor_id");
    while(qry.next())
        res.append(qry.value(Col).toString());
    return res;
}

QString DoctorHandler::deleteDoctorWithID(QString id){
    if(!checkDoctorID(id))
        return "No matching record found";
    QSqlQuery qry;
    qry.prepare("DELETE from doctors where id="+id+";");
    if(qry.exec()){
        return "Doctor deleted succesfully";
    }
    QString did=DoctorHandler::getDoctorID(id);
    QStringList pats=DoctorHandler::getPatients(did);
    for(int i=0;i<pats.size();i++){
        PatientHandler::deletePatient(pats.at(i));
    }
    return qry.lastError().text();
}

QString DoctorHandler::addDoctor(QString id, QString name, QString lensone, QString lenstwo, QString lensthree, QString formula, QString email){
    if(checkDoctorID(id))
        return QString("Record with ID exists");
    QSqlQuery qry;
    qry.prepare("INSERT into doctors(doctor_id,name,lens_preset_one,lens_preset_two,lens_preset_three,primary_formula, email) VALUES('"+id+"','"+name+"','"+lensone+"','"+lenstwo+"','"+lensthree+"','"+formula+"','"+email+"');");
//    Logger::debug(qry.lastQuery(),__PRETTY_FUNCTION__,__LINE__);
    if(qry.exec()){
        return QString("Added new record");
    }
    return qry.lastError().text();
}

QString DoctorHandler::addDoctorWithID(QString absid, QString id, QString name, QString lensone, QString lenstwo, QString lensthree, QString formula, QString email)
{
    if(checkDoctorID(id))
        return QString("Record with ID exists");
    QSqlQuery qry;
    qry.prepare("INSERT into doctors(id,doctor_id,name,lens_preset_one,lens_preset_two,lens_preset_three,primary_formula,email) VALUES("+absid+",'"+id+"','"+name+"','"+lensone+"','"+lenstwo+"','"+lensthree+"','"+formula+"','"+email+"');");

//    Logger::debug(qry.lastQuery(),__PRETTY_FUNCTION__,__LINE__);
    if(qry.exec()){
        return QString("Added new record");
    }
    return qry.lastError().text();
}

int DoctorHandler::count()
{
    QSqlQuery qry("select doctor_id from doctors;");
    QSqlRecord rec = qry.record();
    QStringList res;
    int Col = rec.indexOf("doctor_id");
    while (qry.next())
        res.append(qry.value(Col).toString());
    return res.size();
}
