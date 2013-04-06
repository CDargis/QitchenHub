#include <QtGui/QGuiApplication>
#include "qtquick2applicationviewer.h"

#include <QQmlContext>
#include "translationhandler.h"

int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);
    TranslationHandler* tHandler = new TranslationHandler(&app);

    QtQuick2ApplicationViewer viewer;
    viewer.rootContext()->setContextProperty("tr", tHandler);
    viewer.setMainQmlFile(QStringLiteral("qml/KitchenApp/main.qml"));
    viewer.showFullScreen();

    return app.exec();
}
