#ifndef SCANHANDLER_H
#define SCANHANDLER_H

#include <QObject>
#include "DatabaseHandler/basehandler.h"
#include <QtSql>
#include <QDebug>
#include <QFileInfo>
#include "DatabaseHandler/patienthandler.h"
#include "DatabaseHandler/doctorhandler.h"
#include "stdlib.h"
//#include "General/structures.h"

class ScanHandler : public QObject
{
    Q_OBJECT
public:
    explicit ScanHandler(QObject *parent = nullptr);

    static QString addScan(QString doctorid, QString patientid, QString scanid, QString scantype, QString scan_location);
    static bool checkScanID(QString scanid);
    static QStringList getScans_Patient(QString patientid);
    static QStringList getScans_Doctor(QString doctorid);
    static QString deleteScan(QString scanid);
    static QString deleteAll(QString patientid);
    static QString generateID();
    static QString getDoctorID(QString scanid);
    static QString getScanType(QString scanid);
    static QString getPatientID(QString scanid);
    static QStringList getAllAScans();
    static QStringList getAllBScanVideos();
    static QStringList getAllBScanFrames();

    /*
     * A-Scan retrieval functions:
     * doctor_id
     * patient_id
     * cornea
     * lens_one
     * lens_two
     * retina
     * acd
     * lt
     * vit
     * al
     * av_al
     * operating_method
     * operating_mode
     * operating_eye
     * date
     * time
     * scan_data 1024 size array of range 0-255
    */

    /*
     * B-Scan video retrieval
     * function to load video file with scan_id
     */

    /*
     * B-Scan frame retrieval
     * scan_id
     * frame_number
     * points
     * lines
     * areas
     * image
     * comments
     * doctor_id
     * patient_id
     * operating_eye
     * date
     * time
    */
signals:

};

#endif // SCANHANDLER_H
