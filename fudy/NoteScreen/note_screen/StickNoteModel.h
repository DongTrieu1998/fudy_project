#ifndef STICKNOTEMODEL_H
#define STICKNOTEMODEL_H

#include <QAbstractListModel>

struct StickItem
{
	bool enable;
	QString headerText;
	QString noteText;
};

class StickNoteModel : public QAbstractListModel
{
	Q_OBJECT
public:
	explicit StickNoteModel(QObject* parent = nullptr);

	enum Roles
	{
		EnableRole = Qt::UserRole + 1,
		HeaderRole,
		NoteTextRole,
	};

	//Basic functionality
	int rowCount(const QModelIndex& parent = QModelIndex()) const override;
	QVariant data(const QModelIndex& index, int role = Qt::DisplayRole) const override;

	//Editable
	bool setData(const QModelIndex& index, const QVariant& value, int role = Qt::EditRole) override;
	Qt::ItemFlags flags(const QModelIndex& index) const override;
	virtual QHash<int, QByteArray> roleNames() const override;

	Q_INVOKABLE bool setItemAt(int index, const StickItem& item);
	Q_INVOKABLE void removedItemAt(int index);
	Q_INVOKABLE void removedCompletedItems();
	Q_INVOKABLE void appendItem();

private:
	QVector<StickItem> m_items;
};

#endif // STICKNOTEMODEL_H
