#include <QGuiApplication>
#include <QQmlContext>
#include <QQuickView>

#include "Calculator.h"

int main(int argc, char** argv)
{
  Calculator calc;

  QGuiApplication app(argc, argv);

  QQuickView view;
  view.rootContext()->setContextProperty("calc", &calc);
  view.setSource(QUrl(QStringLiteral("qrc:/main.qml")));
  view.show();

  return app.exec(); 
}
