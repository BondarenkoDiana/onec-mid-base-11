#Область ПрограммныйИнтерфейс 

// Программно добавляется поле КонтактноеЛицо в документы.
// Параметры:
//  Форма- ФормаКлиентскогоПриложения. 
Процедура ДополнитьФорму(Форма) Экспорт 	
	
	ИмяФормы = Форма.ИмяФормы;
	
	Если ИмяФормы = "Документ.ЗаказПокупателя.Форма.ФормаДокумента" Тогда
		ДобавитьПолеКонтактноеЛицоВГруппаШапкаПраво(Форма);
		ДобавитьРассчетСкидки(Форма);
	ИначеЕсли ИмяФормы = "Документ.ПоступлениеТоваровУслуг.Форма.ФормаДокумента" Тогда 
		ДобавитьПолеКонтактноеЛицоВГруппаШапкаПраво(Форма);
	ИначеЕсли ИмяФормы = "Документ.РеализацияТоваровУслуг.Форма.ФормаДокумента" Тогда 
		ДобавитьПолеКонтактноеЛицоВГруппаШапкаПраво(Форма);
	ИначеЕсли ИмяФормы = "Документ.ОплатаОтПокупателя.Форма.ФормаДокумента" Тогда 
		ВставитьПолеКонтактноеЛицоНаФормуПередСуммаДокумента(Форма);
	ИначеЕсли ИмяФормы = "Документ.ОплатаПоставщику.Форма.ФормаДокумента" Тогда 
		ВставитьПолеКонтактноеЛицоНаФормуПередСуммаДокумента(Форма);
	КонецЕсли
	
КонецПроцедуры
#КонецОбласти

#Область СлужебныеПроцедурыИФункции

Процедура ДобавитьПолеКонтактноеЛицоВГруппаШапкаПраво(Форма)
	
	ПолеВвода = Форма.Элементы.Добавить("КонтактноеЛицо", Тип("ПолеФормы"), Форма.Элементы.ГруппаШапкаПраво);
	ПолеВвода.Вид = ВидПоляФормы.ПолеВвода;
	ПолеВвода.ПутьКДанным = "Объект.Дораб_КонтактноеЛицо";
	
КонецПроцедуры

Процедура ВставитьПолеКонтактноеЛицоНаФормуПередСуммаДокумента(Форма)
	
	ПолеВвода = Форма.Элементы.Вставить("КонтактноеЛицо", Тип("ПолеФормы"), , Форма.Элементы.СуммаДокумента);
	ПолеВвода.Вид = ВидПоляФормы.ПолеВвода;
	ПолеВвода.ПутьКДанным = "Объект.Дораб_КонтактноеЛицо";
	
КонецПроцедуры

Процедура ДобавитьРассчетСкидки(Форма)
	
	ГруппаСкидка = Форма.Элементы.Добавить("ГруппаСкидка", Тип("ГруппаФормы"), Форма.Элементы.ГруппаШапкаЛево);
	ГруппаСкидка.Вид = ВидГруппыФормы.ОбычнаяГруппа;
	ГруппаСкидка.Отображение = ОтображениеОбычнойГруппы.Нет;
	ГруппаСкидка.Группировка = ГруппировкаПодчиненныхЭлементовФормы.ГоризонтальнаяВсегда;
	ГруппаСкидка.Заголовок = "";
	
	ЭлементСкидка = Форма.Элементы.Добавить("Дораб_СогласованнаяСкидка", Тип("ПолеФормы"), ГруппаСкидка);
	ЭлементСкидка.Вид = ВидПоляФормы.ПолеВвода;
	ЭлементСкидка.ПутьКДанным = "Объект.Дораб_СогласованнаяСкидка";
	ЭлементСкидка.УстановитьДействие("ПриИзменении", "Дораб_СогласованнаяСкидкаПриИзменении");
	
	КомандаПересчитать = Форма.Команды.Добавить("ПересчитатьТаблицу");
	КомандаПересчитать.Заголовок = "Пересчитать таблицу";
	КомандаПересчитать.Действие = "Дораб_КомандаПересчитатьТаблицу"; 
	
	КнопкаПересчитать = Форма.Элементы.Добавить("КнопкаПересчитатьТаблицу", Тип("КнопкаФормы"), ГруппаСкидка);
	КнопкаПересчитать.Заголовок = "Пересчитать таблицу";
	КнопкаПересчитать.ИмяКоманды = "ПересчитатьТаблицу"; 
	КнопкаПересчитать.Вид = ВидКнопкиФормы.ОбычнаяКнопка;
	КнопкаПересчитать.Отображение = ОтображениеКнопки.КартинкаИТекст;
	КнопкаПересчитать.Картинка = БиблиотекаКартинок.Обновить; 
	
КонецПроцедуры

#КонецОбласти