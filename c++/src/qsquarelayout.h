#ifndef QSQUARELAYOUT_H
#define QSQUARELAYOUT_H

#include <QLayout>
#include <QLayoutItem>

class QVSquareLayout : public QLayout
{
    Q_OBJECT
public:
    QVSquareLayout(QWidget* parent=nullptr);
    ~QVSquareLayout();

// QLayoutItem interface
public:
    virtual QSize sizeHint() const;
    virtual void setGeometry(const QRect &rect);

// QLayout interface
public:
    virtual void addItem(QLayoutItem* item);
    virtual QLayoutItem* itemAt(int index) const;
    virtual QLayoutItem* takeAt(int index);
    virtual int count() const;
    virtual QSize minimumSize() const;

private:
    QList<QLayoutItem *> _items;
};

#endif // QSQUARELAYOUT_H
