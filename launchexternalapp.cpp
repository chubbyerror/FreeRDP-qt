#include "launchexternalapp.h"
#include <QMessageBox>
#include <QDebug>

LaunchExternalApp::LaunchExternalApp()
{
    //QObject::connect(&process, SIGNAL(QProcess::ProcessError), this, SLOT(processError(QProcess::ProcessError)));
}

void LaunchExternalApp::LaunchSlot(QVariant argList)
{
    QStringList arguments = argList.toStringList();
    //qDebug() << arguments;
    // Replace with new function to call FreeRDP API in future version
    process.start("xfreerdp",arguments);
}

void LaunchExternalApp::processError(QProcess::ProcessError err)
{
    switch(err)
    {
    case QProcess::FailedToStart:
        QMessageBox::information(0,"FailedToStart","FailedToStart");
        break;
    case QProcess::Crashed:
        QMessageBox::information(0,"Crashed","Crashed");
        break;
    case QProcess::Timedout:
        QMessageBox::information(0,"Timedout","Timedout");
        break;
    case QProcess::WriteError:
        QMessageBox::information(0,"WriteError","WriteError");
        break;
    case QProcess::ReadError:
        QMessageBox::information(0,"ReadError","ReadError");
        break;
    case QProcess::UnknownError:
        QMessageBox::information(0,"UnknownError","UnknownError");
        break;
    default:
        QMessageBox::information(0,"default","default");
        break;
    }
}
