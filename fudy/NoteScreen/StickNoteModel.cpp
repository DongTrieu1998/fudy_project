#include "StickNoteModel.h"

#include <QLoggingCategory>
#include <QSqlError>

#include "../FudyUtils.h"

namespace L {

Q_LOGGING_CATEGORY(sticknoteModel, "fudy.sticknote")

}

using FD = FudyProperties;
StickNoteModel::StickNoteModel(QObject* parent)
	: QAbstractListModel{parent} {
	QSqlQuery query;
	query.prepare("SELECT * FROM " + db_utils::cTableName);
	if (!query.exec()) {
		qCCritical(L::sticknoteModel) << "Error executing query:" << query.lastError().text();
	}

	while (query.next()) {
		StickItem item;
		item.id = query.value("id").toInt();
		item.enabled = query.value("enabled").toBool();
		item.header = query.value("header").toString();
		item.noteText = query.value("noteText").toString();
		item.visible = query.value("visible").toBool();
		item.xaxis = query.value("xaxis").toInt();
		item.yaxis = query.value("yaxis").toInt();

		// Thêm dữ liệu vào QVector
		m_items.append(item);
	}
}

int StickNoteModel::rowCount(const QModelIndex& parent) const {
	if (parent.isValid()) {
		return 0;
	}
	return m_items.size();
}

QVariant StickNoteModel::data(const QModelIndex& index, int role) const {
	if (!index.isValid()) {
		return QVariant();
	}

	const StickItem item = m_items.at(index.row());
	switch (role) {
	case IdRole:
		return QVariant(item.id);
		break;
	case EnableRole:
		return QVariant(item.enabled);
		break;
	case HeaderRole:
		return QVariant(item.header);
		break;
	case NoteTextRole:
		return QVariant(item.noteText);
		break;
	case VisibleRole:
		return QVariant(item.visible);
		break;
	case XAxisRole:
		return QVariant(item.xaxis);
		break;
	case YAxisRole:
		return QVariant(item.yaxis);
		break;
	}
	return QVariant();
}

QHash<int, QByteArray> StickNoteModel::roleNames() const {
	QHash<int, QByteArray> roles;
	roles[IdRole] = "id";
	roles[EnableRole] = "enabled";
	roles[HeaderRole] = "header";
	roles[NoteTextRole] = "noteText";
	roles[VisibleRole] = "visible";
	roles[XAxisRole] = "xaxis";
	roles[YAxisRole] = "yaxis";
	return roles;
}

bool StickNoteModel::removeItemAt(int index) {
	QSqlQuery query;
	query.prepare("delete from " + db_utils::cTableName + " where id = ?");
	query.addBindValue(m_items[index].id);

	beginRemoveRows(QModelIndex(), index, index);

	m_items.removeAt(index);

	endRemoveRows();

	if (!query.exec()) {
		qCCritical(L::sticknoteModel) << "Error executing query:" << query.lastError().text();
		return false;
	}

	qCInfo(L::sticknoteModel) << "Table" << db_utils::cTableName << "remove item at" << index
							  << "successfully";

	return true;
}

bool StickNoteModel::appendNewItem() {
	beginInsertRows(QModelIndex(), rowCount(), rowCount());

	StickItem item;
	item.enabled = false;
	item.header = "Task to do";
	item.noteText = "";
	item.visible = false;
	item.xaxis = 0;
	item.yaxis = 0;
	m_items.append(item);

	endInsertRows();

	QSqlQuery query;
	query.prepare("insert into " + db_utils::cTableName +
				  " (enabled,header,noteText,visible,xaxis,yaxis) values (?,?,?,?,?,?)");
	query.addBindValue(item.enabled ? 1 : 0);
	query.addBindValue(item.header);
	query.addBindValue(NULL);
	query.addBindValue(item.visible ? 1 : 0);
	query.addBindValue(item.xaxis);
	query.addBindValue(item.yaxis);

	if (!query.exec()) {
		qCCritical(L::sticknoteModel) << "Error executing query:" << query.lastError().text();
		return false;
	}

	qCInfo(L::sticknoteModel) << "Table" << db_utils::cTableName << "append new item successfully";

	return true;
}

bool StickNoteModel::removeCompletedItems() {
	beginResetModel();
	m_items.clear();
	endResetModel();

	QSqlQuery query;
	query.prepare("DELETE FROM " + db_utils::cTableName);

	if (!query.exec()) {
		qCCritical(L::sticknoteModel) << "Error executing query:" << query.lastError().text();
		return false;
	}

	qCInfo(L::sticknoteModel) << "Table" << db_utils::cTableName
							  << "removed all items successfully";

	return true;
}

bool StickNoteModel::updateProperty(QString tableName, QString property, int id, QVariant value) {
	QSqlQuery query;
	query.prepare("update " + tableName + " set " + property + " = ? where id = ?");

	if (value.canConvert<int>()) {
		int intValue = value.toInt();
		query.addBindValue(intValue);
		query.addBindValue(m_items.at(id).id);
	} else if (value.canConvert<QString>()) {
		QString stringValue = value.toString();
		query.addBindValue(stringValue);
		query.addBindValue(m_items.at(id).id);
	} else {
		qCCritical(L::sticknoteModel) << "Unsupported type for value";
		return false;
	}

	if (!query.exec()) {
		qCCritical(L::sticknoteModel) << "Error executing query:" << query.lastError().text();
		return false;
	}

	qCInfo(L::sticknoteModel) << "Table" << db_utils::cTableName << "updated property" << property
							  << "at item" << id << "successfully";
	return true;
}

bool StickNoteModel::updateEnabled(int id, bool enabled) {
	m_items[id].enabled = enabled;

	return updateProperty(
		db_utils::cTableName, fudy_props_helper::to_string(FD::Enabled), id, enabled);
}

bool StickNoteModel::updateHeader(int id, QString header) {
	m_items[id].header = header;

	return updateProperty(
		db_utils::cTableName, fudy_props_helper::to_string(FD::Header), id, header);
}

bool StickNoteModel::updateNoteText(int id, QString notetext) {
	m_items[id].noteText = notetext;

	return updateProperty(
		db_utils::cTableName, fudy_props_helper::to_string(FD::NoteText), id, notetext);
}

bool StickNoteModel::updateVisible(int id, bool visible) {
	m_items[id].visible = visible;

	return updateProperty(
		db_utils::cTableName, fudy_props_helper::to_string(FD::Visible), id, visible);
}

bool StickNoteModel::updateAxis(int id, int xaxis, int yaxis) {
	m_items[id].xaxis = xaxis;
	m_items[id].yaxis = yaxis;

	return updateProperty(
			   db_utils::cTableName, fudy_props_helper::to_string(FD::XAxis), id, xaxis) &&
		   updateProperty(db_utils::cTableName, fudy_props_helper::to_string(FD::YAxis), id, yaxis);
}
