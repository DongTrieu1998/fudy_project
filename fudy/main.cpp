#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include "StylingComponents/myColor.h"
#include "StylingComponents/myFont.h"

int main(int argc, char *argv[])
{
#if QT_VERSION < QT_VERSION_CHECK(6, 0, 0)
    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);
#endif
    QGuiApplication app(argc, argv);

    QQmlApplicationEngine engine;

    qmlRegisterSingletonType<MyColor>("Fudy.style.singleton",
                                      1,
                                      0,
                                      "FudyColor",
                                      MyColor::createSingletonInstance);
    qmlRegisterSingletonType<MyFont>("Fudy.style.singleton",
                                      1,
                                      0,
                                      "FudyFont",
                                      MyFont::createSingletonInstance);

    const QUrl url(QStringLiteral("qrc:/main.qml"));
    QObject::connect(&engine, &QQmlApplicationEngine::objectCreated,
        &app, [url](QObject *obj, const QUrl &objUrl) {
            if (!obj && url == objUrl)
                QCoreApplication::exit(-1);
        }, Qt::QueuedConnection);
    engine.load(url);

    return app.exec();
}
