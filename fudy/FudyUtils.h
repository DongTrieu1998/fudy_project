#ifndef FUDYUTILS_H
#define FUDYUTILS_H

#include <QSqlQuery>
#include <QSqlQueryModel>
#include <QHash>

class QFile;
class QGuiApplication;

enum FudyProperties
{
	Id,
	UserId,
	Enabled,
	Header,
	NoteText,
	Visible,
	XAxis,
	YAxis,
};

namespace db_utils {
const QString cUserDataTableName = QStringLiteral("userData");
const QString cUserTableName = QStringLiteral("user");

bool createDatabase(const QGuiApplication& app);
} // namespace utils

namespace fudy_props_helper {
QString to_string(FudyProperties prop);
}

#endif // FUDYUTILS_H
