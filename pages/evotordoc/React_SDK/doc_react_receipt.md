---
title: Работа с чеком
keywords:
summary:
sidebar: evotordoc_sidebar
permalink: doc_react_receipt.html
tags: [terminal, react]
folder: react_SDK
published: false
---

## Методы

### Получить по штрихкоду позицию для добавления в чек

```javascript
static getAllBarcodesForProduct(productUuid: String, callback: Function) {
    InventoryModule.getAllBarcodesForProduct(productUuid, callback);
}
```

### Открыть чек в приложении

```javascript
static openReceipt(positions: [Position], extra: SetExtra) {
    ReceiptModule.openReceipt(positions, extra);
}
```

### Отправить чек

```javascript
static sendReceipt(printReceipts: [Receipt.PrintReceipt], extra: SetExtra, phone: String, email: String, discount: Number, success: Function, error: Function) {
    ReceiptModule.sendReceipt(printReceipts, extra, phone, email, discount, success, error);
}
```

### Получить сформированный чек

```javascript
static getReceipt(findBy: Receipt.FindBy, value: Receipt.Type | String, callback: Function) {
    ReceiptModule.getReceipt(findBy, value, callback);
}
```

### Получить позиции сформированного чека

```javascript
static getPositions(findBy: Receipt.FindBy, value: Receipt.Type | String, callback: Function) {
    ReceiptModule.getPositions(findBy, value, callback);
}
```

### Получить getPayments

```javascript
static getPayments(findBy: Receipt.FindBy, value: Receipt.Type | String, callback: Function) {
    ReceiptModule.getPayments(findBy, value, callback);
}
```

### Получить заголовки сформированного чека

```javascript
static getReceiptHeaders(type: Receipt.Type, callback: Function) {
    ReceiptModule.getReceiptHeaders(type, callback);
}
```

## Пример

В примере представлены все методы, доступные в API.

```javascript

```
