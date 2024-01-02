#ifndef MYCOLOR_H
#define MYCOLOR_H

#include <QObject>
#include <QColor>
#include <QQmlEngine>
#include <QJSEngine>

class MyColor : public QObject
{
    Q_OBJECT
    Q_PROPERTY(QColor layer READ layer CONSTANT)
    Q_PROPERTY(QColor accent READ accent CONSTANT)
    Q_PROPERTY(QColor lightAccent READ lightAccent CONSTANT)
    Q_PROPERTY(QColor hover READ hover CONSTANT)

public:
    explicit MyColor(QObject *parent = nullptr);

    QColor layer() const;

    QColor accent() const;

    QColor lightAccent() const;

    QColor hover() const;

private:
    const QRgb g_layerColor = 0xfffffff;
    const QRgb g_accentColor = 0xfffffff;
    const QRgb g_lightAccentColor = 0xfffffff;
    const QRgb g_hoverColor = 0xfffffff;
};

#endif // MYCOLOR_H
