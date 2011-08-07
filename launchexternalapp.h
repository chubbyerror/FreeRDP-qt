#ifndef LAUNCHEXTERNALAPP_H
#define LAUNCHEXTERNALAPP_H

#include <QObject>
#include <QProcess>
#include <QVariant>

class LaunchExternalApp : public QObject
{
    Q_OBJECT

public:
    LaunchExternalApp();
    void processError(QProcess::ProcessError err);
    QProcess process;

public slots:
    void LaunchSlot(QVariant argList);

private:
};

#endif // LAUCHEXTERNALAPP_H
