#include "Calculator.h"
#include <QQmlEngine>

Calculator::Calculator() : QObject(), 
	m_total(0),
	app(nullptr),
	view(nullptr),
	translator_en(nullptr),
	translator_fr(nullptr)
{
}

void Calculator::setPointers(QCoreApplication* app_in, QQuickView* view_in, 
		                     QTranslator* translator_en_in, 
                             QTranslator* translator_fr_in)
{
    app = app_in;
    view = view_in;
    translator_en = translator_en_in;
    translator_fr = translator_fr_in;
}

void Calculator::add(int value)
{
    m_total += value;
    emit totalChanged(m_total);

    if(m_total % 2 == 1)
    {
        qDebug() << "Translating to French";
        if(app) {
            app->installTranslator(translator_fr);
            view->engine()->retranslate();
        }
    }
    else
    {
        if(app) {
            qDebug() << "Translating to English";
            app->installTranslator(translator_en);
            view->engine()->retranslate();
        }
    }
}

int Calculator::total() const
{
    return m_total;
}
