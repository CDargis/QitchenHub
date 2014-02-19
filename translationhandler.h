#ifndef TRANSLATIONHANDLER_H
#define TRANSLATIONHANDLER_H

#include <QObject>
#include <QtGui/QGuiApplication>
#include <QTranslator>
#include <QDebug>

class TranslationHandler : public QObject
{
    Q_OBJECT
    Q_PROPERTY(QString emptyString READ getEmptyString NOTIFY languageChanged)
public:
    explicit TranslationHandler(QObject *parent = 0);
    QString getEmptyString();
signals:
    void languageChanged();
public slots:
    Q_INVOKABLE void changeTranslation(const QVariant& lang);
private:
    QTranslator polishTr;
};

#endif // TRANSLATIONHANDLER_H
