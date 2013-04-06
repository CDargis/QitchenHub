#include "voice.h"

CVoice::CVoice(QObject *parent) :
    QObject(parent)
{
    m_proc = new QProcess();
    connect(m_proc, SIGNAL(finished(int)), this, SLOT(cleanUp()));
}

void CVoice::say(const QString& sentence)
{

    QString program("/bin/sh");
    QStringList args;

    //args << "\"" + sentence + "\"" << "|" << "festival" << "--tts";
    args << "-c" << "echo \"" + sentence + "\" | festival --tts";

    m_proc->start(program, args);
}

void CVoice::cleanUp()
{
}
