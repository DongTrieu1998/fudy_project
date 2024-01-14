#include "NoteScreenPlugin.h"

#include <QtQml/QtQml>
#include "NoteScreen.h"

void NoteScreenPlugin::registerTypes(const char* uri) {
    // Register our 'NoteScreen' in qml engine
    qmlRegisterType<NoteScreen>(uri, 1, 0, "NoteScreenCustom");
}
