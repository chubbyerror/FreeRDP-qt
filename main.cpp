#include <QtGui/QApplication>
#include "qmlapplicationviewer.h"
#include "launchexternalapp.h"
#include <QDeclarativeView>
#include <QGraphicsObject>

int main(int argc, char *argv[])
{
    QApplication app(argc, argv);

    QmlApplicationViewer viewer;
    viewer.setOrientation(QmlApplicationViewer::ScreenOrientationAuto);
    viewer.setMainQmlFile(QLatin1String("qml/FreeRDPqt/main.qml"));
    LaunchExternalApp extApp;
    QObject *object = viewer.rootObject();
    QObject::connect(object, SIGNAL(launchSignal(QVariant)), &extApp, SLOT(LaunchSlot(QVariant)));
    viewer.showExpanded();

    return app.exec();
}
