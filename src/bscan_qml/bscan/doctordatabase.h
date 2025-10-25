#ifndef DOCTORDATABASE_H
#define DOCTORDATABASE_H

#include <QObject>

class doctordatabase : public QObject
{
    Q_OBJECT
public:
    explicit doctordatabase(QObject *parent = nullptr);
    Q_INVOKABLE QStringList getDoctorId();
    Q_INVOKABLE QString getDoctorName(QString id);
    Q_INVOKABLE QList<QString> getAllDoctorsName();
    Q_INVOKABLE QStringList getDoctorEmail();
//    Q_INVOKABLE void dbOpen();
        signals:

    };

#endif // DOCTORDATABASE_H
