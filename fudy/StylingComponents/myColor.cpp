#include "myColor.h"

MyColor::MyColor(QObject *parent)
{}

QColor MyColor::layer() const
{
    return QColor::fromRgb(g_layerColor);
}

QColor MyColor::accent() const
{
    return QColor::fromRgb(g_accentColor);
}

QColor MyColor::lightAccent() const
{
    return QColor::fromRgb(g_lightAccentColor);
}

QColor MyColor::hover() const
{
    return QColor::fromRgb(g_hoverColor);
}
