#include "qsquarelayout.h"

QVSquareLayout::QVSquareLayout(QWidget* parent) : QLayout (parent)
{
}

QVSquareLayout::~QVSquareLayout() {}

void QVSquareLayout::addItem(QLayoutItem* item) {
    _items.append(item);
}

QLayoutItem* QVSquareLayout::itemAt(int index) const {
    if (index < 0 || index >= count())
        return nullptr;
    return _items.at(index);
}

QLayoutItem* QVSquareLayout::takeAt(int index) {
    if (index < 0 || index >= count())
        return nullptr;
    return _items.takeAt(index);
}

int QVSquareLayout::count() const {
    return _items.count();
}

QSize QVSquareLayout::minimumSize() const {
    return QSize(10, 10);
}

QSize QVSquareLayout::sizeHint() const {
    int width = 0, height = 0, n = count();
    foreach (QLayoutItem* item, _items) {
        QSize size = item->sizeHint();
        int min = qMin(size.width(), size.height());
        width = qMax(width, min);
        height += min;
    }
    return {width, height + n * spacing()};
}

void QVSquareLayout::setGeometry(const QRect &rect) {
    int n = count();
    if (n < 1 || rect == this->geometry())
        return;

    QLayout::setGeometry(rect);
    int left, right, top, bottom;
    getContentsMargins(&left, &top, &right, &bottom);

    int min = qMin(rect.width(), rect.height() / n);
    QPoint baseLine{rect.width()/2 - min/2 + left, top};
    QSize square{min, min};
    foreach (QLayoutItem *item, _items) {
        item->setGeometry(QRect{baseLine, square});
        baseLine.ry() += min;
    }
}
