#ifndef PLANSCREEN_H
#define PLANSCREEN_H
#include <QObject>

class PlanScreen : public QObject
{
    Q_OBJECT
public:
    explicit PlanScreen(QObject *parent = nullptr);

signals:

};

#endif // PLANSCREEN_H
