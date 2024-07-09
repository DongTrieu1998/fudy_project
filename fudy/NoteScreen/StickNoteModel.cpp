#include "StickNoteModel.h"

#include <QLoggingCategory>
#include <QSqlError>

#include "../FudyUtils.h"

namespace F_LOG {

Q_LOGGING_CATEGORY(sticknoteModel, "fudy.sticknote")

}

void StickNoteModel::queryData() {
	m_items.clear();
	QSqlQuery query;
	query.prepare("SELECT * FROM " + db_utils::cTableName);
	if (!query.exec()) {
		qCCritical(F_LOG::sticknoteModel) << "Error executing query:" << query.lastError().text();
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

		m_items.append(item);
	}
}

StickNoteModel::StickNoteModel(QObject* parent)
	: QAbstractListModel{parent} {
	queryData();
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
		qCCritical(F_LOG::sticknoteModel) << "Error executing query:" << query.lastError().text();
		return false;
	}

	qCInfo(F_LOG::sticknoteModel) << "Table" << db_utils::cTableName << "remove item at" << index
							  << "successfully";

	queryData();
	return true;
}

bool StickNoteModel::appendNewItem() {
	beginInsertRows(QModelIndex(), rowCount(), rowCount());

	m_items.append(StickItem{});

	endInsertRows();

	QSqlQuery query;
	query.prepare("insert into " + db_utils::cTableName +
				  " (enabled,header,noteText,visible,xaxis,yaxis) values (?,?,?,?,?,?)");
	query.addBindValue(m_items.last().enabled);
	query.addBindValue(m_items.last().header);
	query.addBindValue(m_items.last().noteText);
	query.addBindValue(m_items.last().visible);
	query.addBindValue(m_items.last().xaxis);
	query.addBindValue(m_items.last().yaxis);

	if (!query.exec()) {
		qCCritical(F_LOG::sticknoteModel) << "Error executing query:" << query.lastError().text();
		return false;
	}

	qCInfo(F_LOG::sticknoteModel) << "Table" << db_utils::cTableName << "append new item successfully";

	queryData();
	return true;
}

bool StickNoteModel::removeCompletedItems() {
	beginResetModel();
	m_items.clear();
	endResetModel();

	QSqlQuery query;
	query.prepare("DELETE FROM " + db_utils::cTableName);

	if (!query.exec()) {
		qCCritical(F_LOG::sticknoteModel) << "Error executing query:" << query.lastError().text();
		return false;
	}

	qCInfo(F_LOG::sticknoteModel) << "Table" << db_utils::cTableName
							  << "removed all items successfully";

	queryData();
	return true;
}

//TODO: Refector this function as it is called multiple time
bool StickNoteModel::updateProperty(const QString& tableName, const QString& property, int id, const QVariant& value) {
	QSqlQuery query;
	query.prepare(QString("update %1 set %2 = ? where id = ?").arg(tableName).arg(property));

	query.addBindValue(value);
	query.addBindValue(id);

	if (!query.exec()) {
		qCCritical(F_LOG::sticknoteModel) << "Error executing query:" << query.lastError().text();
		return false;
	}

	qCInfo(F_LOG::sticknoteModel) << "Table" << tableName << "updated property" << property
								  << "at item" << id << "successfully";
	queryData();
	return true;
}

bool StickNoteModel::updateEnabled(int index, bool enabled) {
	return updateProperty(
		db_utils::cTableName, fudy_props_helper::to_string(FudyProperties::Enabled), m_items[index].id, enabled);
}

bool StickNoteModel::updateHeader(int index, QString header) {
	return updateProperty(
		db_utils::cTableName, fudy_props_helper::to_string(FudyProperties::Header), m_items[index].id, header);
}

bool StickNoteModel::updateNoteText(int index, QString notetext) {
	return updateProperty(
		db_utils::cTableName, fudy_props_helper::to_string(FudyProperties::NoteText), m_items[index].id, notetext);
}

bool StickNoteModel::updateVisible(int index, bool visible) {
	return updateProperty(
		db_utils::cTableName, fudy_props_helper::to_string(FudyProperties::Visible), m_items[index].id, visible);
}

bool StickNoteModel::updateAxis(int index, int xaxis, int yaxis) {
	return updateProperty(
			   db_utils::cTableName, fudy_props_helper::to_string(FudyProperties::XAxis), m_items[index].id, xaxis) &&
		   updateProperty(db_utils::cTableName, fudy_props_helper::to_string(FudyProperties::YAxis), m_items[index].id, yaxis);
}
