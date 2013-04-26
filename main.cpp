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
