#include "myplugin.h"
#include "mycustomitem.h"

#include <QtQml/QtQml>

void MyPlugin::registerTypes(const char *uri)
{
    qmlRegisterType<MyCustomItem>(uri, 1, 0, "MyItem");
}
