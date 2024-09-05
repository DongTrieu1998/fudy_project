#include "FudyUtils.h"

#include <QFile>
#include <QGuiApplication>
#include <QLoggingCategory>
#include <QSqlError>

namespace F_LOG {

Q_LOGGING_CATEGORY(database, "fudy.database")

}

const QString cDBName = QStringLiteral("fudyDB.db");
const QString cDataTableSchema = "id INTEGER PRIMARY KEY AUTOINCREMENT, "
								 "user_id INTEGER, "
								 "enabled BOOLEAN, "
								 "header TEXT NOT NULL DEFAULT 'Task to do ...', "
								 "notetext TEXT, "
								 "visible INTEGER, "
								 "xaxis INTEGER, "
								 "yaxis INTEGER, "
								 "FOREIGN KEY(user_id) REFERENCES Users(id)";

const QString cUserTableSchema = "id INTEGER PRIMARY KEY AUTOINCREMENT, "
								 "username TEXT UNIQUE NOT NULL, "
								 "password TEXT NOT NULL, "
								 "hint TEXT NOT NULL";

namespace {

static const QHash<FudyProperties, QString> fudyProperties = {
	{FudyProperties::Id, "id"},
	{FudyProperties::UserId, "user_id"},
	{FudyProperties::Enabled, "enabled"},
	{FudyProperties::Header, "header"},
	{FudyProperties::NoteText, "noteText"},
	{FudyProperties::Visible, "visible"},
	{FudyProperties::XAxis, "xaxis"},
	{FudyProperties::YAxis, "yaxis"},
};

bool createTable(QSqlDatabase db, const QString& tableName, const QString& tableSchema) {
	QSqlQuery query(db);

	QString createTableQuery =
		QString("CREATE TABLE IF NOT EXISTS %1 ("
				"%2"
				")").arg(tableName).arg(tableSchema);

	if (!query.prepare(createTableQuery)) {
		qCCritical(F_LOG::database) << "Error preparing query:" << query.lastError().text();
		return false;
	}

	if (!query.exec()) {
		qCCritical(F_LOG::database) << "Error executing query:" << query.lastError().text() << __FUNCTION__;
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

	if (!createTable(db, cUserDataTableName, cDataTableSchema)) {
		qCCritical(F_LOG::database) << "Error: Unable to create" << cUserDataTableName << " table";
		return false;
	}

	if (!createTable(db, cUserTableName, cDataTableSchema)) {
		qCCritical(F_LOG::database) << "Error: Unable to create" << cUserTableName << " table";
		return false;
	}

	qCInfo(F_LOG::database) << "Database and tables created successfully";
	return true;
}

QString fudy_props_helper::to_string(FudyProperties prop) {
	return fudyProperties[prop];
}
