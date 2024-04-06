#ifndef FUDYFONT_H
#define FUDYFONT_H

#include <QFont>
#include <QFontDatabase>
#include <QJSEngine>
#include <QObject>
#include <QQmlEngine>

class FudyFont : public QObject
{
	Q_OBJECT
	Q_PROPERTY(QFont text1 READ text1 CONSTANT)
	Q_PROPERTY(QFont text2 READ text1 CONSTANT)
	Q_PROPERTY(QFont text3 READ text3 CONSTANT)
	Q_PROPERTY(QFont heading1 READ heading1 CONSTANT)
	Q_PROPERTY(QFont headingPopup READ headingPopup CONSTANT)
	Q_PROPERTY(QFont keySmall READ keySmall CONSTANT)
	Q_PROPERTY(QFont keyMedium READ keyMedium CONSTANT)
	Q_PROPERTY(QFont keyLarge READ keyLarge CONSTANT)

	explicit FudyFont(QObject* parent = nullptr);
	static FudyFont* m_instance;

public:
	static QObject* createSingletonInstance(QQmlEngine* engine, QJSEngine* scriptEngine);
	void addFontPath();
	QFont text1() const;
	QFont text2() const;
	QFont text3() const;

	QFont heading1() const;
	QFont headingPopup() const;

	QFont keySmall() const;
	QFont keyMedium() const;
	QFont keyLarge() const;

private:
	const QString m_headingFont = "Italianno";
	const QString m_textFont1 = "Itim";
	const QString m_textFont2 = "Imprima";
	const QString m_keyFont = "Jua";
};

#endif // FUDYFONT_H
