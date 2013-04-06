#ifndef VOICE_H
#define VOICE_H

#include <QObject>
#include <QProcess>

class CVoice : public QObject
{
    Q_OBJECT
public:
    explicit CVoice(QObject *parent = 0);

    void registerTypes(const char *uri);

    Q_INVOKABLE void say(const QString& sentence);
    
signals:
    
public slots:

private slots:
    void cleanUp();


private:
    QProcess* m_proc;
    
};

#endif // VOICE_H
