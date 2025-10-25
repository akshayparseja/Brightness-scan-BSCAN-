#include "mousememory.h"
#include <QList>
#include<QPair>
#include<vector>

#include "videoimageprovider.h"
#include <QDebug>

#include "iostream"
#include "stdio.h"
#include <QtSql>
#include <opencv2/highgui/highgui_c.h>
#include <opencv/cv.h>
#include <QTimer>
#include <QImage>
#include <QPainter>
#include <opencv2/opencv.hpp>
#include <opencv2/highgui/highgui.hpp>
#include <opencv2/imgproc/imgproc.hpp>
#include <opencv2/core/core.hpp>
#include<QJsonDocument>
using namespace cv;


std::vector<Point2f> vec;
std::vector<Point2f> vec1;
double area;
QJsonObject json_obj;
QJsonArray root_obj;
QJsonObject coordinate;
QVariantList data2;
MouseMemory::MouseMemory(QObject *parent) : QObject(parent)
{

}

QJsonArray points;
QJsonArray pointlable;

QJsonArray lines;
QJsonArray linelable;

QJsonArray areapoints;
QJsonArray arealabel;

QJsonArray distancevalue;
QJsonArray shapearea;
QList<QPair<double, double>> values;

QMap<QString,double> mapped;


int count=0;
/*
 * This func is used to load all the data from the json(if exists)
 * Parameter:File name to fetch data from, here just the png/jpg name
 */
void MouseMemory::metaData(QString filename)
{

    QString file_path="src/bscan_qml/bscan/database/"+filename+".json";
    QString as = QDateTime::currentDateTime().toString("yyyy-MM-dd HH:mm:ss");

    QFile save_file(file_path);
    // json file
    if( !save_file.open( QIODevice::ReadOnly ) ) //read json content
    {
        qDebug()<<"not opening";
        save_file.close();

    }

    QJsonDocument jsonOrg = QJsonDocument::fromJson( save_file.readAll() );
    save_file.close();
    if(jsonOrg.isEmpty()){
        qDebug()<<"EMPTY";
        arealabel=areapoints=points=pointlable=lines=linelable={};


    }
    if(jsonOrg.isObject()  ){
        qDebug()<<"LOADED";
        QJsonObject data_obj=jsonOrg.object();

        points=data_obj["points"].toArray();
        pointlable=data_obj["pointlabel"].toArray();
        lines=data_obj["linePoints"].toArray();
        linelable=data_obj["linelabel"].toArray();
        areapoints=data_obj["areaPoints"].toArray();
        arealabel=data_obj["arealabel"].toArray();
        distancevalue=data_obj["distance"].toArray();
        shapearea=data_obj["area"].toArray();

    }


}


/*
 * This func is used to add data for points(just x,y) to temp data structure unless button save is pressed on the screen
 * parameter:x coordinate, y coordinate
 */
void MouseMemory::addPoint(double x, double y,QString s, QString filename)
{


    points.append(x);
    points.append(y);
    pointlable.append(s);





}
/*
 * This func is used to add data for Lines(just x1,y1,x2,y2) and distance for the same to temp data structure unless button save is pressed on the screen
 * parameter:x1 coordinate, y1 coordinate,x2 coordinate, y2 coordinate, distance between the points
 */

void MouseMemory::addLine(double x,double x1,double y, double y1,double distance, QString s, QString filename)
{




    lines.append(x);
    lines.append(y);
    lines.append(x1);
    lines.append(y1);
    linelable.append(s);
    distancevalue.append(distance);
    qDebug()<<points;




}

void MouseMemory::addSurface(double x, double y, QString s,QString filename)
{

    if(x!=0){
    vec.push_back((Point2f((float)(x),
                           (float)(y))));
    areapoints.append(x);
    areapoints.append(y);
}

    if(x==-1){
        arealabel.append(s);
        double area = cv::contourArea(vec);
        shapearea.append(area);
        vec={};
        qDebug()<<vec.data();
    }


}
/*
 * This function is called when we swtich any redrawing button as "ON" on the screen, thereby loading all the data
    onto some datastructure and passed to qml file for further redrawing
    Parameter:Type of redrawing(0:Points,1:Lines,2:Area(shapes))
 */
QList<double> MouseMemory::reDraw(int type, QString filename)
{
    QString file_path="src/bscan_qml/bscan/database/"+filename+".json";
    QString as = QDateTime::currentDateTime().toString("yyyy-MM-dd HH:mm:ss");

    QFile save_file(file_path);
    // json file
    if( !save_file.open( QIODevice::ReadOnly ) ) //read json content
    {
        //open file error ...

    }

    QJsonDocument jsonOrg = QJsonDocument::fromJson( save_file.readAll() );
    save_file.close();
    if(jsonOrg.isEmpty()){
        qDebug()<<"EMPTY";
    }
    if(jsonOrg.isObject()  ){
        qDebug()<<"LOADED";
        QJsonObject data_obj=jsonOrg.object();

        points=data_obj["points"].toArray();
        pointlable=data_obj["pointlabel"].toArray();
        lines=data_obj["linePoints"].toArray();
        linelable=data_obj["linelabel"].toArray();
        areapoints=data_obj["areaPoints"].toArray();
        arealabel=data_obj["arealabel"].toArray();
        distancevalue=data_obj["distance"].toArray();
        shapearea=data_obj["area"].toArray();

    }
    if(type==0){
        QList<double> data;
        for(int i=0;i<points.count();i++)
            data.append(points.at(i).toDouble());
        return data;
    }
    else if(type==1){
        QList<double> data;
        for(int i=0;i<lines.count();i++)
            data.append(lines.at(i).toDouble());
        return data;
    }
    else if(type==2){
        QList<double> data;
        for(int i=0;i<areapoints.count();i++)
            data.append(areapoints.at(i).toDouble());
        return data;
    }
    //    else if(type==1){

    //        QSqlQuery query;
    //        query.prepare("SELECT x1,y1,x2,y2 FROM Line  WHERE idname = (:name)");
    //        query.bindValue(":name", file);

    //        if (query.exec()) {

    //            while(query.next()){
    //                double x = query.value(0).toDouble();
    //                double y = query.value(1).toDouble();

    //                double x1 = query.value(2).toDouble();
    //                double y1 = query.value(3).toDouble();
    //                qDebug()<<x<<y<<x1<<y1;
    //                data1.append(x);
    //                data1.append(y);
    //                data1.append(x1);
    //                data1.append(y1);
    //            }
    //        }
    //        return data1;
    //    }/*

}


/*This func is called when we click save , hence saving all data i.e points ,lines,area related data onto json file
 * parameter : file name for writing data
 */
void MouseMemory::save(QString filename)
{

    //jsonarray variable to load existsing json data
    QJsonArray jsonpoints;
    QJsonArray jsonlines;
    QJsonArray jsonarea;
    QJsonArray jsondistance;

    QJsonArray jsonlinelabel;
    QJsonArray jsonarealabel;
    QJsonArray jsonpointlabel;
    QJsonArray jsonareapoints;

    QString file_path="src/bscan_qml/bscan/database/"+filename+".json";
    QString as = QDateTime::currentDateTime().toString("yyyy-MM-dd HH:mm:ss");

    QFile save_file(file_path);
    // json file
    if( !save_file.open( QIODevice::ReadOnly ) ) //read json content
    {
        //open file error ...

    }

    QJsonDocument jsonOrg = QJsonDocument::fromJson( save_file.readAll() );
    save_file.close();

    //local variable, do not use m_ prefix.




    json_obj["idname"]=filename;
    json_obj.insert("pointlabel",pointlable);
    json_obj.insert("linelabel",linelable);
    json_obj.insert("arealabel",arealabel);
    json_obj["date"] =as;
    json_obj.insert("points",points);
    json_obj.insert("linePoints",lines);
    json_obj.insert("areaPoints",areapoints);
    json_obj.insert("distance",distancevalue);
    json_obj.insert("area",shapearea);
    //        arrLog.push_back(json_obj);



    QJsonDocument json_doc(json_obj);

    QString json_string = json_doc.toJson();
    if(!save_file.open(QIODevice::WriteOnly)){

    }
    save_file.write(json_string.toLocal8Bit());
    save_file.close();

    //    if(jsonOrg.isObject()){
    //        QJsonObject data_obj=jsonOrg.object();
    //        /* here we load all the json array to respective variables to have dynamic appending of
    //            data */
    //        //These are coordinates of points,line,shape respectively
    //        jsonpoints=data_obj["points"].toArray();
    //        for(int i=0;i<points.count();i++){
    //            jsonpoints.append(points[i]);
    //        }
    //        data_obj.insert("points",jsonpoints);
    //        qDebug()<<data_obj;
    //        QJsonDocument json_doc(data_obj);

    //        QString json_string = json_doc.toJson();
    //        if(!save_file.open(QIODevice::WriteOnly)){

    //        }
    //        save_file.write(json_string.toLocal8Bit());
    //        save_file.close();
    //    }



    //    arealabel=areapoints=points=pointlable=lines=linelable={};
}




//qDebug()<<filename;






void MouseMemory::createDataBase()
{

    qDebug()<<"start";
    QSqlDatabase db;
    db=QSqlDatabase::addDatabase("QSQLITE");
    db.setDatabaseName("/opt/bscan/db.sqlite");
    if(!db.open())qDebug()<<"problem";
    QString query="CREATE TABLE Point("
                  "id INTEGER PRIMARY KEY AUTOINCREMENT DEFAULT 1,"
                  "idname text NOT NULL,"
                  "imagedir text,"
                  "json text,"
                  "Date DATETIME);";
    QSqlQuery qry;
    if(!qry.exec(query))qDebug()<<"error in table creation";
    QString query1="CREATE TABLE Line("
                   "id INTEGER PRIMARY KEY AUTOINCREMENT DEFAULT 1,"
                   "idname text NOT NULL,"
                   "imagedir text,"
                   "json text,"
                   "Date DATETIME);";
    if(!qry.exec(query1))qDebug()<<"error in table creation 2";
    QString query2="CREATE TABLE Area("
                   "id INTEGER PRIMARY KEY AUTOINCREMENT DEFAULT 1,"
                   "idname text NOT NULL,"
                   "imagedir text,"
                   "json text,"
                   "Date DATETIME);";
    if(!qry.exec(query2))qDebug()<<"error in table creation 3";
    qDebug()<<"STOP";
}

//QSqlQuery qry;
//qry.prepare("INSERT INTO Line("
//            "idname,"
//            "x1,"
//            "y1,"
//            "x2,"
//            "y2,"
//            "distance,"
//            "label,"
//            "save)"
//            "VALUES(?,?,?,?,?,?,?,?);");
//qry.addBindValue(filename);
//qry.addBindValue(x);
//qry.addBindValue(y);

//qry.addBindValue(x1);
//qry.addBindValue(y1);

//qry.addBindValue(distance);

//qry.addBindValue(s);
//QString as = QDateTime::currentDateTime().toString("yyyy-MM-dd HH:mm:ss");

//qry.addBindValue(as);



//if(!qry.exec())qDebug()<<"error in entring";
//points.insert(s,qMakePair(x, y));
//qDebug()<<x;

//else if (x==-1){

//    double area = cv::contourArea(vec);
//    ;
//    QSqlQuery qry;
//    qry.prepare("INSERT INTO Area("
//                "idname,"
//                "data,"
//                "area,"
//                "label,"
//                "save)"
//                "VALUES(?,?,?,?,?);");




//    qry.addBindValue(filename);
//    qry.addBindValue(data2);
//    qry.addBindValue(area);

//    qry.addBindValue(s);
//    QString as = QDateTime::currentDateTime().toString("yyyy-MM-dd HH:mm:ss");

//    qry.addBindValue(as);

//    if(!qry.exec())qDebug()<<"error in entring area";

//}


//QSqlQuery query;
//query.prepare("SELECT x,y  FROM Point WHERE idname = (:name)");
//query.bindValue(":name", file);

//if (query.exec()) {

//    while(query.next()){
//        double x = query.value(0).toDouble();
//        double y = query.value(1).toDouble();
//        data.append(x);
//        data.append(y);
//    }
//}
//return data;
