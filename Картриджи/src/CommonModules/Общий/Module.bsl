
&НаКлиенте
Процедура ПредупреждениеПользователя(Текст) Экспорт 

Предупреждение(НСтр(Текст), 10);	

КонецПроцедуры

&НаСервере
Функция ПолучитьОсновноеПодразделение()Экспорт

	Возврат ПараметрыСеанса.ТекущийПользователь.ОсновноеПодразделение;

КонецФункции // ПолучитьОсновноеПодразделение()
 