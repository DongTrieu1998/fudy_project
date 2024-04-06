#ifndef STICKNOTECONTROLLER_H
#define STICKNOTECONTROLLER_H

#include <QObject>
#include <QPointer>

class StickNoteModel;

class StickNoteController : public QObject
{
	Q_OBJECT
public:
	explicit StickNoteController(QObject *parent = nullptr);

	QPointer<StickNoteModel> model() const;
	Q_INVOKABLE void resetAllItems();

private:
	QPointer<StickNoteModel> m_model;
};

#endif // STICKNOTECONTROLLER_H
