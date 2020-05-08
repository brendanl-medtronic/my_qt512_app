#include <QGuiApplication>
#include <QQmlContext>
#include <QQuickView>

#include <QOperatingSystemVersion>

#include "Calculator.h"

int main(int argc, char** argv)
{
  Calculator calc;

  QGuiApplication app(argc, argv);

  auto current_os = QOperatingSystemVersion::current();
  QString os_name = current_os.name();

  qDebug() << "Current OS: " << os_name;

  QQuickView view;
  view.rootContext()->setContextProperty("calc", &calc);
  view.setSource(QUrl(QStringLiteral("qrc:/main.qml")));
  view.show();

  return app.exec(); 
}
