#ifndef WEBVIEWER_H
#define WEBVIEWER_H

#include <QObject>
#include <QWebView>
#include <QWebPage>
#include <QWebFrame>

class WebViewer : public QWebView
{
    Q_OBJECT
public:
    explicit WebViewer(QWebView *parent = 0);

    QString apiKey();
    
signals:
    
public slots:
    Q_INVOKABLE QVariant evaluateJavaScript(const QString & scriptSource);
    
};

#endif // WEBVIEWER_H
