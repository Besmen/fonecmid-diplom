﻿#language: ru

@tree

Функционал: Процесс создания обработкой Массовое создание актов документов Реализация товаров и услуг

Как Бухгалтер я хочу
проверить использование обработки Массовое создание актов  
чтобы не было ошибок ввода данных   

Контекст:
	Дано я подключаю профиль TestClient "Бухгалтер" 

Сценарий: Я использую групповую обработку Массовое создание актов

И В командном интерфейсе я выбираю 'Обслуживание клиентов' 'Массовое создание актов'
*Использую обработку
	Тогда открылось окно 'Массовое создание актов'
	И я нажимаю на кнопку с именем 'ФормаВКМ_СоздатьДокументы'
