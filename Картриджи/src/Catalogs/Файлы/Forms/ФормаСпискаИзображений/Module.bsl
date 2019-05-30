
&НаСервере
Процедура УстановитьКартинку(Изображение)
	
	КартинкаАдрес = ПолучитьНавигационнуюСсылку(Изображение,"Хранилище");
	Элементы.Картинка.РазмерКартинки = РазмерКартинки.АвтоРазмер;

КонецПроцедуры // УстановитьКартинку() 

&НаСервере
Процедура ПриСозданииНаСервере(Отказ, СтандартнаяОбработка)
		
	Если Параметры.Свойство("ОсновноеИзображение") Тогда
		Если ЗначениеЗаполнено(Параметры.ОсновноеИзображение.ИмяФайла) Тогда
			ОсновноеИзображение = Параметры.ОсновноеИзображение;
		Иначе	
		    ОсновноеИзображение = Неопределено;
		КонецЕсли; 				
	КонецЕсли; 
	
	Если Параметры.Свойство("ОбъектХранилища") Тогда
		ОбъектХранилища = Параметры.ОбъектХранилища;		
	КонецЕсли;
	
	СписокИзображений.Параметры.УстановитьЗначениеПараметра("ОсновноеИзображение",ОсновноеИзображение);
	
КонецПроцедуры

&НаКлиенте
Процедура ОсновноеИзображение(Команда)
	
	Если Не Команда = 0 Тогда
		
		ТекущиеДанные = Элементы.СписокИзображений.ТекущиеДанные;
		Если ТекущиеДанные = Неопределено Тогда
			Возврат;	
		КонецЕсли;
		
		ОсновноеИзображение = ТекущиеДанные.Ссылка;
		
	КонецЕсли;   
		
	СписокИзображений.Параметры.УстановитьЗначениеПараметра("ОсновноеИзображение",ОсновноеИзображение);
	
	ПараметрыОповещения = Новый Структура;
	ПараметрыОповещения.Вставить("ОбъектХранилища"    ,ОбъектХранилища);
	ПараметрыОповещения.Вставить("ОсновноеИзображение",ОсновноеИзображение);
	
	Оповестить("ОбновитьОсновноеИзображение", ПараметрыОповещения, ЭтаФорма);
	
КонецПроцедуры

&НаКлиенте
Процедура СписокИзображенийПриАктивизацииСтроки(Элемент)
	
	ТекущиеДанные = Элементы.СписокИзображений.ТекущиеДанные;
	Если ТекущиеДанные = Неопределено Тогда
		КартинкаАдрес = "";
		Возврат;	
	КонецЕсли; 
	
	УстановитьКартинку(ТекущиеДанные.Ссылка);
	
КонецПроцедуры
    
&НаКлиенте
Процедура ОбработкаОповещения(ИмяСобытия, Параметр, Источник)
	  
	Если ИмяСобытия = "УстановитьОсновноеИзображениеЕслиЕгоНет" Тогда
		Если Параметр = ОбъектХранилища Тогда
			Если Не ЗначениеЗаполнено(ОсновноеИзображение) 
			   И ТипЗнч(Источник) = Тип("СправочникСсылка.Файлы")	
			   И ЗначениеЗаполнено(Источник) Тогда
			   
			   ОсновноеИзображение = Источник;
			   ОсновноеИзображение(0);
			
			КонецЕсли; 
		
		КонецЕсли;
	КонецЕсли; 
	
КонецПроцедуры
 
&НаКлиенте
Процедура СписокИзображенийПослеУдаления(Элемент)
	
	ОсновноеИзображение(0);
	
КонецПроцедуры
   
