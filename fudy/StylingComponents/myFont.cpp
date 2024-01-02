#include "myFont.h"

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
    QFont font = prepareFont(g_textFontFamilyName, 9);
    return font;
}

QFont MyFont::heading1() const
{
    QFont font = prepareFont(g_headingFontFamilyName, 9);
    return font;
}

QFont MyFont::keySmall() const
{
    QFont font = prepareFont(g_keyFontFamilyName, 9);
    return font;
}

QFont MyFont::keyMedium() const
{
    QFont font = prepareFont(g_keyFontFamilyName, 9);
    return font;
}

QFont MyFont::keyLarge() const
{
    QFont font = prepareFont(g_keyFontFamilyName, 9);
    return font;
}

MyFont::MyFont(QObject *parent): QObject(parent)
{}
