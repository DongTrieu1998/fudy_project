#include "TodoScreenPlugin.h"

#include <QtQml/QtQml>
#include "TodoScreen.h"

void TodoScreenPlugin::registerTypes(const char* uri) {
    // Register our 'TodoScreen' in qml engine
    qmlRegisterType<TodoScreen>(uri, 1, 0, "TodoScreenCustom");
}
