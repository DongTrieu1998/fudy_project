#ifndef STICKNOTEMODEL_H
#define STICKNOTEMODEL_H

#include <QAbstractListModel>
#include <QSqlQuery>
#include <QSqlQueryModel>

struct StickItem {
	int id;
	bool enabled;
	QString header;
	QString noteText;
	bool visible;
	int xaxis;
	int yaxis;
};

class StickNoteModel : public QAbstractListModel {
	Q_OBJECT
public:
	explicit StickNoteModel(QObject* parent = nullptr);

	enum Roles {
		IdRole = Qt::UserRole + 1,
		EnableRole,
		HeaderRole,
		NoteTextRole,
		VisibleRole,
		XAxisRole,
		YAxisRole,
	};

	int rowCount(const QModelIndex& parent = QModelIndex()) const override;
	QVariant data(const QModelIndex& index, int role = Qt::DisplayRole) const override;

	virtual QHash<int, QByteArray> roleNames() const override;

public slots:
	bool appendNewItem();
	bool removeItemAt(int index);
	bool removeCompletedItems();

	bool updateProperty(QString tableName, QString property, int id, QVariant value);
	bool updateEnabled(int id, bool enabled);
	bool updateHeader(int id, QString header);
	bool updateNoteText(int id, QString notetext);
	bool updateVisible(int id, bool visible);
	bool updateAxis(int id, int xaxis, int yaxis);

signals:
	void newItemAppended();

private:
	QVector<StickItem> m_items;
};

#endif // STICKNOTEMODEL_H
