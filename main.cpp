#include <QtGui/QGuiApplication>
//#include "qtquick2applicationviewer.h"
#include <QtQuick/QQuickItem>
#include <QQuickView>

#include "voice.h"

int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);
    qmlRegisterType<CVoice>("TTSVoice", 1, 0, "Voice");
    //QtQuick2ApplicationViewer viewer;
    QQuickView view;
    view.setSource(QUrl("qml/KitchenApp/main.qml"));
    view.show();

    return app.exec();
}
