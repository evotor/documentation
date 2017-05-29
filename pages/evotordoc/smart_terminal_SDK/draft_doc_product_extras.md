---
title: Схемы и дополнительные поля товаров
keywords: sample
summary: "Раздел содержит описание описание API смарт-терминала для работы со схемами и дополнительными полями товаров."
sidebar: evotordoc_sidebar
permalink: doc_product_extras.html
folder: evotordoc/smart_terminal_SDK
published: false
---

Любое приложение может создавать дополнительные поля товаров. Один товар может содержать дополнительные поля разных приложений, токен приложения определяет какое дополнительное поле передаётся в ответ на запрос. Дополнительные поля могут содержать любую информацию, представленную в виде валидного JSON-объекта.

Кроме дополнительных полей приложения могут создавать схемы. Смарт-терминал использует схемы для отображения данных в интерфейсе.

Методы для работы со схемами и дополнительными полями товаров в облаке описаны в [справочнике API](https://api.evotor.ru/docs/#tag/Shemy-i-dopolnitelnye-polya-tovarov).

### Java-приложение

Чтобы получить дополнительное поле товара используйте функцию:

`var productExtras = inventory.getProductExtras(productUID);`

, где:
`productUID`– идентификатор товара в формате uuid4.

Ответ приходит в виде строки, которую тербуется передать в функцию `JSON.parse()`. Ответ функции содержит:

* `productUuid` – идентификатор товара в формате uuid4.
* `fieldValue` - значения дополнительного поля. Используйте метод `extra.fieldValue` чтобы получить значение дополнительного поля.
* `uuid` - идентификатор значения дополнительного поля в формате uuid4.
* `fieldUuid` - идентификатор поля в схеме в формате uuid4.
* `name` - название поля поля в схеме в строковом формате. Используйте его вместе с `fieldUuid`.


Чтобы получить схему, в которой отображается дополнительное поле, используйте функцию:

`var fieldJson = inventory.getField(extra.fieldUuid);`

, где:
`fieldUuid` - идентификатор поля в схеме в формате uuid4.

Ответ приходит в виде строки, которую тербуется передать в функцию `JSON.parse()`. Ответ функции содержит:

* `uuid` - идентификатор поля в схеме, в формате uuid4.
* `name` - название поля в схеме.
* `title` - Заголок схемы, который отображается в интерфейсе.
* `type` - тип схемы: `TEXT_FIELD` (текстовое поле) или `DICTIONARY_FIELD` (справочник).

Текстовое поле может содержать поле `data` с валидным JSON-объектом.

Поле справочника может содержать:

* `multiple` – флажок (boolean) задаёт возможность выбора нескольких значений из списака;
* `items` - массив возможных значений справочника:
    * `value` – значение;
    * `title` – наименование значения в интерфейсе;
    * `data` - любой валидный JSON.

Вы можете добавить дополнительное поле если [подпишетесь на событие](./doc_integrated_app_points.html), например, `evo.receipt.beforeProductAdded`. В этом случае, чтобы добавить позицию в рамках определённого отдела магазина, используйте функицю:
`receipt.addPositionExtraDescription(fieldUuid: String, extraDescription: String)`

, где:
`fieldUuid` – идентификатор отдела в формате uuid4.
`description` – описание отдела, которое отображается в интерфейсе и чеке.

Чтобы продолжить работу приложения вызовите `pushNext()`, в противном случае смарт-терминал будет ожидать ответа от приложения.

{% include note.html content="Если полученные дополнительные поля пустые сразу вызывайте `pushNext()`."%}

Если пользователю необходимо выбрать одно из нескольких значений дополнительных полей используйте:

``` java
var receipt = require('receiptControl');
var navigation = require('navigation');
var logger = require('logger');
var inventory = require('inventory');
var description = {
"dialogType" : "singleChoice", // Тип диалога с выбором. Сейчас поддерживается только singleChoice (единственный вариант).
"dialogTitle" : "Title",
"dialogList" : [], // Список отображаемых значений в строковом формате.
"dialogJsCallback" : // Скрипт, который вызывается по нажатию кнопки выбора какого-либо значения.
logger.log(pos); // Переменная pos.
jsonExtraItems = JSON.parse(jsonExtraItems);
jsonValueList = JSON.parse(jsonValueList);
jsonTitleList = JSON.parse(jsonTitleList);
receipt.addExtraReceiptData(JSON.stringify(jsonExtraItems[pos]));
receipt.addPositionExtraDescription(JSON.stringify(jsonValueList[pos]), jsonTitleList[pos]); // Передаёт значение, которое выбрал пользователь.
navigation.pushNext();,
"dialogJsCallbackParamName" : "pos", // Задаёт переменную, которая содержит выбор пользователя. В данном примере используется переменная pos.
"dialogJsCallbackValues" : { }// Содержит все параметры скрипта dialogJsCallback. Параметры заданы парами "ключ - значение".
};
var list = '[]';
var i, jsonDesc, jsonValueList, jsonTitleList, jsonExtraItems;
var appUuid = "test-app";
var code = "4";
var productUID; // Переменную достаточно объявить. Значение заполнится автоматически из товара, который добавлял пользователь.
function handleMoment(context, navigation) { // Функция обработки.
logger.log(receipt.getReceipt());
jsonDesc = JSON.parse(description);
jsonValueList = JSON.parse(list);
jsonTitleList = JSON.parse(list);
if(productUID == null)
{ // если идентификатор не нулевой, тогда используется logger.log("without product uuid"); navigation.pushNext(); return;
}
var productExtras = inventory.getProductExtras(productUID); // Получает дополнительные поля товара.
if (typeof productExtras[1] === 'undefined')
{ logger.log("productExtras is undefined"); navigation.pushNext(); return; }
logger.log(productExtras);
var extra = JSON.parse(productExtras[1]);
if (typeof extra === 'undefined')
{ logger.log("extra is undefined"); navigation.pushNext(); return; }
logger.log(extra);
logger.log(extra.fieldUuid);
var fieldJson = inventory.getField(extra.fieldUuid); // Получает схему поля.
var field = JSON.parse(fieldJson);
logger.log(field);
logger.log(field.type);
if (typeof field === 'undefined') {
logger.log("field undefined");
var data =
{ "value": extra.fieldValue, "data": extra.data }
;
logger.log(JSON.stringify(data));
receipt.addExtraReceiptData(JSON.stringify(data));
receipt.addPositionExtraText(positionUuid, JSON.stringify(extra.fieldValue));
navigation.pushNext();
}
else if (field.type == "DICTIONARY_FIELD"){ // Определяет тип поля. Если задан тип DICTIONARY_FIELD, требуется обработать содержимое.
logger.log("dictionary field");
jsonExtraItems = JSON.parse("[]");
logger.log(field.items);
for (i in field.items){// Обрабатывает значения поля DICTIONARY_FIELD и создаёт массивы названий и значений
var item = field.items[i];
logger.log("item: " + item);
jsonExtraItems.push(item);
logger.log("title: " + item.title);
logger.log("value: " + item.value);
jsonTitleList.push(item.title);// Наполняет значениями переменных.
jsonValueList.push(item.value);// Наполняет значениями переменных.
}
jsonDesc.dialogList = jsonTitleList; // Задаёт значение элементов списка dialogList, которые которые отображаются в интерфейсе.
jsonDesc.dialogJsCallbackValues.jsonExtraItems = JSON.stringify(jsonExtraItems); // Задаёт переменные, которые передаются dialogJsCallback
jsonDesc.dialogJsCallbackValues.jsonTitleList = JSON.stringify(jsonTitleList); // Задаёт переменные, которые передаются dialogJsCallback
jsonDesc.dialogJsCallbackValues.jsonValueList = JSON.stringify(jsonValueList); // Задаёт переменные, которые передаются dialogJsCallback
navigation.pushDialog(jsonDesc); // Объект, полученный из описания, после заполнения переменными.
} else
{ logger.log("not dictionary field"); navigation.pushNext(); }
}
```



Примечания:
1. Чтобы приложение webview могло делать запросы к облаку - нужно его хотя бы раз запустить из врезки на кассе (связано с получением токена от api кассы, с которым на уровне терминала подписываются запросы к Core; если запустить сразу с лаучерной иконки - Core ответит 403 из-за проблем с расшифровкой без токена)
2. Кнопка Оплатить может блокироваться если приложение собрано с неправильными интент-фильтрами
3. Чтобы получить значение экстра поля нужно 2 раза парсить:
var fieldValue = JSON.parse( JSON.parse( inventory.getProductExtras( receiptPositions[i].uuid)[0] ).fieldValue);
Как результата и в том и в другом случае, позиция должна быть добавлена addPositionExtraDescription под определенным отделом если он есть, и без отдела если его нет в чек, а затем попасть список позиций чека в интерфейсе набития чека.
