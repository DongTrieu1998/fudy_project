#ifndef TODOSCREEN_H
#define TODOSCREEN_H
#include <QObject>

class TodoScreen : public QObject
{
    Q_OBJECT
public:
    explicit TodoScreen(QObject *parent = nullptr);

signals:

};

#endif // TODOSCREEN_H
