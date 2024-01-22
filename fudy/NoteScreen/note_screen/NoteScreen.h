#ifndef NOTESCREEN_H
#define NOTESCREEN_H
#include <QObject>

class NoteScreen : public QObject
{
	Q_OBJECT
public:
	explicit NoteScreen(QObject *parent = nullptr);

signals:

};

#endif // NOTESCREEN_H
