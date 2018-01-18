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

* `barcode`– штрихкод товара. Строка.
* `getter` – функция, в параметры которой передаётся массив [позиций](./react_reference_parameters_receipt.html#position).

**Возвращает**

### openReceipt

```js
static openReceipt(positions: Position[], extra: SetExtra | null): void
```

**Описание**

Открывает чек, сформированный в смарт-терминале.

**Параметры**

* `positions` – массив [позиций](./react_reference_parameters_receipt.html#position).
* `extra` – указывает наличие [дополнительных полей](./react_reference_parameters_receipt.html#setextra) в чеке.

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

* `printReceipts` – [массив](./react_reference_parameters_receipt.html#printreceipt)
* `extra` – указывает наличие [дополнительных полей](./react_reference_parameters_receipt.html#setextra) в чеке.
* `phone` – телефонный номер покупателя. Строка.
* `email` – адрес электронной почты покупателя. Строка.
* `discount` – скидка на чек. Число.
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

* `type` – тип чека: чек продажи (`SELL`) или чек возврата (`PAYBACK`).
* `getter` – функция, в параметры которой передаётся чек.

**Возвращает**

### getReceiptByUuid

```js
static getReceiptByUuid(uuid: string, getter: (Receipt | null) => void): void
```

**Описание**

Получает чек по идентификатору (`uuid`).

**Параметры**

* `uuid` – идентификатор чека. Строка.
* `getter` – функция, в параметры которой передаётся чек.

**Возвращает**

### getReceiptHeaders

```js
static getReceiptHeaders(type: ReceiptType | null, getter: (ReceiptHeader[]) => void): void
```

**Описание**

Получает заголовки чека.

**Параметры**

* `type` – тип чека: чек продажи (`SELL`) или чек возврата (`PAYBACK`).
* `getter` – функция, в параметры которой передаётся массив [заголовков чека](./react_reference_parameters_receipt.html#receiptheader).

**Возвращает**
