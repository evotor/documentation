---
title: Работа с чеком
keywords: Раздел содержит описание методов, которые применяются в JS-приложении для работы с чеками и позициями чеков.
summary:
sidebar: evotordoc_sidebar
permalink: doc_js_receipt_interactions.html
tags: [Терминал, JavaScript, Чеки]
folder: js_SDK
---

Вы можете взаимодействовать как с чеком продажи, так и с чеком возврата.

### Работа с чеком

Для работы с чеком вызывайте указанные методы у объекта `receipt`. Объект `receipt` доступен всегда, его не требуется получать с помощью функции `require()`.

#### Задать скидку на чек

```javascript
receipt.applyReceiptDiscount(discountvalue)
```

В аргументе функции требуется передать строку с данными о скидке, которая применяется к чеку.

#### Получить чек

```javascript
receipt.getReceipt()
```

Функция возвращает идентификатор чека в формате `uuid4` и JSON-объект с позициями чека.

#### Записать в чек дополнительные данные

```javascript
receipt.addReceiptExtra(extradata)
```

В аргументе функции требуется передать строку с дополнительными данными, которые добавятся к чеку.

### Работа с позициями чека

Позиция представляет JSON-объект с обязательным набором полей:

```JSON
{
  "uuid" : ,
  "productUuid" : ,
  "productCode" : ,
  "productType" : ,
  "name" : ,
  "measureName" : ,
  "measurePrecision" : ,
  "price" : ,
  "quantity" : ,
  "alcoholByVolume" : , //Поле обязательно только для алкоголя.
  "alcoholProductKindCode" : , //Поле обязательно только для алкоголя.
  "tareVolume" : , //Поле обязательно только для алкоголя.
  "mark" : //Поле обязательно только для маркированного алкоголя.
}
```

При добавлении (`addPosition()`) или редактировании (`editPosition()`) позиции, в аргументе метода требуется передать позицию в виде строки.

#### Добавить позицию в чек

```javascript
receipt.addPosition(position)
```

В аргументе функции требуется передать строку с данными позиции, которую требуется добавить в чек.

Пример добавления позиции метода:

```javascript
function processBeforePositionsEdited(actionData) {
var position = {
    "uuid" : "8e0ffg-lk3e-e93bnk-v0p41",
    "productUuid" : "trb44-i32lev-9833jf",
    "productCode" : "1024",
    "productType" : "NORMAL",
    "name" : "Example",
    "measureName" : "kg",
    "measurePrecision" : 0,
    "price" : "100",
    "quantity" : "1"
}
    receipt.addPosition(JSON.stringify(position));
}
```

{% include note.html content="Чтобы добавить позицию в чек, соответствующий плагин требуется подписать на [получение события](doc_app_integration_points.html#Callbacks) `evo.v2.receipt.sell.beforePositionsEdited`. Плагин требуется подписывать в [манифесете JS-приложения](doc_js_app_manifest.html)." %}

#### Редактировать позицию в чеке

```javascript
receipt.editPosition(position)
```

В аргументе функции требуется передать строку с данными позиции, которые требуется изменить.

#### Удалить позицию из чека

```javascript
receipt.removePosition(uuid)
```

В аргументе функции требуется передать строку с идентификатором позиции в формате `uuid4`, которую требуется удалить из чека.
