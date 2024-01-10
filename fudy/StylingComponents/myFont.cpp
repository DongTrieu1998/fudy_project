#include "myFont.h"

MyFont *MyFont::m_instance = nullptr;

MyFont::MyFont(QObject *parent): QObject(parent)
{}

QObject *MyFont::createSingletonInstance(QQmlEngine *engine, QJSEngine *scriptEngine)
{
    Q_UNUSED(engine);
    Q_UNUSED(scriptEngine);
    if (m_instance == nullptr) {
        m_instance = new MyFont();
    }
    return m_instance;
}

QFont prepareFont(const QString &family,
                  qreal fontSizeF,
                  int weight = QFont::PreferNoHinting)
{
    QFont font;
    font.setFamily(family);
    font.setPointSizeF(fontSizeF);
    font.setWeight(weight);
    font.setHintingPreference(QFont::PreferNoHinting);

    return font;
}

QFont MyFont::text1() const
{
    QFont font = prepareFont(m_textFont, 9);
    return font;
}

QFont MyFont::heading1() const
{
    QFont font = prepareFont(m_headingFont, 9);
    return font;
}

QFont MyFont::keySmall() const
{
    QFont font = prepareFont(m_keyFont, 9);
    return font;
}

QFont MyFont::keyMedium() const
{
    QFont font = prepareFont(m_keyFont, 9);
    return font;
}

QFont MyFont::keyLarge() const
{
    QFont font = prepareFont(m_keyFont, 9);
    return font;
}
