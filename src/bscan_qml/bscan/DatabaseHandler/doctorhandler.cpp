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
    QSqlQuery qry("select id from doctors where doctorid='"+id+"';");
    QSqlRecord rec = qry.record();
    QStringList res;
    int Col = rec.indexOf("id");
    while (qry.next())
        res.append(qry.value(Col).toString());
    return res;
}

QString DoctorHandler::getDoctorName(QString id){
    qDebug()<<"HIdoc";
    QSqlQuery qry("select name from doctors where doctorid='"+id+"';");
    QSqlRecord rec=qry.record();
    QString res;
    int Col=rec.indexOf("name");
    while(qry.next())
        res.append(qry.value(Col).toString());
    return res;
}

QString DoctorHandler::getDoctorLensPresetOne(QString id){
    QSqlQuery qry("select lenspresetone from doctors where doctorid='"+id+"';");
    QSqlRecord rec=qry.record();
    QString res;
    int Col=rec.indexOf("lenspresetone");
    while(qry.next())
        res.append(qry.value(Col).toString());
    return res;
}

QString DoctorHandler::getDoctorLensPresetTwo(QString id){
    QSqlQuery qry("select lenspresettwo from doctors where doctorid='"+id+"';");
    QSqlRecord rec=qry.record();
    QString res;
    int Col=rec.indexOf("lenspresettwo");
    while(qry.next())
        res.append(qry.value(Col).toString());
    return res;
}

QString DoctorHandler::getDoctorLensPresetThree(QString id){
    QSqlQuery qry("select lenspresetthree from doctors where doctorid='"+id+"';");
    QSqlRecord rec=qry.record();
    QString res;
    int Col=rec.indexOf("lenspresetthree");
    while(qry.next())
        res.append(qry.value(Col).toString());
    return res;
}

QString DoctorHandler::getDoctorPrimaryFormula(QString id){
    QSqlQuery qry("select formula from doctors where doctorid='"+id+"';");
    QSqlRecord rec=qry.record();
    QString res;
    int Col=rec.indexOf("formula");
    while(qry.next())
        res.append(qry.value(Col).toString());
    return res;
}

QStringList DoctorHandler::getAllDoctorPrimaryFormula()
{
    QSqlQuery qry("select formula from doctors");
    QSqlRecord rec=qry.record();
    QStringList res;
    int Col=rec.indexOf("formula");
    while(qry.next())
        res.append(qry.value(Col).toString());
    return res;
}

QString DoctorHandler::getDoctorEmail(QString id){
    QSqlQuery qry("select email from doctors where doctorid='"+id+"';");
    QSqlRecord rec=qry.record();
    QString res;
    int Col=rec.indexOf("email");
    while(qry.next())
        res.append(qry.value(Col).toString());
    return res;
}

bool DoctorHandler::checkDoctorID(QString id){
    QSqlQuery qry("SELECT COUNT(*) from doctors where doctorid='"+id+"';");
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
    qry.prepare("UPDATE doctors SET name='"+dname+"' where doctorid='"+id+"';");
    if(qry.exec()){
        return QString("Changed doctor name");
    }
    return qry.lastError().text();
}

QString DoctorHandler::setDoctorLensPresetOne(QString id, QString lensone){
    if(!checkDoctorID(id))
        return QString("No matching record found");
    QSqlQuery qry;
    qry.prepare("UPDATE doctors SET lenspresetone='"+lensone+"' where doctorid='"+id+"';");
    if(qry.exec()){
        return QString("Changed doctor lens preset one");
    }
    return qry.lastError().text();
}

QString DoctorHandler::setDoctorLensPresetTwo(QString id, QString lenstwo){
    if(!checkDoctorID(id))
        return QString("No matching record found");
    QSqlQuery qry;
    qry.prepare("UPDATE doctors SET lenspresettwo='"+lenstwo+"' where doctorid='"+id+"';");
    if(qry.exec()){
        return QString("Changed doctor lens preset two");
    }
    return qry.lastError().text();
}

QString DoctorHandler::setDoctorLensPresetThree(QString id, QString lensthree){
    if(!checkDoctorID(id))
        return QString("No matching record found");
    QSqlQuery qry;
    qry.prepare("UPDATE doctors SET lenspresetthree='"+lensthree+"' where doctorid='"+id+"';");
    if(qry.exec()){
        return QString("Changed doctor lens preset three");
    }
    return qry.lastError().text();
}

QString DoctorHandler::setDoctorPrimaryFormula(QString id, QString formula){
    if(!checkDoctorID(id))
        return QString("No matching record found");
    QSqlQuery qry;
    qry.prepare("UPDATE doctors SET formula='"+formula+"' where doctorid='"+id+"';");
    if(qry.exec()){
        return QString("Changed doctor primary formula");
    }
    return qry.lastError().text();
}

QString DoctorHandler::setDoctorEmail(QString id, QString email){
    if(!checkDoctorID(id))
        return QString("No matching record found");
    QSqlQuery qry;
    qry.prepare("UPDATE doctors SET email='"+email+"' where doctorid='"+id+"';");
    if(qry.exec()){
        return QString("Changed doctor email");
    }
    return qry.lastError().text();
}


QStringList DoctorHandler::getDoctors(){
    QSqlQuery qry("select doctorid from doctors where id!=0;");
    QSqlRecord rec = qry.record();
    QStringList res;
    int Col = rec.indexOf("doctorid");
    while (qry.next())
        res.append(qry.value(Col).toString());
    return res;
}

QStringList DoctorHandler::getAllDoctors()
{
    QSqlQuery qry("select doctorid from doctors;");
    QSqlRecord rec = qry.record();
    QStringList res;
    int Col = rec.indexOf("doctorid");
    while (qry.next())
        res.append(qry.value(Col).toString());
    return res;
}

QStringList DoctorHandler::getPatients(QString id){
    QSqlQuery qry("select patient_id from patients where doctorid='"+id+"' and id!=0;");
    QSqlRecord rec = qry.record();
    QStringList res;
    int Col = rec.indexOf("patient_id");
    while (qry.next())
        res.append(qry.value(Col).toString());
    return res;
}

QStringList DoctorHandler::getAllPatients(QString id)
{
    QSqlQuery qry("select patient_id from patients where doctorid='"+id+"';");
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
    qry.prepare("DELETE from doctors where doctorid='"+id+"';");
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

QStringList DoctorHandler::getDoctorID(QString id){
    if(!checkDoctorID(id))
        return QStringList("No matching record found");
    QSqlQuery qry("SELECT doctorid,name,formula from doctors where doctorid='"+id+"';");
    QSqlRecord rec=qry.record();
    QStringList res;
    int Col=rec.indexOf("doctorid");
    int Col1=rec.indexOf("name");
    int Col2=rec.indexOf("formula");

    while(qry.next()){
        res.append(qry.value(Col).toString());
        res.append(qry.value(Col1).toString());
        res.append(qry.value(Col2).toString());
    }

    return res;
}

QStringList DoctorHandler::getCurrentDoctor()
{
    qDebug()<<"IN DOC CURR";
    QSqlQuery qry("SELECT doctorid,name,email FROM doctors ORDER BY id DESC LIMIT 1;");
    QSqlRecord rec=qry.record();
    QStringList res;
    int Col=rec.indexOf("doctorid");
    int Col1=rec.indexOf("name");
    int Col2=rec.indexOf("email");

    while(qry.next()){
        res.append(qry.value(Col).toString());
        res.append(qry.value(Col1).toString());

        res.append(qry.value(Col2).toString());
    }

    return res;
}



QStringList DoctorHandler::getAllDoctorId()
{
    qDebug()<<"start";


    QSqlQuery qry("select doctorid from doctors;");
    QSqlRecord rec = qry.record();
    QStringList res;
    int Col = rec.indexOf("doctorid");
    while (qry.next())
        res.append(qry.value(Col).toString());
    return res;
}


QList<QString> DoctorHandler::getAllDoctorsName()
{
    QSqlQuery qry("select name from doctors");
    QSqlRecord rec=qry.record();
    QList<QString> res;
    int Col=rec.indexOf("name");
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
    QStringList did=DoctorHandler::getDoctorID(id);
    QStringList pats=DoctorHandler::getPatients(did[0]);
    for(int i=0;i<pats.size();i++){
        PatientHandler::deletePatient(pats.at(i));
    }
    return qry.lastError().text();
}

QString DoctorHandler::addDoctor(QString id, QString name, QString lensone, QString lenstwo, QString lensthree, QString formula, QString email){
    qDebug()<<"hi doc"<<endl<<id<<name<<lensone<<lenstwo<<lensthree<<formula<<email;

    if(checkDoctorID(id))
        return QString("Record with ID exists");
    QSqlQuery qry;
    qry.prepare("INSERT into doctors(doctorid,name,lenspresetone,lenspresettwo,lenspresetthree,formula,email) VALUES('"+id+"','"+name+"','"+lensone+"','"+lenstwo+"','"+lensthree+"','"+formula+"','"+email+"');");

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
    qry.prepare("INSERT into doctors(id,doctorid,name,lenspresetone,lenspresettwo,lenspresetthree,formula,email) VALUES("+absid+",'"+id+"','"+name+"','"+lensone+"','"+lenstwo+"','"+lensthree+"','"+formula+"','"+email+"');");

    //    Logger::debug(qry.lastQuery(),__PRETTY_FUNCTION__,__LINE__);
    if(qry.exec()){
        return QString("Added new record");
    }
    return qry.lastError().text();
}

int DoctorHandler::count()
{
    QSqlQuery qry("select doctorid from doctors;");
    QSqlRecord rec = qry.record();
    QStringList res;
    int Col = rec.indexOf("doctorid");
    while (qry.next())
        res.append(qry.value(Col).toString());
    return res.size();
}
