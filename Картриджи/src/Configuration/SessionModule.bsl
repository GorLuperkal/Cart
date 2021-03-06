Процедура УстановкаПараметровСеанса(ИменаПараметровСеанса)
	Перем ИДПользователя,ИмяПользователя,СсылкаНаНайденногоПользователя;
	Попытка
		//СпрПользователейДляПоиска=Справочники.Пользователи;
		ИДПользователя=ПользователиИнформационнойБазы.ТекущийПользователь().УникальныйИдентификатор;
		ИмяПользователя = ПользователиИнформационнойБазы.ТекущийПользователь().Имя;
		//ПараметрыСеанса.ТекущийПользователь = СпрПользователейДляПоиска.НайтиПоРеквизиту("ИДПользователя",ИДПользователя);
		
		Пользователи =Справочники.Пользователи;
		НайденнаяССылка = Пользователи.НайтиПоРеквизиту("ИДПользователя",ИДПользователя);
		Если НайденнаяССылка = Пользователи.ПустаяСсылка() Тогда
			НовыйЭлемент = Пользователи.СоздатьЭлемент();
			НовыйЭлемент.ИДПользователя = ИДПользователя;
			НовыйЭлемент.Наименование = ИмяПользователя;
			НовыйЭлемент.Записать();
			СсылкаНаНайденногоПользователя = НовыйЭлемент;
		Иначе
			СсылкаНаНайденногоПользователя = НайденнаяССылка;
		КонецЕсли;
		ПараметрыСеанса.ТекущийПользователь = СсылкаНаНайденногоПользователя;
	Исключение
	КонецПопытки;
	
КонецПроцедуры  

