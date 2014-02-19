#include "voice.h"

#include <QDebug>

CVoice::CVoice(QObject *parent) :
    QObject(parent)
{
    m_echo.setStandardOutputProcess(&m_festival);
    connect(&m_festival, SIGNAL(finished(int)), this, SIGNAL(finished()));
}

CVoice::~CVoice()
{
    m_festival.close();
}

void CVoice::say(const QString& sentence)
{
    if (m_echo.state() == QProcess::Running)
        m_echo.close();
    if (m_festival.state() == QProcess::Running)
        m_festival.close();

    QStringList argsEcho;
    argsEcho << "\"" + sentence + "\"";

    QStringList argsFest;
    argsFest << "--tts";

    m_festival.start(QString("festival"), argsFest);
    m_echo.start(QString("echo"), argsEcho);

}
