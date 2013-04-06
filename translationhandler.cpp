#include "translationhandler.h"

TranslationHandler::TranslationHandler(QObject *parent) :
    QObject(parent)
{
    polishTr.load(":/tr/languages/lang_pl");
}

QString TranslationHandler::getEmptyString()
{
    return "";
}

// Slot catch - Determine the language to set
void TranslationHandler::changeTranslation(const QVariant& lang)
{
    QString asString = lang.toString();
    qDebug() << asString;
    if(asString.compare("en") == 0)
        qApp->removeTranslator(&polishTr);
    else if(asString.compare("pl") == 0)
        qApp->installTranslator(&polishTr);
    emit languageChanged();
}
