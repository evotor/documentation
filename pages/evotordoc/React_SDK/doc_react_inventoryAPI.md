---
title: Товароучёт
keywords:
summary:
sidebar: evotordoc_sidebar
permalink: doc_react_inventoryAPI.html
tags: [terminal, react]
folder: react_SDK
published: true
---
В разделе приведены методы для работы с базой товаров на смарт-терминале. Методы React Native обращаются к Java интерфейсу описанному в разделе ["Товароучёт"](./doc_java_inventory.html).

## Методы

### Получить все штрихкоды товара

```javascript
static getAllBarcodesForProduct(productUuid: string, callback: (string[]) => void) {
    InventoryModule.getAllBarcodesForProduct(productUuid, callback);
}
```

### Получить товар по идентификатору

```javascript
static getProductByUuid(uuid: string, callback: (ProductItem | null) => void) {
    InventoryModule.getProductByUuid(uuid, callback);
}
```

Где `ProductItem` – экземпляр класса с [данными о товаре](./doc_react_inventoryAPI.html#productItemData).

### Получить возможные дополнительные поля

```javascript
static getField(fieldUuid: string, callback: (Field | null) => void) {
    InventoryModule.getField(fieldUuid, callback);
}
```

Где `ProductItem` – экземпляр класса с [данными о дополнительном поле](./doc_react_inventoryAPI.html#fieldData).

### Получить значения дополнительных полей товара

```javascript
static getProductExtras(productUuid: string, callback: (ProductExtra[]) => void) {
    InventoryModule.getProductExtras(productUuid, callback);
}
```

Где `ProductItem` – экземпляр класса со [значениями дополнительного поля](./doc_react_inventoryAPI.html#productExtraData).

## Возвращаемые данные

### Данные о товаре {#productItemData}

```javascript
class ProductItem {
    constructor(uuid: string,
                parentUuid: string | null,
                code: string,
                name: string) {
        this.uuid = uuid;//Идентификатор товара в формате uuid4.
        this.parentUuid = parentUuid;//Идентификатор группы к которой принадлежит товар в формате uuid4.
        this.code = code;//Код товара из 1С.
        this.name = name;//Имя товара.
    }
};
```

### Данные о дополнительных полях {#fieldData}

```javascript
class Field {
    constructor(name: string | null,
                fieldUUID: string,
                title: string | null,
                type: string) {
        this.name = name;//Имя поля.
        this.fieldUUID = fieldUUID;//Идентификатор поля в формате uuid4.
        this.title = title;//Заголовок, который отображается в интерфейсе смарт-терминала.
        this.type = type//Тип поля: TEXT_FIELD или DICTIONARY_FIELD.
    }
};
```

### Значение дополнительного поля {#productExtraData}

```javascript
class ProductExtra {
    constructor(uuid: string,
                name: string | null,
                commodityUUID: string,
                fieldUUID: string,
                fieldValue: string | null,
                data: string) {
        this.uuid = uuid;//Идентификатор значения дополнительного поля товара в формате uuid4.
        this.name = name;//Имя дополнительного поля товара.
        this.commodityUUID = commodityUUID;//Идентификатор товара в формате uuid4.
        this.fieldUUID = fieldUUID;//Идентификатор дополнительного поля товара в формате uuid4.
        /**
        fieldValue – строка содержащая значение дополнительного поля в определенном формате:
        для текстового поля (TEXT_FIELD) – строка обрамленная кавычками (“785af1da-4053-4214-abd6-71c9cd4b5800”).
        для поля из словаря (DICTIONARY_FIELD) – массив uuid элементов ([“61bff019-5040-40cd-bedf-d854ac935f6c”,”b993bd2a-8f6a-4fbc-b916-2d9786cd5def”]).
        **/
        this.fieldValue = fieldValue
        this.data = data;//Дополнительные данные от приложения.
    }
};
```

## Пример

В примере представлены все методы, доступные в API.

```javascript

```
