#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQmlContext>
#include <QIcon>

#include "FudyUtils.h"
#include "NoteScreen/StickNoteModel.h"
#include "StylingComponents/FudyColor.h"
#include "StylingComponents/FudyFont.h"

int main(int argc, char *argv[])
{
#if QT_VERSION < QT_VERSION_CHECK(6, 0, 0)
	QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);
#endif
	QGuiApplication app(argc, argv);
	QQmlApplicationEngine engine;

	qmlRegisterSingletonType<FudyColor>("Fudy.style.singleton",
	                                    1,
	                                    0,
	                                    "FudyColor",
	                                    FudyColor::createSingletonInstance);
	qmlRegisterSingletonType<FudyFont>("Fudy.style.singleton",
	                                   1,
	                                   0,
	                                   "FudyFont",
	                                   FudyFont::createSingletonInstance);
	app.setWindowIcon(QIcon(":/image/icons_fudy.png"));

	//TODO: Create a WARNING popup for this case
	utils::createDatabase(app); //This function returns BOOL value

	StickNoteModel stickNoteModel;
	engine.rootContext()->setContextProperty("StickNoteModel", &stickNoteModel);

	engine.addImportPath("./NoteScreen");
	engine.addImportPath("./PlanScreen");
	engine.addImportPath("./TodoScreen");
	engine.addImportPath("./WorkspaceScreen");
	const QUrl url(QStringLiteral("qrc:/main.qml"));
	QObject::connect(&engine, &QQmlApplicationEngine::objectCreated,
	    &app, [url](QObject *obj, const QUrl &objUrl) {
		    if (!obj && url == objUrl)
				QCoreApplication::exit(-1);
	    }, Qt::QueuedConnection);
	engine.load(url);

	return app.exec();
}
