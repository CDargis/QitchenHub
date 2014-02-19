<<<<<<< HEAD
#include <QtGui/QGuiApplication>
#include <QtQuick/QQuickItem>
#include <QQuickView>
#include <QQmlContext>

#include "translationhandler.h"
#include "voice.h"



int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);

    TranslationHandler* tHandler = new TranslationHandler(&app);

    qmlRegisterType<CVoice>("TTSVoice", 1, 0, "Voice");
    //qmlRegisterType<QDate>("QMLDate", 1, 0, "TDate");
    QQuickView view;
    //view.rootContext()->setContextProperty("tdate", qdate);
    view.rootContext()->setContextProperty("tr", tHandler);
    view.setSource(QUrl("qml/KitchenApp/main.qml"));

    view.setResizeMode(QQuickView::SizeRootObjectToView);
    view.showFullScreen();

    return app.exec();
}
=======
#include <QtGui/QGuiApplication>
#include <QtQuick/QQuickItem>
#include <QQuickView>
#include <QQmlContext>

#include "translationhandler.h"
#include "voice.h"
#include "mousedetector.h"


int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);

    TranslationHandler* tHandler = new TranslationHandler(&app);
    MouseDetector* mouseDetector = new MouseDetector(&app);

    qmlRegisterType<CVoice>("TTSVoice", 1, 0, "Voice");
    //qmlRegisterType<QDate>("QMLDate", 1, 0, "TDate");
    QQuickView view;
    //view.rootContext()->setContextProperty("tdate", qdate);
    view.rootContext()->setContextProperty("tr", tHandler);
    view.rootContext()->setContextProperty("MouseDetector", mouseDetector);
    view.setSource(QUrl("qml/KitchenApp/main.qml"));

    view.setResizeMode(QQuickView::SizeRootObjectToView);
    view.showFullScreen();

    return app.exec();
}
>>>>>>> cbb4f5b92a5ed8ae0df3627c98d1387d7cafd1aa
