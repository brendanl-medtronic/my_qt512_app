#include "Calculator.h"

Calculator::Calculator() : QObject(), m_total(0)
{
}

void Calculator::add(int value)
{
    m_total += value;
    emit totalChanged(m_total);
}

int Calculator::total() const
{
    return m_total;
}