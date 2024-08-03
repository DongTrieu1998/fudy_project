	#ifndef STICKNOTEMODEL_H
#define STICKNOTEMODEL_H

#include <QAbstractListModel>
#include <QSqlQuery>
#include <QSqlQueryModel>

struct StickItem {
	int id = 0;
	bool enabled = false;
	QString header = "Task to do";
	QString noteText = "";
	bool visible = false;
	int xaxis = 0;
	int yaxis = 0;
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

	bool updateProperty(const QString& tableName, const QString& property, int id, const QVariant& value);
	bool updateEnabled(int index, bool enabled);
	bool updateHeader(int index, QString header);
	bool updateNoteText(int index, QString notetext);
	bool updateVisible(int index, bool visible);
	bool updateAxis(int index, int xaxis, int yaxis);

signals:
	void newItemAppended();

private:
	void queryData();

	QVector<StickItem> m_items;
};

#endif // STICKNOTEMODEL_H
