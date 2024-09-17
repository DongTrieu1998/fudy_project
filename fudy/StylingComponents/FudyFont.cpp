#include "FudyFont.h"

FudyFont* FudyFont::m_instance = nullptr;

FudyFont::FudyFont(QObject* parent)
	: QObject(parent) {
	addFontPath();
}

QObject* FudyFont::createSingletonInstance(QQmlEngine* engine, QJSEngine* scriptEngine) {
	Q_UNUSED(engine);
	Q_UNUSED(scriptEngine);
	if (m_instance == nullptr) {
		m_instance = new FudyFont();
	}
	return m_instance;
}

void FudyFont::addFontPath() {
	QFontDatabase::addApplicationFont(":/font/Italianno-Regular.ttf");
	QFontDatabase::addApplicationFont(":/font/Itim-Regular.ttf");
	QFontDatabase::addApplicationFont(":/font/Jua-Regular.ttf");
	QFontDatabase::addApplicationFont(":/font/Imprima-Regular.ttf");
	QFontDatabase::addApplicationFont(":/font/Roboto/Roboto-Regular.ttf");
}

QFont prepareFont(const QString& family, qreal fontSizeF, QFont::Weight weight = QFont::Weight::Normal) {
	QFont font;
	font.setFamily(family);
	font.setPointSizeF(fontSizeF);
	font.setWeight(weight);
	font.setHintingPreference(QFont::PreferNoHinting);

	return font;
}

QFont FudyFont::text1() const {
	QFont font = prepareFont(m_textFont1, 14);
	return font;
}

QFont FudyFont::text2() const {
	QFont font = prepareFont(m_textFont2, 20);
	return font;
}

QFont FudyFont::text3() const {
	QFont font = prepareFont(m_textFont2, 10);
	return font;
}

QFont FudyFont::heading1() const {
	QFont font = prepareFont(m_headingFont, 32);
	return font;
}

QFont FudyFont::heading2() const {
	QFont font = prepareFont(m_textFont2, 14);
	return font;
}

QFont FudyFont::headingPopup() const {
	QFont font = prepareFont(m_textFont2, 12); //Figma: 24
	return font;
}

QFont FudyFont::keySmall() const {
	QFont font = prepareFont(m_keyFont, 9);
	return font;
}

QFont FudyFont::keyMedium() const {
	QFont font = prepareFont(m_keyFont, 20);
	return font;
}

QFont FudyFont::keyLarge() const {
	QFont font = prepareFont(m_keyFont, 30, QFont::Weight::Light);
	return font;
}
