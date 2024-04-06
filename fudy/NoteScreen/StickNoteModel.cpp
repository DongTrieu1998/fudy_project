#include "StickNoteModel.h"
#include <QDebug>

StickNoteModel::StickNoteModel(QObject* parent)
    : QAbstractListModel{parent}
{
	m_items.append(
	    {true, QStringLiteral("Clean the house"), QStringLiteral("Clean the house content")});
	m_items.append(
	    {true,
	     QStringLiteral("Wash the car"),
	     QStringLiteral("Note that the TextEdit does not implement scrolling, following the "
	                    "cursor, or other behaviors specific to a look-and-feel. For example, to "
	                    "add flickable scrolling that follows the cursor:")});
}

int StickNoteModel::rowCount(const QModelIndex& parent) const
{
	if(parent.isValid())
		return 0;
	return m_items.size();
}

QVariant StickNoteModel::data(const QModelIndex& index, int role) const
{
	if(!index.isValid())
		return QVariant();

	const StickItem item = m_items.at(index.row());
	switch(role)
	{
	case EnableRole:
		return QVariant(item.enable);
		break;
	case HeaderRole:
		return QVariant(item.headerText);
		break;
	case NoteTextRole:
		return QVariant(item.noteText);
		break;
	}
	return QVariant();
}

bool StickNoteModel::setData(const QModelIndex& index, const QVariant& value, int role)
{
	StickItem item = m_items.at(index.row());
	switch(role)
	{
	case EnableRole:
		item.enable = value.toBool();
		break;
	case HeaderRole:
		item.headerText = value.toString();
		break;
	case NoteTextRole:
		item.noteText = value.toString();
		break;
	}

	if(setItemAt(index.row(), item))
	{
		emit dataChanged(index, index, QVector<int>() << role);
		return true;
	}
	return false;
}

Qt::ItemFlags StickNoteModel::flags(const QModelIndex& index) const
{
	if(!index.isValid())
		return Qt::NoItemFlags;
	return Qt::ItemIsEditable;
}

QHash<int, QByteArray> StickNoteModel::roleNames() const
{
	QHash<int, QByteArray> roles;
	roles[EnableRole] = "enable";
	roles[HeaderRole] = "header";
	roles[NoteTextRole] = "noteText";
	return roles;
}

bool StickNoteModel::setItemAt(int index, const StickItem& item)
{
	if(index < 0 || index >= m_items.size())
	{
		return false;
	}

	const StickItem& oldItem = m_items.at(index);
	if(item.enable == oldItem.enable && item.noteText == oldItem.noteText &&
	   item.headerText == oldItem.headerText)
	{
		return false;
	}

	m_items[index] = item;
	return true;
}

void StickNoteModel::removeItemAt(int index)
{
	beginRemoveRows(QModelIndex(), index, index);

	qDebug() << "Fudy Debug StickNoteModel::removedCompletedItems : index : " << index;
	m_items.removeAt(index);

	endRemoveRows();
}

void StickNoteModel::appendItem()
{
	beginInsertRows(QModelIndex(), rowCount(), rowCount());

	StickItem item;
	item.enable = false;
	m_items.append(item);

	endInsertRows();
}

void StickNoteModel::removeCompletedItems()
{
	for(int i = 0; i < m_items.count();)
	{
		if(m_items.at(i).enable)
		{
			beginRemoveRows(QModelIndex(), rowCount() - 1, rowCount() - 1);

			qDebug() << "Fudy Debug StickNoteModel::removedCompletedItems : i : " << i;
			m_items.removeAt(i);

			endRemoveRows();
		}
		else
		{
			i++;
		}
	}
}
