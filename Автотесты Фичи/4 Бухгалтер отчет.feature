﻿#language: ru

@tree

Функционал: Формирование отчета Анализ выставленных актов

Как Бухгалтер я хочу
проверить использование формирование отчета Анализ выставленных актов  
чтобы не было ошибок вывода данных   

Контекст:
	Дано я подключаю профиль TestClient "Бухгалтер"

Сценарий: Я формирую отчет Анализ выставленных актов
И В командном интерфейсе я выбираю 'Обслуживание клиентов' 'Анализ выставленных актов'
*Формирую отчет
	Тогда открылось окно 'АнализВыставленныхАктов'
	И я нажимаю на кнопку с именем 'СформироватьОтчет'
	И в поле с именем 'КомпоновщикНастроекПользовательскиеНастройкиЭлемент0Значение' я ввожу текст '  .  .       :  :  '
	И в поле с именем 'КомпоновщикНастроекПользовательскиеНастройкиЭлемент1Значение' я ввожу текст '  .  .       :  :  '
