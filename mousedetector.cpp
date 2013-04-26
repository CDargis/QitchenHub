#include "mousedetector.h"
#include <QDebug>

MouseDetector::MouseDetector(QObject *parent) :
    QObject(parent)
{
}

QPoint MouseDetector::getMouseCoords()
{
    return QCursor::pos();
}
