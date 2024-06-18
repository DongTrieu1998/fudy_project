#ifndef FUDYCOLOR_H
#define FUDYCOLOR_H

#include <QColor>
#include <QJSEngine>
#include <QObject>
#include <QQmlEngine>

class FudyColor : public QObject {
	Q_OBJECT
	Q_PROPERTY(QColor background1 READ background1 CONSTANT)
	Q_PROPERTY(QColor background2 READ background2 CONSTANT)
	Q_PROPERTY(QColor background3 READ background3 CONSTANT)
	Q_PROPERTY(QColor background4 READ background4 CONSTANT)
	Q_PROPERTY(QColor background5 READ background5 CONSTANT)
	Q_PROPERTY(QColor background6 READ background6 CONSTANT)
	Q_PROPERTY(QColor background7 READ background7 CONSTANT)
	Q_PROPERTY(QColor background8 READ background8 CONSTANT)
	Q_PROPERTY(QColor background9 READ background9 CONSTANT)

	Q_PROPERTY(QColor layer1 READ layer1 CONSTANT)
	Q_PROPERTY(QColor layer2 READ layer2 CONSTANT)
	Q_PROPERTY(QColor layer3 READ layer3 CONSTANT)
	Q_PROPERTY(QColor layer4 READ layer4 CONSTANT)
	Q_PROPERTY(QColor layer5 READ layer5 CONSTANT)
	Q_PROPERTY(QColor layer6 READ layer6 CONSTANT)
	Q_PROPERTY(QColor layer7 READ layer7 CONSTANT)
	Q_PROPERTY(QColor layer8 READ layer8 CONSTANT)

	Q_PROPERTY(QColor fontColor1 READ fontColor1 CONSTANT)
	Q_PROPERTY(QColor fontColor2 READ fontColor2 CONSTANT)
	Q_PROPERTY(QColor fontColor3 READ fontColor3 CONSTANT)

	explicit FudyColor(QObject* parent = nullptr);
	static FudyColor* m_instance;

public:
	static QObject* createSingletonInstance(QQmlEngine* engine, QJSEngine* scriptEngine);

	QColor background1() const;
	QColor background2() const;
	QColor background3() const;
	QColor background4() const;
	QColor background5() const;
	QColor background6() const;
	QColor background7() const;
	QColor background8() const;

	QColor layer1() const;
	QColor layer2() const;
	QColor layer3() const;
	QColor layer4() const;
	QColor layer5() const;
	QColor layer6() const;
	QColor layer7() const;
	QColor layer8() const;

	QColor fontColor1() const;
	QColor fontColor2() const;
	QColor fontColor3() const;

	QColor background9() const;

private:
	//Background color
	const QRgb m_background1 = 0xFEC8D8;
	const QRgb m_background2 = 0x1873D3;
	const QRgb m_background3 = 0xFFFFB1;
	const QRgb m_background4 = 0x619DDD;
	const QRgb m_background5 = 0x528DCB;
	const QRgb m_background6 = 0xFFDE00;
	const QRgb m_background7 = 0xF8CBB8;
	const QRgb m_background8 = 0xFF9AA2;
	const QRgb m_background9 = 0xF5F5F5;

	//Layer color
	const QRgb m_layer1 = 0x619DDD;
	const QRgb m_layer2 = 0x528DCB;
	const QRgb m_layer3 = 0xF8CBB8;
	const QRgb m_layer4 = 0xD9D9D9;
	const QRgb m_layer5 = 0x000000;
	const QRgb m_layer6 = 0xF5F5F5;
	const QRgb m_layer7 = 0xFF9AA2;
	const QRgb m_layer8 = 0xE51818;

	//Text color
	const QRgb m_fontColor1 = 0xFFFFFF;
	const QRgb m_fontColor2 = 0x000000;
	const QRgb m_fontColor3 = 0xFFDE00;

	//Components color
};

#endif // FUDYCOLOR_H
