---
title: Работа с чеком
keywords:
summary:
sidebar: evotordoc_sidebar
permalink: doc_js_receipt_interactions.html
tags: [Терминал, JS]
folder: js_SDK
---

### Функции для работы с чеком

#### Записать в чек дополнительные данные

```javascript
addReceiptExtra()
```

В аргументе функции требуется передать строку с дополнительными данными, которые добавятся к чеку.

#### Добавить позицию в чек

```javascript
addPosition()
```

В аргументе функции требуется передать строку с данными позиции, которую требуется добавить в чек.

Пример использования метода:

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
editPosition()
```

В аргументе функции требуется передать строку с данными позиции, которые требуется изменить.

#### Удалить позицию из чека

```javascript
removePosition()
```

В аргументе функции требуется передать строку с идентификатором позиции в формате `uuid4`, которую требуется удалить из чека.

#### Задать скидку на чек

```javascript
applyReceiptDiscount()
```

В аргументе функции требуется передать строку с данными о скидке, которая применяется к чеку.

#### Получить чек

```javascript
getReceipt()
```

Функция возвращает строку с идентификатором чека в формате `uuid4`.
