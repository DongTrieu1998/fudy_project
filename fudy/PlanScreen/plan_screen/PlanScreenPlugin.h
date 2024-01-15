#ifndef PLANSCREENPLUGIN_H
#define PLANSCREENPLUGIN_H

#include <QtQml/QQmlExtensionPlugin>

/**
 * @brief The MyPlugin class. Simple qml plugin example.
 */

class PlanScreenPlugin: public QQmlExtensionPlugin {
    Q_OBJECT
    Q_PLUGIN_METADATA(IID "plan_screen/1.0")
public:

    /**
     * @brief registerTypes Overrided function that should register all
     * C++ classes exported by this plugin.
     * @param uri           Plugin uri.
     */
    void registerTypes(const char* uri) override;
};

#endif // PLANSCREENPLUGIN_H
