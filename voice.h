#ifndef VOICE_H
#define VOICE_H

#include <QObject>
#include <QProcess>

class CVoice : public QObject
{
    Q_OBJECT
public:
    explicit CVoice(QObject *parent = 0);
    ~CVoice();

    void registerTypes(const char *uri);

    Q_INVOKABLE void say(const QString& sentence);
    
signals:
    
public slots:

private:
    QProcess m_festival;
    QProcess m_echo;
    
};

#endif // VOICE_H
