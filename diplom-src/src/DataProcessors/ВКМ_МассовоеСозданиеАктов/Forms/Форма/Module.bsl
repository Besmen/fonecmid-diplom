
&НаКлиенте
Процедура ВКМ_СоздатьДокументы(Команда)
	
	Период = Объект.ВКМ_Период;
	
	Если НЕ ЗначениеЗаполнено(Период) Тогда 
		ОбщегоНазначенияКлиент.СообщитьПользователю("Выберите период");
		Возврат;
	КонецЕсли;
	
	ДлительнаяОперация = СоздатьДокументыНаСервере(); 
	
	Оповещение = Новый ОписаниеОповещения("СоздатьДокументыЗавершение", ЭтотОбъект);
	
	ДлительныеОперацииКлиент.ОжидатьЗавершение(ДлительнаяОперация, Оповещение); 
		
КонецПроцедуры

&НаСервере
Функция СоздатьДокументыНаСервере()

	ИмяМетода = "Обработки.ВКМ_МассовоеСозданиеАктов.СоздатьДокументыНаСервере";
	
	Возврат ДлительныеОперации.ВыполнитьФункцию(УникальныйИдентификатор, ИмяМетода, Объект.ВКМ_Период);

КонецФункции                                                                        

&НаКлиенте
Процедура СоздатьДокументыЗавершение(Результат, ДополнительныеПараметры) Экспорт 
	
	МассивДляТЧ = ПолучитьИзВременногоХранилища(Результат.АдресРезультата);
	ДобавитьСтрокувВТЧОбработки(МассивДляТЧ);
	Сообщить("Обработка завершена");
	
КонецПроцедуры

&НаСервере
Процедура ДобавитьСтрокувВТЧОбработки(МассивДляТЧ)
	
	ТЧ = Объект.ВКМ_ДоговорыИРеализации;
	ТЧ.Очистить();
	
	Для Каждого Элемент Из МассивДляТЧ Цикл 
		
		Обработки.ВКМ_МассовоеСозданиеАктов.ВКМ_ДобавитьСтрокуВТЧ(Элемент.Договор, Элемент.Реализация, ТЧ); 
		
	КонецЦикла;

КонецПроцедуры

&НаСервере
Процедура ПриСозданииНаСервере(Отказ, СтандартнаяОбработка)
	Объект.ВКМ_Период = ТекущаяДата();
КонецПроцедуры
