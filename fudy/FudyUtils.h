#ifndef FUDYUTILS_H
#define FUDYUTILS_H

#include <QSqlQueryModel>
#include <QSqlQuery>
#include <QLoggingCategory>

class QFile;
class QGuiApplication;

namespace L {
    Q_DECLARE_LOGGING_CATEGORY(database)
}

namespace utils {
    bool createDatabase(const QGuiApplication &app);
}

#endif // FUDYUTILS_H
