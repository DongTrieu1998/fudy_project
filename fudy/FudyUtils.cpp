#include "FudyUtils.h"

#include <QFile>
#include <QGuiApplication>
#include <QLoggingCategory>
#include <QSqlError>

namespace F_LOG {

Q_LOGGING_CATEGORY(database, "fudy.database")

}

const QString cDBName = QStringLiteral("fudyDB.db");
const QString cTableSchema = "id INTEGER PRIMARY KEY AUTOINCREMENT, "
							 "enabled INTEGER, "
							 "header TEXT NOT NULL DEFAULT ('Task to do ...'), "
							 "notetext TEXT, "
							 "visible INTEGER, "
							 "xaxis INTEGER, "
							 "yaxis INTEGER";

namespace {

using FD = FudyProperties;
static const QHash<FD, QString> fudyProperties = {
	{FD::Id, "id"},
	{FD::Enabled, "enabled"},
	{FD::Header, "header"},
	{FD::NoteText, "noteText"},
	{FD::Visible, "visible"},
	{FD::XAxis, "xaxis"},
	{FD::YAxis, "yaxis"},
};

bool createTable(QSqlDatabase db, const QString& tableName, const QString& tableSchema) {
	QSqlQuery query(db);

	QString createTableQuery =
		QString("CREATE TABLE IF NOT EXISTS %1 (%2)").arg(tableName).arg(tableSchema);

	if (!query.prepare(createTableQuery)) {
		qCCritical(F_LOG::database) << "Error preparing query:" << query.lastError().text();
		return false;
	}

	if (!query.exec()) {
		qCCritical(F_LOG::database) << "Error executing query:" << query.lastError().text();
		return false;
	}

	qCInfo(F_LOG::database) << "Table" << tableName << "created successfully";
	return true;
}

} // namespace

bool db_utils::createDatabase(const QGuiApplication& app) {
	const QFile databaseFile(app.applicationDirPath() + "/" + cDBName);
	qCWarning(F_LOG::database) << "Database existed status : " << databaseFile.exists();

	QSqlDatabase db = QSqlDatabase::addDatabase("QSQLITE");
	db.setDatabaseName(app.applicationDirPath() + "/" + cDBName);

	if (!db.open()) {
		qCCritical(F_LOG::database) << "Error: Unable to open the database";
		return false;
	}

	if (!createTable(db, cTableName, cTableSchema)) {
		qCCritical(F_LOG::database) << "Error: Unable to create table";
		return false;
	}

	qCInfo(F_LOG::database) << "Database and table created successfully";
	return true;
}

QString fudy_props_helper::to_string(FudyProperties prop) {
	return fudyProperties[prop];
}
