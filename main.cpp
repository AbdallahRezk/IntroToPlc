#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include "backend.h"

int main(int argc, char *argv[])
{
//    qputenv("QSG_VISUALIZE", "overdraw");

    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);

    QGuiApplication app(argc, argv);

    qmlRegisterType<Backend>("io.qt.Backend", 1, 0, "Backend");

    QQmlApplicationEngine engine;
    engine.load(QUrl(QStringLiteral("qrc:/main.qml")));
    if (engine.rootObjects().isEmpty()) { return -1; }


    return app.exec();
}
// This is not acceptable.
// How is your father?
// For Glory
// Get the f*** out of here.
// Jory Cassel
// Eddard Stark
// Jon Snow
// Strength and Honour
