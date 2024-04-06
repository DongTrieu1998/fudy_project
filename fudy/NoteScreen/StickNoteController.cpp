#include "StickNoteController.h"
#include "StickNoteModel.h"

StickNoteController::StickNoteController(QObject* parent)
    : QObject{parent}
    , m_model(new StickNoteModel())
{ }

QPointer<StickNoteModel> StickNoteController::model() const
{
	return m_model;
}

void StickNoteController::resetAllItems()
{
	if(!m_model)
	{
		return;
	}

	m_model->removeCompletedItems();
}
