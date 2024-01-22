#ifndef NOTESCREENPLUGIN_H
#define NOTESCREENPLUGIN_H

#include <QtQml/QQmlExtensionPlugin>
#include <QQmlEngine>
#include <QPointer>

/**
 * @brief The MyPlugin class. Simple qml plugin example.
 */

class NoteScreenPlugin: public QQmlExtensionPlugin
{
	Q_OBJECT
	Q_PLUGIN_METADATA(IID "note_screen/1.0")
public:

	/**
	 * @brief registerTypes Overrided function that should register all
	 * C++ classes exported by this plugin.
	 * @param uri           Plugin uri.
	 */
	void registerTypes(const char* uri) override;
	void initializeEngine(QQmlEngine *engine, const char *uri) final;
private:
};

#endif // NOTESCREENPLUGIN_H
