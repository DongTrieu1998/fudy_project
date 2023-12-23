#ifndef MYCUSTOMITEM_H
#define MYCUSTOMITEM_H

#include <QObject>

class MyCustomItem : public QObject
{
    Q_OBJECT
    Q_PROPERTY(int width READ width WRITE setWidth NOTIFY widthChanged)
    Q_PROPERTY(int height READ height WRITE setHeight NOTIFY heightChanged)

public:
    explicit MyCustomItem(QObject *parent = nullptr);

    int width() const;
    void setWidth(int newWidth);

    int height() const;
    void setHeight(int newHeight);

signals:

    void widthChanged();
    void heightChanged();

private:
    int m_width;
    int m_height;
};

#endif // MYCUSTOMITEM_H
