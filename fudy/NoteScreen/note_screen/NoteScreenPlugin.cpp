#include "NoteScreenPlugin.h"

#include <QtQml/QtQml>
#include <QPointer>

#include "NoteScreen.h"
#include "StickNoteModel.h"
#include "StickNoteController.h"

void NoteScreenPlugin::registerTypes(const char* uri) {
	// Register our 'NoteScreen' in qml engine
	qmlRegisterType<NoteScreen>(uri, 1, 0, "NoteScreenCustom");
}

void NoteScreenPlugin::initializeEngine(QQmlEngine *engine, const char *uri)
{
	Q_UNUSED(uri);
	QPointer<StickNoteController> stickNoteController = new StickNoteController();
	engine->rootContext()->setContextProperty("StickNoteModel", stickNoteController->model());
	engine->rootContext()->setContextProperty("StickNoteController", stickNoteController);
}
