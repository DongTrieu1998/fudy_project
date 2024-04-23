#include "FudyUtils.h"

#include <QFile>
#include <QGuiApplication>

namespace L {

Q_LOGGING_CATEGORY(database, "fudy.database")

}

bool utils::createDatabase(const QGuiApplication &app) {
	//	Database is a normal file. Check if file *.db is existed or not.
	QFile databaseFile(app.applicationDirPath() + "/fudyDB.db");
	qCWarning(L::database) << "Database existed status : " << databaseFile.exists();

	QSqlDatabase db = QSqlDatabase::addDatabase("QSQLITE");
	db.setDatabaseName(app.applicationDirPath() + "/fudyDB.db");

	if (!db.open()) {
		qCCritical(L::database) << "Error: Unable to open the database";
		return false;
	}

	// Create the necessary tables
	QSqlQuery query;
	query.prepare(
	            "CREATE TABLE IF NOT EXISTS fudy ("
	            "id INTEGER PRIMARY KEY AUTOINCREMENT, "
	            "enable INTEGER, "
	            "header TEXT NOT NULL DEFAULT ('Task to do ...'), "
	            "notetext TEXT, "
	            "visible INTEGER, "
	            "xaxis INTERGER, "
	            "yaxis INTERGER)"
	            );
	if (!query.exec()) {
		qCCritical(L::database) << "Error: Unable to create table";
		return false;
	}

	qCInfo(L::database) << "Database and table created successfully";
	return true; // Database already exists
}

