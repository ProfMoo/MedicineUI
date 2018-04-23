#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQmlContext>

#include "sockets.h"
#include "fileio.h"

int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);

    QQmlApplicationEngine engine;
    engine.load(QUrl(QStringLiteral("qrc:/main.qml")));

//    sockets sock;
//    QObject *MainWindow = engine.rootObjects().first();
//    engine.rootContext()->setContextProperty("socketz", &sock);
//    sockets::connect(&sock,SIGNAL(socket_str()),MainWindow,SLOT(sockets()));

    FileIO fileIO;
    QObject *MainWindow = engine.rootObjects().first();
    engine.rootContext()->setContextProperty("fileio", &fileIO);
    //sockets::connect(&filez,SIGNAL(socket_str()),MainWindow,SLOT(files()));

    return app.exec();
}

