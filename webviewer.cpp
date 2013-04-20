#include "webviewer.h"

WebViewer::WebViewer(QWebView *parent) :
    QWebView(parent)
{
}


QString WebViewer::apiKey() {
    return QString("AIzaSyArvuWNnwVISUzZBG62o33Se2J2NBbQEYs");
}


QVariant WebViewer::evaluateJavaScript(const QString & scriptSource)
{
    return page()->currentFrame()->evaluateJavaScript(scriptSource);
}
