#include <QObject>
#include <QCoreApplication>
#include <QQuickView>
#include <QTranslator>

class Calculator : public QObject
{
    Q_OBJECT

    Q_PROPERTY(int total READ total NOTIFY totalChanged)
public:
    Calculator();
    int total() const;

    Q_INVOKABLE
    void add(int value);

    void setPointers(QCoreApplication* app_in, QQuickView* view_in, 
		     QTranslator* translator_en_in, QTranslator* translator_fr_in);

signals:
    void totalChanged(int newTotal);

private:
    int m_total;

    QCoreApplication* app;
    QQuickView* view;
    QTranslator* translator_en;
    QTranslator* translator_fr;
};
