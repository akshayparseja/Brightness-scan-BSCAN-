#ifndef BASEHANDLER_H
#define BASEHANDLER_H

#include <QObject>
#include <QtSql>
#include <General/constants.h>


class BaseHandler : public QObject
{
    Q_OBJECT
public:
    explicit BaseHandler(QObject *parent = nullptr);

    void dbclose();
    Q_INVOKABLE bool dbopen();
    QString createDB();

private:
    QSqlDatabase db;
};

#endif // BASEHANDLER_H
