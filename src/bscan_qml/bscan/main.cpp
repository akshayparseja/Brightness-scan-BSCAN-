#include <QApplication>
#include <QQmlApplicationEngine>
#include "videoimageprovider.h"
#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQmlEngine>
#include <QQmlContext>
#include<QtSql>
#include<QCamera>
#include<QQmlComponent>
#include<QQuickView>
#include "mousememory.h"
#include <QQuickItem>
#include<QQmlProperty>
#include <QQuickView>
#include <QtMultimedia/QCameraInfo>
#include "videoimageprovider.h"
#include "DatabaseHandler/doctorhandler.h"
#include "DatabaseHandler/patienthandler.h"
#include "DatabaseHandler/basehandler.h"

int main(int argc, char *argv[])
{
    qputenv("QT_IM_MODULE", QByteArray("qtvirtualkeyboard"));

    QApplication app(argc, argv);
    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);
    QQmlApplicationEngine engine;
    QQmlApplicationEngine engine1;
    engine.addImageProvider(QLatin1String("videoCapture"), new VideoImageProvider);
    QScopedPointer<MouseMemory> mouse(new MouseMemory);
    QScopedPointer<DoctorHandler> doctor(new DoctorHandler);
    QScopedPointer<PatientHandler> patient(new PatientHandler);
    QScopedPointer<BaseHandler> database(new BaseHandler);


    engine.rootContext()->setContextProperty("doctor",doctor.data());
    engine.rootContext()->setContextProperty("mouse",mouse.data());
    engine.rootContext()->setContextProperty("patient",patient.data());
    engine.rootContext()->setContextProperty("database",database.data());



    //    engine.addImageProvider(QLatin1String("videoCapture"), new VideoImageProvider);
    engine.load(QUrl(QStringLiteral("qrc:/main.qml")));
//    engine1.load(QUrl(QStringLiteral("qrc:/PlayVideo.qml")));

//    QObject * rootObject = engine1.rootObjects().first();
//    qDebug() << "Object name : " << rootObject->objectName();
//    QObject *qmlCamera = engine1.rootObjects().first()->findChild<QObject*>("camera1");
//    qDebug()<<qmlCamera;
//    QVariant mediaObject = qmlCamera->property("mediaObject");
//    QCamera * camera = qvariant_cast<QCamera *>(mediaObject);
//    camera->start();
            return app.exec();
}
