#include "WorkspaceScreenPlugin.h"

#include <QtQml/QtQml>
#include "WorkspaceScreen.h"

void WorkspaceScreenPlugin::registerTypes(const char* uri) {
    // Register our 'WorkspaceScreen' in qml engine
    qmlRegisterType<WorkspaceScreen>(uri, 1, 0, "WorkspaceScreenCustom");
}
