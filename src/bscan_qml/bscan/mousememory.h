#ifndef MOUSEMEMORY_H
#define MOUSEMEMORY_H

#include <QObject>
#include<QDebug>
#include<QPoint>
#include<QFile>
class MouseMemory : public QObject
{
    Q_OBJECT
public:
    explicit MouseMemory(QObject *parent = nullptr);

    Q_INVOKABLE void addPoint(double x, double y, QString s, QString filename);
    Q_INVOKABLE void addLine(double x, double x1, double y, double y1, double distance, QString s,QString filename);
    Q_INVOKABLE void addSurface(double x, double y, QString s, QString filename);
    Q_INVOKABLE QList<double> reDraw(int type, QString filename);
    Q_INVOKABLE void metaData(QString filename);
    Q_INVOKABLE void createDataBase();



    Q_INVOKABLE void save(QString filename);

signals:
};

#endif // MOUSEMEMORY_H
