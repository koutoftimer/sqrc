#include <QClipboard>
#include <QMessageBox>
#include <QrCode.hpp>

#include "mainwindow.h"
#include "ui_mainwindow.h"

using namespace qrcodegen;

MainWindow::MainWindow(QWidget *parent) :
    QMainWindow(parent),
    ui(new Ui::MainWindow)
{
    ui->setupUi(this);

    qrLayout = new QVSquareLayout(nullptr);
    qrLayout->setSpacing(6);
    qrLayout->setContentsMargins(14, 36, 0, 0);
    qrLayout->setObjectName(QString::fromUtf8("qrLayout"));
    qrLayout->addWidget(ui->svgWidget);
    ui->qrLayout->addLayout(qrLayout);
}

MainWindow::~MainWindow()
{
    delete ui;
}

void MainWindow::on_generateButton_clicked()
{
    const QClipboard *clipboard = QApplication::clipboard();
    QString text = clipboard->text();
    if (generateAndShow(text)) {
        QListWidgetItem *item = new QListWidgetItem({text}, ui->historyListWidget);
    }
}

void MainWindow::on_pushButtonClear_clicked()
{
    ui->svgWidget->hide();
}

bool MainWindow::generateAndShow(const QString &text)
{
    try {
        QrCode qr = QrCode::encodeText(text.toUtf8().constData(), QrCode::Ecc::MEDIUM);
        std::string svg = qr.toSvgString(4);
        ui->svgWidget->load(QByteArray(svg.c_str()));
        ui->svgWidget->show();
        return true;
    } catch (data_too_long ex) {
        QMessageBox::warning(this, {"Too long text"}, {"Try copy less amount of text."});
    }{}
    return false;
}

void MainWindow::on_historyListWidget_itemActivated(QListWidgetItem *item)
{
    generateAndShow(item->text());
}
