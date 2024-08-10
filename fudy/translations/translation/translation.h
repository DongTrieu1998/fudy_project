#ifndef TRANSLATOR_H
#define TRANSLATOR_H

#include <QGuiApplication>
#include <QObject>
#include <QTranslator>

enum Languages {
	Vietnamese = 84,
	English = 44,
	Chinese = 86,
	Japanese = 81,
};

class Translator : public QObject {
	Q_OBJECT
	Q_PROPERTY(QString language READ language NOTIFY languageChanged)
	Q_PROPERTY(int vi_VN READ vi_VN CONSTANT)
	Q_PROPERTY(int en_US READ en_US CONSTANT)
	Q_PROPERTY(int zh_CN READ zh_CN CONSTANT)
	Q_PROPERTY(int ja_JP READ ja_JP CONSTANT)

public:
	explicit Translator(QObject* parent = nullptr);

	Q_INVOKABLE void setLanguage(int lang);
	QString language() const;

	int vi_VN() const;
	int en_US() const;
	int zh_CN() const;
	int ja_JP() const;

signals:
	void languageChanged();

private:
	QTranslator m_translator;
	QGuiApplication* m_App;
	QString m_language;

	const int m_vie = Languages::Vietnamese;
	const int m_eng = Languages::English;
	const int m_chi = Languages::Chinese;
	const int m_jpn = Languages::Japanese;
};

#endif // TRANSLATOR_H
