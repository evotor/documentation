---
title: ReceiptAPI
keywords: react
sidebar: evotordoc_sidebar
toc: true
permalink: react_reference_receiptapi.html
folder: react_reference
---

## Описание

С помощью методов класса приложения получают данные о позициях для добавления в чек, получать чеки по `uuid`, а также получать заголовки чеков. Используя методы класса приложения также могут передавать чек для оплаты в смарт-терминале и отправить чек на email или телефон.

## Методы

### getPositionByBarcode

```js
static getPositionByBarcode(barcode: string): Promise<Position[]>
```

**Описание**

Получает массив позиций чека по значению штрихкода.

**Параметры**

* `barcode`– штрихкод товара.

**Возвращает**

* `Promise`, результат которого, –  массив [позиций](./react_reference_receiptapi.html#position).

### openReceipt

```js
static openReceipt(positions: Position[], extra: SetExtra | null): Promise
```

**Описание**

Открывает чек, сформированный в смарт-терминале.

**Параметры**

* `positions` – массив [позиций](./react_reference_receiptapi.html#position).
* `extra` – указывает наличие [дополнительных полей](./react_reference_receiptapi.html#setextra) в чеке.

**Возвращает**

* `Promise`

### sendElectronReceipt

```js
static sendElectronReceipt(printReceipts: PrintReceipt[],
                   extra: SetExtra | null,
                   phone: string | null,
                   email: string | null,
                   discount: number | null): Promise<string>
```

**Описание**

Передаёт чек, сформированный в приложении, в смарт-терминал.

**Параметры**

* `printReceipts` – массив [печатных форм чека](./react_reference_receiptapi.html#printreceipt).
* `extra` – указывает наличие [дополнительных полей](./react_reference_receiptapi.html#setextra) в чеке.
* `phone` – телефонный номер покупателя.
* `email` – адрес электронной почты покупателя.
* `discount` – скидка на чек.

**Возвращает**

* `Promise`, результат которого, –  строка.

### getReceiptByType

```js
static getReceiptByType(type: ReceiptType): Promise<Receipt | null>
```

**Описание**

Получает чек по типу: чек продажи (`SELL`) или чек возврата (`PAYBACK`).

**Параметры**

* `type` – [тип чека](./react_reference_receiptapi.html#receipttype).

**Возвращает**

* `Promise`, результат которого, –  [чек](./react_reference_receiptapi.html#receipt) или `null`.

### getReceiptByUuid

```js
static getReceiptByUuid(uuid: string): Promise<Receipt | null>
```

**Описание**

Получает чек по идентификатору (`uuid`).

**Параметры**

* `uuid` – идентификатор чека.

**Возвращает**

* `Promise`, результат которого, –  [чек](./react_reference_receiptapi.html#receipt) или `null`.

### getReceiptHeaders

```js
static getReceiptHeaders(type: ReceiptType | null): Promise<ReceiptHeader[]>
```

**Описание**

Получает заголовки чека.

**Параметры**

* `type` – тип чека: чек продажи (`SELL`) или чек возврата (`PAYBACK`).

**Возвращает**

* `Promise`, результат которого, –  массив [заголовков чека](./react_reference_receiptapi.html#receiptheader).

## Параметры

### Класс PositionAdd

```js
export class PositionAdd extends AbstractBundlable {
    constructor(position: Position) {}
}
```

**См. также**

* [`Position`](./react_reference_receiptapi.html#position)


### Класс PositionEdit

```js
export class PositionEdit extends AbstractBundlable {
    constructor(position: Position) {}
}
```

**См. также**

* [`Position`](./react_reference_receiptapi.html#position)

### Класс PositionRemove

```js
export class PositionRemove extends AbstractBundlable {
    constructor(positionUuid: string) {}
}
```

### Класс SetExtra {#setextra}

```js
export class SetExtra extends AbstractBundlable {
    constructor(extra: Object) {}
}
```

### Класс SetPrintGroup {#SetPrintGroup}

```js
export class SetPrintGroup extends AbstractBundlable {
    constructor(printGroup: PrintGroup | null,
                paymentPurposeIds: string[],
                positionUuids: string[]) {}
}
```

**См. также**

* [`PrintGroup`](./react_reference_receiptapi.html#PrintGroup)

### Класс SetPrintExtra {#SetPrintExtra}

```js
export class SetPrintExtra extends AbstractBundlable {
    constructor(printExtraPlace: PrintExtraPlace,
                printables: Printable[]) {}
}
```

**См. также**

* [`Printable`](./react_reference_devicesprinter.html#printable)

### Тип PrintExtraPlace

```js
export type PrintExtraPlace =
    PrintExtraPlacePrintGroupTop |
    PrintExtraPlacePrintGroupHeader |
    PrintExtraPlacePrintGroupSummary |
    PrintExtraPlacePositionFooter |
    PrintExtraPlacePositionAllSubpositionsFooter;
```

### Класс PrintExtraPlacePrintGroupTop

```js
export class PrintExtraPlacePrintGroupTop {
    constructor(printGroupId?: string) {}
}
```

### Класс PrintExtraPlacePrintGroupHeader

```js
export class PrintExtraPlacePrintGroupHeader {
    constructor(printGroupId?: string) {}
}
```

### Класс PrintExtraPlacePrintGroupSummary

```js
export class PrintExtraPlacePrintGroupSummary {
    constructor(printGroupId?: string) {}
}
```

### Класс PrintExtraPlacePositionFooter

```js
export class PrintExtraPlacePositionFooter {
    constructor(positionUuid?: string) {}
}
```

### Класс PrintExtraPlacePositionAllSubpositionsFooter

```js
export class PrintExtraPlacePositionAllSubpositionsFooter {
    constructor(positionUuid?: string) {}
}
```

### Класс ExtraKey {#ExtraKey}

```js
export class ExtraKey {
    constructor(identity: string | null, appId: string | null, description: string | null) {}
}
```

### Класс Position {#position}

```js
export class Position {
    constructor(uuid: string | null,
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
                mark: string | null,
                alcoholByVolume: number | null,
                alcoholProductKindCode: number | null,
                tareVolume: number | null,
                extraKeys: ExtraKey[],
                subPositions: Position[]) {}
}
```

**См. также**

* [`ProductType`](./react_reference_inventoryapi.html#ProductType)
* [`TaxNumber`](./react_reference_receiptapi.html#TaxNumber)
* [`ExtraKey`](./react_reference_receiptapi.html#ExtraKey)

### Класс ReceiptHeader {#receiptheader}

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

**См. также**

* [`ReceiptType`](./react_reference_receiptapi.html#receipttype)

### Класс PrintGroup {#PrintGroup}

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

**См. также**

* [`PrintGroupType`](./react_reference_receiptapi.html#PrintGroupType)
* [`TaxationSystem`](./react_reference_receiptapi.html#TaxationSystem)

### Класс Payment {#payment}

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

**См. также**

* [`PaymentSystem`](./react_reference_receiptapi.html#PaymentSystem)

### Класс PrintReceipt {#printreceipt}

```js
export class PrintReceipt {
    constructor(printGroup: PrintGroup | null,
                positions: Position[],
                payments: Map<Payment, number>,
                changes: Map<Payment, number>) {}
}
```

**См. также**

* [`PrintGroup`](./react_reference_receiptapi.html#PrintGroup)
* [`Position`](./react_reference_receiptapi.html#position)

### Класс Receipt {#receipt}

```js
export class Receipt {

    constructor(header: ReceiptHeader,
                printDocuments: PrintReceipt[]) {}
}
```

**См. также**

* [`ReceiptHeader`](./react_reference_receiptapi.html#receiptheader)
* [`PrintReceipt`](./react_reference_receiptapi.html#printreceipt)

#### Методы класса

##### getPositions

```js
getPositions(): Position[]
```

**Описание**

Возвращает массив позиций, добавленных в чек.

**Возвращает**

Метод возвращает массив [позиций](./react_reference_receiptapi.html#position).

##### getPayments
```js
getPayments(): Payment[]
```

**Описание**

Возвращает массив платежей, с помощью которых оплачен чек.

**Возвращает**

Метод [массив платежей](./react_reference_receiptapi.html#payment)

### Класс PaymentPurpose {#PaymentPurpose}

```js
export class PaymentPurpose {
    constructor(identifier: string | null,
                paymentSystemId: string | null,
                total: number,
                accountId: string | null,
                userMessage: string | null) {}
}
```

### Класс PaymentSystem {#PaymentSystem}

```js
export class PaymentSystem {
    constructor(paymentType: PaymentType, userDescription: string, paymentSystemId: string) {}
}
```

**См. также**

* [`PaymentType`](./react_reference_receiptapi.html#PaymentType)

### Перечисление ReceiptType {#receipttype}

```js
export enum ReceiptType {
    SELL = "SELL",
    PAYBACK = "PAYBACK"
}
```

### Перечисление TaxNumber {#TaxNumber}

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

### Перечисление TaxationSystem {#TaxationSystem}

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

### Перечисление PrintGroupType {#PrintGroupType}

```js
export enum PrintGroupType {
    CASH_RECEIPT = "CASH_RECEIPT",
    INVOICE = "INVOICE",
    string_UTII = "string_UTII"
}
```

### Перечисление PaymentType {#PaymentType}

```js
export enum PaymentType {
    UNKNOWN = "UNKNOWN",
    CASH = "CASH",
    ELECTRON = "ELECTRON"
}
```

### Перечисление PaymentSystemOperationType {#PaymentSystemOperationType}

```js
export enum PaymentSystemOperationType {
    SELL = "SELL",
    SELL_CANCEL = "SELL_CANCEL",
    PAYBACK = "PAYBACK",
    PAYBACK_CANCEL = "PAYBACK_CANCEL"
}
```
