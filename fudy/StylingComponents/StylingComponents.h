#ifndef MYPLUGIN_H
#define MYPLUGIN_H

#include <QtQml/QQmlExtensionPlugin>

class MyPlugin : public QQmlExtensionPlugin
{
    Q_OBJECT
    Q_PLUGIN_METADATA(IID "fudy.styling.components.com")

public:
    // QQmlTypesExtensionInterface interface
    void registerTypes(const char *uri) override;
};

#endif // MYPLUGIN_H
