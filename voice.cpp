#include "voice.h"

#include <QDebug>

CVoice::CVoice(QObject *parent) :
    QObject(parent)
{
    m_echo.setStandardOutputProcess(&m_festival);
    connect(&m_festival, SIGNAL(finished(int)), this, SLOT(checkQueue()));
}

CVoice::~CVoice()
{
    m_festival.close();
}

void CVoice::say(const QString& sentence)
{
    /*if (m_echo.state() != QProcess::NotRunning)
        m_echo.close();*/
    if (m_festival.state() != QProcess::NotRunning) {
        m_queuedSentences.enqueue(sentence);
        return;
    }

    QStringList argsEcho;
    argsEcho << "\"" + sentence + "\"";

    QStringList argsFest;
    argsFest << "--tts";

    m_festival.start(QString("festival"), argsFest);
    m_echo.start(QString("echo"), argsEcho);
}

void CVoice::checkQueue()
{
    if (m_queuedSentences.isEmpty())
        emit finished();
    else
        say(m_queuedSentences.dequeue());
}
