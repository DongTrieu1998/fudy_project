#include <QGuiApplication>
#include <QIcon>
#include <QQmlApplicationEngine>
#include <QQmlContext>

#include "FudyUtils.h"
#include "controller/SignInController.h"
#include "NoteScreen/StickNoteModel.h"
#include "StylingComponents/FudyColor.h"
#include "StylingComponents/FudyFont.h"

int main(int argc, char* argv[]) {
#if QT_VERSION < QT_VERSION_CHECK(6, 0, 0)
	QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);
#endif
	QGuiApplication app(argc, argv);
	QQmlApplicationEngine engine;

	qmlRegisterSingletonType<FudyColor>("Fudy.style.singleton"
										, 1
										, 0
										, "FudyColor"
										, FudyColor::createSingletonInstance);
	qmlRegisterSingletonType<FudyFont>("Fudy.style.singleton"
										, 1
										, 0
										, "FudyFont"
										, FudyFont::createSingletonInstance);
	qmlRegisterSingletonType<SignInController>("Fudy.signin.singleton"
									   , 1
									   , 0
									   , "SignIn"
									   , SignInController::createSingletonInstance);

	app.setWindowIcon(QIcon(":/image/icons_fudy.png"));

	db_utils::createDatabase(app);

	StickNoteModel stickNoteModel;
	engine.rootContext()->setContextProperty("StickNoteModel", &stickNoteModel);

	const QUrl url(QStringLiteral("qrc:/main.qml"));
	QObject::connect(
		&engine,
		&QQmlApplicationEngine::objectCreated,
		&app,
		[url](QObject* obj, const QUrl& objUrl) {
			if (!obj && url == objUrl)
				QCoreApplication::exit(-1);
		},
		Qt::QueuedConnection);
	engine.load(url);

	return app.exec();
}
