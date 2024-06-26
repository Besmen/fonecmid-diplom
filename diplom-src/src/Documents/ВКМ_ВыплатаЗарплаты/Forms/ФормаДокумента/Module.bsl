
&НаКлиенте
Процедура ВКМ_Заполнить(Команда)
	
	Если Объект.Проведен Тогда
		ОбщегоНазначенияКлиент.СообщитьПользователю("Необходимо распровести документ");
	ИНаче 
		ВКМ_ЗаполнитьНаСервере();
	КонецЕсли;

КонецПроцедуры

&НаСервере
Процедура ВКМ_ЗаполнитьНаСервере()
	
	Объект.ВКМ_Выплаты.Очистить();
	
	Запрос = Новый Запрос;
	Запрос.Текст = "ВЫБРАТЬ
	               |	ВКМ_ВзаиморасчетыССотрудникамиОстатки.ВКМ_Сотрудник КАК Сотрудник,
	               |	ВКМ_ВзаиморасчетыССотрудникамиОстатки.ВКМ_СуммаОстаток КАК СуммаОстаток
	               |ИЗ
	               |	РегистрНакопления.ВКМ_ВзаиморасчетыССотрудниками.Остатки(КОНЕЦПЕРИОДА(&Дата, МЕСЯЦ), ) КАК ВКМ_ВзаиморасчетыССотрудникамиОстатки";
	
	Запрос.УстановитьПараметр("Дата", Объект.Дата);
	Выборка = Запрос.Выполнить().Выбрать();
	
	Пока Выборка.Следующий() Цикл 
		
		НоваяСтрока = Объект.ВКМ_Выплаты.Добавить();
		НоваяСтрока.ВКМ_Сотрудник = Выборка.Сотрудник;
		НоваяСтрока.ВКМ_Сумма = Выборка.СуммаОстаток;
		
	КонецЦикла;
	
КонецПроцедуры

