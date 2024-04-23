#include "StickNoteModel.h"

#include <QDebug>

StickNoteModel::StickNoteModel(QObject* parent)
    : QAbstractListModel{parent}
{
	QSqlQuery query;
	query.exec("SELECT * FROM fudy");

	while(query.next())
	{
		StickItem item;
		item.id = query.value("id").toInt();
		item.enable = query.value("enable").toBool();
		item.header = query.value("header").toString();
		item.noteText = query.value("noteText").toString();
		item.visible = query.value("visible").toBool();
		item.xaxis = query.value("xaxis").toInt();
		item.yaxis = query.value("yaxis").toInt();

		// Thêm dữ liệu vào QVector
		m_items.append(item);
	}
}

int StickNoteModel::rowCount(const QModelIndex& parent) const
{
	if(parent.isValid())
	{
		return 0;
	}
	return m_items.size();
}

QVariant StickNoteModel::data(const QModelIndex& index, int role) const
{
	if(!index.isValid())
	{
		return QVariant();
	}

	const StickItem item = m_items.at(index.row());
	switch(role)
	{
	case IdRole:
		return QVariant(item.id);
		break;
	case EnableRole:
		return QVariant(item.enable);
		break;
	case HeaderRole:
		return QVariant(item.header);
		break;
	case NoteTextRole:
		return QVariant(item.noteText);
		break;
	case Visible:
		return QVariant(item.visible);
		break;
	case XAxis:
		return QVariant(item.xaxis);
		break;
	case YAxis:
		return QVariant(item.yaxis);
		break;
	}
	return QVariant();
}

QHash<int, QByteArray> StickNoteModel::roleNames() const
{
	QHash<int, QByteArray> roles;
	roles[IdRole] = "id";
	roles[EnableRole] = "enable";
	roles[HeaderRole] = "header";
	roles[NoteTextRole] = "noteText";
	roles[Visible] = "visible";
	roles[XAxis] = "xaxis";
	roles[YAxis] = "yaxis";
	return roles;
}

bool StickNoteModel::removeItemAt(int index)
{
	QSqlQuery query;
	query.prepare("delete from fudy where id = ?");
	query.addBindValue(m_items[index].id);

	beginRemoveRows(QModelIndex(), index, index);

	m_items.removeAt(index);

	endRemoveRows();

	return query.exec();
}

bool StickNoteModel::appendNewItem()
{
	beginInsertRows(QModelIndex(), rowCount(), rowCount());

	StickItem item;
	item.enable = false;
	item.header = "Task to do";
	item.noteText = "";
	item.visible = false;
	item.xaxis = 0;
	item.yaxis = 0;
	m_items.append(item);

	endInsertRows();

	QSqlQuery query;
	query.prepare(
	    "insert into fudy (enable,header,noteText,visible,xaxis,yaxis) values (?,?,?,?,?,?)");
	query.addBindValue(item.enable ? 1 : 0);
	query.addBindValue(item.header);
	query.addBindValue(NULL);
	query.addBindValue(item.visible ? 1 : 0);
	query.addBindValue(item.xaxis);
	query.addBindValue(item.yaxis);

	return query.exec();
}

bool StickNoteModel::removeCompletedItems()
{
	beginResetModel();
	m_items.clear();
	endResetModel();

	QSqlQuery query;
	query.prepare("DELETE FROM fudy");

	return query.exec();
}

bool StickNoteModel::updateEnabled(int id, bool enabled)
{
	m_items[id].enable = enabled;

	QSqlQuery query;
	query.prepare("update fudy set enable = ? where id = ?");
	query.addBindValue(enabled ? 1 : 0);
	query.addBindValue(m_items.at(id).id);

	return query.exec();
}

bool StickNoteModel::updateHeader(int id, QString header)
{
	m_items[id].header = header;

	QSqlQuery query;
	query.prepare("update fudy set header = ? where id = ?");
	query.addBindValue(header);
	query.addBindValue(m_items.at(id).id);

	return query.exec();
}

bool StickNoteModel::updateNoteText(int id, QString notetext)
{
	m_items[id].noteText = notetext;

	QSqlQuery query;
	query.prepare("update fudy set notetext = ? where id = ?");
	query.addBindValue(notetext);
	query.addBindValue(m_items.at(id).id);

	return query.exec();
}

bool StickNoteModel::updateVisible(int id, bool visible)
{
	m_items[id].visible = visible;

	QSqlQuery query;
	query.prepare("update fudy set visible = ? where id = ?");
	query.addBindValue(visible ? 1 : 0);
	query.addBindValue(m_items.at(id).id);

	return query.exec();
}

bool StickNoteModel::updateAxis(int id, int xaxis, int yaxis)
{
	m_items[id].xaxis = xaxis;
	m_items[id].yaxis = yaxis;

	QSqlQuery query;
	query.prepare("update fudy set xaxis = ?,yaxis = ? where id = ?");
	query.addBindValue(xaxis);
	query.addBindValue(yaxis);
	query.addBindValue(m_items.at(id).id);

	return query.exec();
}
