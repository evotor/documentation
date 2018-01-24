---
title: Receipt API
keywords: react
sidebar: evotordoc_sidebar
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
* `getter` – функция для [получения данных](./doc_react_getter.html). Тип данных – [`Position[]`](./react_reference_receiptapi.html#position).

**Возвращает**

### openReceipt

```js
static openReceipt(positions: Position[], extra: SetExtra | null): Promise
```

**Описание**

Открывает чек, сформированный в смарт-терминале.

**Параметры**

* `positions` – [массив позиций](./react_reference_receiptapi.html#position).
* `extra` – указывает наличие [дополнительных полей](./react_reference_receiptapi.html#setextra) в чеке.

**Возвращает**

### sendElectronReceipt

```js
static sendElectronReceipt(printReceipts: PrintReceipt[],
                   extra: SetExtra | null,
                   phone: string | null,
                   email: string | null,
                   discount: number | null,
                   resultGetter: ((string) => void) | null): Promise
```

**Описание**

Передаёт чек, сформированный в приложении, в смарт-терминал.

**Параметры**

* `printReceipts` – [массив](./react_reference_receiptapi.html#printreceipt)
* `extra` – указывает наличие [дополнительных полей](./react_reference_receiptapi.html#setextra) в чеке.
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
* `getter` – функция для [получения данных](./doc_react_getter.html). Тип данных – [`Receipt`](./react_reference_receiptapi.html#receipt).

**Возвращает**

### getReceiptByUuid

```js
static getReceiptByUuid(uuid: string, getter: (Receipt | null) => void): void
```

**Описание**

Получает чек по идентификатору (`uuid`).

**Параметры**

* `uuid` – идентификатор чека. Строка.
* `getter` – функция для [получения данных](./doc_react_getter.html). Тип данных – [`Receipt`](./react_reference_receiptapi.html#receipt).

**Возвращает**

### getReceiptHeaders

```js
static getReceiptHeaders(type: ReceiptType | null, getter: (ReceiptHeader[]) => void): void
```

**Описание**

Получает заголовки чека.

**Параметры**

* `type` – тип чека: чек продажи (`SELL`) или чек возврата (`PAYBACK`).
* `getter` – функция для [получения данных](./doc_react_getter.html). Тип данных – [`ReceiptHeader[]`](./react_reference_receiptapi.html#receiptheader).

**Возвращает**


## Параметры

### Изменение чека

#### Класс PositionAdd

```js
export class PositionAdd {
    constructor(position: Position) {}
}
```

#### Класс PositionEdit

```js
export class PositionEdit {
    constructor(position: Position) {}
}
```

#### Класс PositionRemove

```js
export class PositionRemove {
    constructor(positionUuid: string) {}
}
```

### Содержимое чека

#### Класс SetExtra {#setextra}

```js
export class SetExtra {
    constructor(extra: WritableObject) {}
}
```

#### Класс SetPrintGroup

```js
export class SetPrintGroup {
    constructor(printGroup: PrintGroup | null,
                paymentPurposeIds: string[],
                positionUuids: string[]) {}
}
```

#### Класс SetPrintExtra

```js
export class SetPrintExtra {
    constructor(printExtraPlace: PrintExtraPlace,
                printGroupId: string,
                printables: [PrintableText, PrintableBarcode, PrintableImage]) {}
}
```

#### Класс ExtraKey

```js
export class ExtraKey {
    constructor(identity: string | null, appId: string | null, description: string | null) {}
}
```

#### Класс Position {#position}

```js
export class Position {
    constructor(uuid: string,
                productUuid: string | null,
                productCode: string | null,
                productType: ProductType,
                name: string,
                measureName: string,
                measurePrecision: number,
                taxNumber: TaxNumber | null,
                price: number,
                priceWithDiscountPosition: number,
                quantity: number,
                barcode: string | null,
                mark: string,
                alcoholByVolume: number | null,
                alcoholProductKindCode: number | null,
                tareVolume: number | null,
                extraKeys: ExtraKey[],
                subPositions: Position[]) {}
}
```

#### Класс ReceiptHeader {#receiptheader}

```js
export class ReceiptHeader {
    constructor(uuid: string,
                number: string | null,
                type: ReceiptType,
                date: string | null,
                clientEmail: string | null,
                clientPhone: string | null,
                extra: string | null) {}
}
```

#### Класс PrintGroup

```js
export class PrintGroup {
    constructor(identifier: string | null,
                type: PrintGroupType | null,
                orgName: string | null,
                orgInn: string | null,
                orgAddress: string | null,
                taxationSystem: TaxationSystem | null,
                shouldPrintReceipt: boolean) {}
}
```

#### Класс Payment {#payment}

```js
export class Payment {
    constructor(uuid: string,
                value: number,
                system: PaymentSystem | null,
                purposeIdentifier: string | null,
                accountId: string | null,
                accountUserDescription: string | null) {}
}
```

#### Класс PrintReceipt {#printreceipt}

```js
export class PrintReceipt {
    constructor(printGroup: PrintGroup | null,
                positions: Position[],
                payments: Map<Payment, number>,
                changes: Map<Payment, number>) {}
}
```

#### Класс Receipt {#receipt}

```js
export class Receipt {

    constructor(header: ReceiptHeader,
                printDocuments: PrintReceipt[]) {}
}
```

#### Методы класса

##### getPositions

```js
getPositions(): Position[]
```

**Описание**

Возвращает массив позиций, добавленных в чек.

**Параметры**

**Возвращает**

Метод возвращает [`Position[]`](./react_reference_receiptapi.html#position).

##### getPayments
```js
getPayments(): Payment[]
```

**Описание**

Возвращает массив платежей, с помощью которых оплачен чек.

**Параметры**

**Возвращает**

Метод возвращает [`Payment[]`](./react_reference_receiptapi.html#payment)

#### Класс PaymentPurpose

```js
export class PaymentPurpose {
    constructor(identifier: string | null,
                paymentSystemId: string | null,
                total: number | null,
                accountId: string | null,
                userMessage: string | null) {}
}
```

#### Класс PaymentSystem

```js
export class PaymentSystem {
    constructor(paymentType: PaymentType, userDescription: string, paymentSystemId: string) {}
}
```

#### Тип ReceiptType

```js
export enum ReceiptType {
    SELL = "SELL",
    PAYBACK = "PAYBACK"
}
```

#### Тип TaxNumber

```js
export enum TaxNumber {
    VAT_18 = "VAT_18",
    VAT_10 = "VAT_10",
    NO_VAT = "NO_VAT",
    VAT_18_118 = "VAT_18_118",
    VAT_10_110 = "VAT_10_110",
    VAT_0 = "VAT_0"
}
```

#### Тип TaxationSystem

```js
export enum TaxationSystem {
    COMMON = "COMMON",
    SIMPLIFIED_INCOME = "SIMPLIFIED_INCOME",
    SIMPLIFIELD_INCOME_OUTCOME = "SIMPLIFIELD_INCOME_OUTCOME",
    SINGLE_IMPUTED_INCOME = "SINGLE_IMPUTED_INCOME",
    SINGLE_AGRICULTURE = "SINGLE_AGRICULTURE",
    PATENT = "PATENT"
}
```

#### Тип PrintGroupType

```js
export enum PrintGroupType {
    CASH_RECEIPT = "CASH_RECEIPT",
    INVOICE = "INVOICE",
    string_UTII = "string_UTII"
}
```

#### Тип PrintExtraPlace

```js
export enum PrintExtraPlace {
    PrintExtraPlacePrintGroupTop = "PrintExtraPlacePrintGroupTop",
    PrintExtraPlacePrintGroupHeader = "PrintExtraPlacePrintGroupHeader",
    PrintExtraPlacePrintGroupSummary = "PrintExtraPlacePrintGroupSummary",
    PrintExtraPlacePositionFooter = "PrintExtraPlacePositionFooter",
    PrintExtraPlacePositionAllSubpositionsFooter = "PrintExtraPlacePositionAllSubpositionsFooter"
}
```

#### Тип PaymentType

```js
export enum PaymentType {
    UNKNOWN = "UNKNOWN",
    CASH = "CASH",
    ELECTRON = "ELECTRON"
}
```
