#include <QGuiApplication>
#include <QQmlContext>
#include <QQuickView>

#include <QDateTime>
#include <QFileInfo>
#include <QOperatingSystemVersion>
#include <QTranslator>

#include "Calculator.h"

int main(int argc, char** argv)
{
  QTranslator translator_fr;
  translator_fr.load("french");

  QTranslator translator_en;
  translator_en.load("english");

  Calculator calc;

  QGuiApplication app(argc, argv);
  app.installTranslator(&translator_en);

  auto current_os = QOperatingSystemVersion::current();
  QString os_name = current_os.name();

  qDebug() << QObject::tr("Current OS: ") << os_name;
  qDebug() << "";

  QFileInfo my_info("./my_qt512_app");

  QDateTime birth_time = my_info.birthTime();
  QDateTime metadata_change_time = my_info.metadataChangeTime();

  qDebug() << "./my_qt512_app: birth time: " << (birth_time.isValid() ? birth_time.toString() : QString("<invalid>"));
  qDebug() << "      metadata change time: " << metadata_change_time;

  qDebug() << "";

  QQuickView view;

  calc.setPointers(&app, &view, &translator_en, &translator_fr);

  view.rootContext()->setContextProperty("calc", &calc);
  view.setSource(QUrl(QStringLiteral("qrc:/main.qml")));
  view.show();

  return app.exec(); 
}
