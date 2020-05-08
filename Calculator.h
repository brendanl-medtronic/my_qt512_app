#include <QObject>

class Calculator : public QObject
{
    Q_OBJECT

    Q_PROPERTY(int total READ total NOTIFY totalChanged)
public:
    Calculator();
    int total() const;

    Q_INVOKABLE
    void add(int value);

signals:
    void totalChanged(int newTotal);

private:
    int m_total;
};