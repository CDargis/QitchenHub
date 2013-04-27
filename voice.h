#ifndef VOICE_H
#define VOICE_H

#include <QObject>
#include <QProcess>
#include <QQueue>

class CVoice : public QObject
{
    Q_OBJECT
public:
    explicit CVoice(QObject *parent = 0);
    ~CVoice();

    void registerTypes(const char *uri);

    Q_INVOKABLE void say(const QString& sentence);
    
signals:
    void finished();
    
private slots:
    void checkQueue();

private:
    QProcess m_festival;
    QProcess m_echo;
    QQueue<QString> m_queuedSentences;
    
};

#endif // VOICE_H
