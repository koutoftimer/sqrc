#include "mainwindow.h"
#include "ui_mainwindow.h"

using namespace qrcodegen;

MainWindow::MainWindow(QWidget *parent) :
    QMainWindow(parent),
    ui(new Ui::MainWindow)
{
    ui->setupUi(this);

}

MainWindow::~MainWindow()
{
    delete ui;
}

void MainWindow::on_generateButton_clicked()
{
    const QClipboard* clipboard = QApplication::clipboard();
    QString text = clipboard->text();
    QrCode qr = QrCode::encodeText(text.toUtf8().constData(), QrCode::Ecc::MEDIUM);
    std::string svg = qr.toSvgString(4);
    ui->svgWidget->load(QByteArray(svg.c_str()));
}
