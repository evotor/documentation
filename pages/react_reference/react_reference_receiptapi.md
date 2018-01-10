---
title:
keywords: react
sidebar: react_reference_sidebar
toc: true
permalink: react_reference_receiptapi.html
folder: react_reference
---

## Описание

## Методы

### getPositionByBarcode

```js
static getPositionByBarcode(barcode: string, getter: (Position[]) => void): void
```

**Описание**

Получить това

**Параметры**

* `barcode` –
* `getter` –

**Возвращает**

### openReceipt

```js
static openReceipt(positions: Position[], extra: SetExtra | null): void
```

**Описание**

**Параметры**

**Возвращает**

### sendReceipt

```js
static sendReceipt(printReceipts: PrintReceipt[],
                   extra: SetExtra | null,
                   phone: string | null,
                   email: string | null,
                   discount: Number | null,
                   onSuccess: ((string) => void) | null,
                   onError: ((string) => void) | null)
```

**Описание**

**Параметры**

**Возвращает**

### getReceiptByType

```js
static getReceiptByType(type: ReceiptType, getter: (Receipt | null) => void): void
```

**Описание**

**Параметры**

**Возвращает**

### getReceiptByUuid

```js
static getReceiptByUuid(uuid: string, getter: (Receipt | null) => void): void
```

**Описание**

**Параметры**

**Возвращает**

### getReceiptHeaders

```js
static getReceiptHeaders(type: ReceiptType | null, getter: (ReceiptHeader[]) => void): void
```

**Описание**

**Параметры**

**Возвращает**
