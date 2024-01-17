#include "FudyColor.h"

FudyColor *FudyColor::m_instance = nullptr;

FudyColor::FudyColor(QObject *parent)
{}

QObject *FudyColor::createSingletonInstance(QQmlEngine *engine, QJSEngine *scriptEngine)
{
    Q_UNUSED(engine);
    Q_UNUSED(scriptEngine);
    if (m_instance == nullptr) {
        m_instance = new FudyColor();
    }
    return m_instance;
}

QColor FudyColor::background1() const
{
    return QColor::fromRgb(m_background1);
}

QColor FudyColor::background2() const
{
    return QColor::fromRgb(m_background2);
}

QColor FudyColor::background3() const
{
    return QColor::fromRgb(m_background3);
}

QColor FudyColor::background4() const
{
    return QColor::fromRgb(m_background4);
}

QColor FudyColor::background5() const
{
    return QColor::fromRgb(m_background5);
}

QColor FudyColor::background6() const
{
    return QColor::fromRgb(m_background6);
}

QColor FudyColor::layer1() const
{
    return QColor::fromRgb(m_layer1);
}

QColor FudyColor::layer2() const
{
    return QColor::fromRgb(m_layer2);
}

QColor FudyColor::layer3() const
{
    return QColor::fromRgb(m_layer3);
}

QColor FudyColor::layer4() const
{
    return QColor::fromRgb(m_layer4);
}

QColor FudyColor::layer5() const
{
    return QColor::fromRgb(m_layer5);
}

QColor FudyColor::fontColor1() const
{
    return QColor::fromRgb(m_fontColor1);
}

QColor FudyColor::fontColor2() const
{
    return QColor::fromRgb(m_fontColor2);
}

QColor FudyColor::fontColor3() const
{
    return QColor::fromRgb(m_fontColor3);
}
