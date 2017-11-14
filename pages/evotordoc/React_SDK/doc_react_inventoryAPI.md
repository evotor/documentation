---
title: Работа с товарами
keywords:
summary:
sidebar: evotordoc_sidebar
permalink: doc_react_inventoryAPI.html
tags: [terminal, react]
folder: react_SDK
published: false
---

Приведённые ниже методы, соответствуют методам описанным в разделе [Java SDK](./doc_java_inventory.html)

## Методы

### Получить все штрихкоды товара

```javascript
static getAllBarcodesForProduct(productUuid: String, callback: Function) {
    InventoryModule.getAllBarcodesForProduct(productUuid, callback);
}
```

### Получить товар по идентификатору

```javascript
static getProductByUuid(uuid: String, callback: Function) {
    InventoryModule.getProductByUuid(uuid, callback);
}
```

### Получить возможные дополнительные поля

```javascript
static getField(fieldUuid: String, callback: Function) {
    InventoryModule.getField(fieldUuid, callback);
}
```

### Получить значения дополнительных полей товара

```javascript
static getProductExtras(productUuid: String, callback: Function) {
    InventoryModule.getProductExtras(productUuid, callback);
}
```


## Пример

В примере представлены все методы, доступные в API.

```javascript

```
