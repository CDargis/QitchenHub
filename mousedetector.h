#ifndef MOUSEDETECTOR_H
#define MOUSEDETECTOR_H

#include <QObject>
#include <QCursor>

class MouseDetector : public QObject
{
    Q_OBJECT
public:
    explicit MouseDetector(QObject *parent = 0);
    Q_INVOKABLE QPoint getMouseCoords();
signals:
    
public slots:
    
};

#endif // MOUSEDETECTOR_H
