#include "myColor.h"

MyColor *MyColor::m_instance = nullptr;

MyColor::MyColor(QObject *parent)
{}

QObject *MyColor::createSingletonInstance(QQmlEngine *engine, QJSEngine *scriptEngine)
{
    Q_UNUSED(engine);
    Q_UNUSED(scriptEngine);
    if (m_instance == nullptr) {
        m_instance = new MyColor();
    }
    return m_instance;
}

QColor MyColor::background1() const
{
    return QColor::fromRgb(m_background1);
}

QColor MyColor::background2() const
{
    return QColor::fromRgb(m_background2);
}

QColor MyColor::background3() const
{
    return QColor::fromRgb(m_background3);
}

QColor MyColor::background4() const
{
    return QColor::fromRgb(m_background4);
}

QColor MyColor::background5() const
{
    return QColor::fromRgb(m_background5);
}

QColor MyColor::background6() const
{
    return QColor::fromRgb(m_background6);
}

QColor MyColor::layer1() const
{
    return QColor::fromRgb(m_layer1);
}

QColor MyColor::layer2() const
{
    return QColor::fromRgb(m_layer2);
}

QColor MyColor::layer3() const
{
    return QColor::fromRgb(m_layer3);
}

QColor MyColor::layer4() const
{
    return QColor::fromRgb(m_layer4);
}

QColor MyColor::fontColor1() const
{
    return QColor::fromRgb(m_fontColor1);
}

QColor MyColor::fontColor2() const
{
    return QColor::fromRgb(m_fontColor2);
}
