---
title: Работа с чеком
keywords:
summary:
sidebar: evotordoc_sidebar
permalink: doc_js_receipt_interactions.html
tags: [Терминал, JS]
folder: js_SDK
---

Вы можете взаимодействовать как с чеком продажи, так и с чеком возврата.

### Методы для работы с чеком

Для работы с чеком вызывайте указанные методы у объекта `receipt`.

#### Записать в чек дополнительные данные

```javascript
receipt.addReceiptExtra(extradata)
```

В аргументе функции требуется передать строку с дополнительными данными, которые добавятся к чеку.

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
