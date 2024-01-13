#ifndef MYFONT_H
#define MYFONT_H

#include <QObject>
#include <QQmlEngine>
#include <QJSEngine>
#include <QFont>
#include <QFontDatabase>

class MyFont : public QObject
{
    Q_OBJECT
    Q_PROPERTY(QFont text1 READ text1 CONSTANT)
    Q_PROPERTY(QFont heading1 READ heading1 CONSTANT)
    Q_PROPERTY(QFont keySmall READ keySmall CONSTANT)
    Q_PROPERTY(QFont keyMedium READ keyMedium CONSTANT)
    Q_PROPERTY(QFont keyLarge READ keyLarge CONSTANT)

    explicit MyFont(QObject *parent = nullptr);
    static MyFont *m_instance;

public:
    static QObject* createSingletonInstance(QQmlEngine *engine,  QJSEngine *scriptEngine);
    void addFontPath();
    QFont text1() const;

    QFont heading1() const;

    QFont keySmall() const;
    QFont keyMedium() const;
    QFont keyLarge() const;
private:
    const QString m_headingFont = "Italianno";
    const QString m_textFont = "Itim";
    const QString m_keyFont = "Jua";
};

#endif // MYFONT_H
