#ifndef MAINWINDOW_H
#define MAINWINDOW_H

#include <QMainWindow>
#include <QListWidgetItem>

#include "qsquarelayout.h"

namespace Ui {
class MainWindow;
}

class MainWindow : public QMainWindow
{
    Q_OBJECT

public:
    explicit MainWindow(QWidget *parent = nullptr);
    ~MainWindow();

private slots:
    void on_generateButton_clicked();

    void on_pushButtonClear_clicked();

    void on_historyListWidget_itemActivated(QListWidgetItem *item);

private:
    Ui::MainWindow *ui;
    QVSquareLayout *qrLayout;

    bool generateAndShow(const QString& text);
};

#endif // MAINWINDOW_H
