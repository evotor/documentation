---
title: Receipt API
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

Получает товарную позицию по значению штрихкода.

**Параметры**

* `barcode`
* `getter`

**Возвращает**

### openReceipt

```js
static openReceipt(positions: Position[], extra: SetExtra | null): void
```

**Описание**

Открывает чек, сформированный в смарт-терминале.

**Параметры**

* `positions`
* `extra`

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

Передаёт чек, сформированный в приложении, в смарт-терминал.

**Параметры**

* `printReceipts`
* `extra`
* `phone`
* `email`
* `discount`
* `onSuccess`
* `onError`

**Возвращает**

### getReceiptByType

```js
static getReceiptByType(type: ReceiptType, getter: (Receipt | null) => void): void
```

**Описание**

Получает чек по типу: чек продажи (`SELL`) или чек возврата (`PAYBACK`).

**Параметры**

* `type`
* `getter`

**Возвращает**

### getReceiptByUuid

```js
static getReceiptByUuid(uuid: string, getter: (Receipt | null) => void): void
```

**Описание**

Получает чек по идентификатору (`uuid`).

**Параметры**

* `uuid`
* `getter`

**Возвращает**

### getReceiptHeaders

```js
static getReceiptHeaders(type: ReceiptType | null, getter: (ReceiptHeader[]) => void): void
```

**Описание**

Получает заголовки чека.

**Параметры**

* `type`
* `getter`

**Возвращает**
