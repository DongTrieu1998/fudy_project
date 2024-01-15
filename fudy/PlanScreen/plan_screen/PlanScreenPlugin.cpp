#include "PlanScreenPlugin.h"

#include <QtQml/QtQml>
#include "PlanScreen.h"

void PlanScreenPlugin::registerTypes(const char* uri) {
    // Register our 'PlanScreen' in qml engine
    qmlRegisterType<PlanScreen>(uri, 1, 0, "PlanScreenCustom");
}
