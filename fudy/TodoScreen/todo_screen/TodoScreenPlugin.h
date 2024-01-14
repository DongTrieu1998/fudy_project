#ifndef TODOSCREENPLUGIN_H
#define TODOSCREENPLUGIN_H

#include <QtQml/QQmlExtensionPlugin>

/**
 * @brief The MyPlugin class. Simple qml plugin example.
 */

class TodoScreenPlugin: public QQmlExtensionPlugin {
    Q_OBJECT
    Q_PLUGIN_METADATA(IID "todo_screen/1.0")
public:

    /**
     * @brief registerTypes Overrided function that should register all
     * C++ classes exported by this plugin.
     * @param uri           Plugin uri.
     */
    void registerTypes(const char* uri) override;
};

#endif // TODOSCREENPLUGIN_H
