#include "FudyColor.h"

FudyColor* FudyColor::m_instance = nullptr;

FudyColor::FudyColor(QObject* parent) { }

QObject* FudyColor::createSingletonInstance(QQmlEngine* engine, QJSEngine* scriptEngine) {
	Q_UNUSED(engine);
	Q_UNUSED(scriptEngine);
	if (m_instance == nullptr) {
		m_instance = new FudyColor();
	}
	return m_instance;
}

QColor FudyColor::background1() const {
	return QColor::fromRgb(m_background1);
}

QColor FudyColor::background2() const {
	return QColor::fromRgb(m_background2);
}

QColor FudyColor::background3() const {
	return QColor::fromRgb(m_background3);
}

QColor FudyColor::background4() const {
	return QColor::fromRgb(m_background4);
}

QColor FudyColor::background5() const {
	return QColor::fromRgb(m_background5);
}

QColor FudyColor::background6() const {
	return QColor::fromRgb(m_background6);
}

QColor FudyColor::background7() const
{
	return QColor::fromRgb(m_background7);
}

QColor FudyColor::background8() const
{
	return QColor::fromRgb(m_background8);
}

QColor FudyColor::background9() const
{
	return QColor::fromRgb(m_background9);
}

QColor FudyColor::background10() const
{
	return QColor::fromRgb(m_background10);
}

QColor FudyColor::layer1() const {
	return QColor::fromRgb(m_layer1);
}

QColor FudyColor::layer2() const {
	return QColor::fromRgb(m_layer2);
}

QColor FudyColor::layer3() const {
	return QColor::fromRgb(m_layer3);
}

QColor FudyColor::layer4() const {
	return QColor::fromRgb(m_layer4);
}

QColor FudyColor::layer5() const {
	return QColor::fromRgb(m_layer5);
}

QColor FudyColor::layer6() const
{
	return QColor::fromRgb(m_layer6);
}

QColor FudyColor::layer7() const
{
	return QColor::fromRgb(m_layer7);
}

QColor FudyColor::layer8() const
{
	return QColor::fromRgb(m_layer8);
}

QColor FudyColor::layer9() const
{
	return QColor::fromRgb(m_layer9);
}

QColor FudyColor::layer10() const
{
	return QColor::fromRgb(m_layer10);
}

QColor FudyColor::layer11() const
{
	return QColor::fromRgb(m_layer11);
}

QColor FudyColor::fontColor1() const {
	return QColor::fromRgb(m_fontColor1);
}

QColor FudyColor::fontColor2() const {
	return QColor::fromRgb(m_fontColor2);
}

QColor FudyColor::fontColor3() const {
	return QColor::fromRgb(m_fontColor3);
}

QColor FudyColor::fontColor4() const {
	return QColor::fromRgb(m_fontColor4);
}
