#ifndef FUDYFONT_H
#define FUDYFONT_H

#include <QFont>
#include <QFontDatabase>
#include <QJSEngine>
#include <QObject>
#include <QQmlEngine>

class FudyFont : public QObject {
	Q_OBJECT
	Q_PROPERTY(QFont text1 READ text1 CONSTANT FINAL)
	Q_PROPERTY(QFont text2 READ text1 CONSTANT FINAL)
	Q_PROPERTY(QFont text3 READ text3 CONSTANT FINAL)
	Q_PROPERTY(QFont heading1 READ heading1 CONSTANT FINAL)
	Q_PROPERTY(QFont heading2 READ heading2 CONSTANT FINAL)
	Q_PROPERTY(QFont headingPopup READ headingPopup CONSTANT FINAL)
	Q_PROPERTY(QFont keySmall READ keySmall CONSTANT FINAL)
	Q_PROPERTY(QFont keyMedium READ keyMedium CONSTANT FINAL)
	Q_PROPERTY(QFont keyLarge READ keyLarge CONSTANT FINAL)

	explicit FudyFont(QObject* parent = nullptr);
	static FudyFont* m_instance;

public:
	static QObject* createSingletonInstance(QQmlEngine* engine, QJSEngine* scriptEngine);
	void addFontPath();
	QFont text1() const;
	QFont text2() const;
	QFont text3() const;

	QFont heading1() const;
	QFont heading2() const;
	QFont headingPopup() const;

	QFont keySmall() const;
	QFont keyMedium() const;
	QFont keyLarge() const;

private:
	const QString m_headingFont = "Italianno";
	const QString m_textFont1 = "Itim";
	const QString m_textFont2 = "Imprima";
	const QString m_keyFont = "Itim";
};

#endif // FUDYFONT_H
