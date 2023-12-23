#include "mycustomitem.h"

MyCustomItem::MyCustomItem(QObject *parent)
    : QObject{parent}, m_width{200}, m_height{200}
{

}

int MyCustomItem::width() const
{
    return m_width;
}

void MyCustomItem::setWidth(int newWidth)
{
    if (m_width == newWidth)
        return;
    m_width = newWidth;
    emit widthChanged();
}

int MyCustomItem::height() const
{
    return m_height;
}

void MyCustomItem::setHeight(int newHeight)
{
    if (m_height == newHeight)
        return;
    m_height = newHeight;
    emit heightChanged();
}
