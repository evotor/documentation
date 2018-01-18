---
title: Чеки
keywords: react
sidebar: react_reference_sidebar
toc: true
permalink: react_reference_parameters_receipt.html
folder: react_reference
---

## Класс PositionAdd

```js
export class PositionAdd {
    constructor(position: Position) {}
}
```

## Класс PositionEdit

```js
export class PositionEdit {
    constructor(position: Position) {}
}
```

## Класс PositionRemove

```js
export class PositionRemove {
    constructor(positionUuid: string) {}
}
```

## Класс SetExtra {#setextra}

```js
export class SetExtra {
    constructor(extra: WritableObject) {}
}
```

## Класс SetPrintGroup

```js
export class SetPrintGroup {
    constructor(printGroup: PrintGroup | null,
                paymentPurposeIds: string[],
                positionUuids: string[]) {}
}
```

## Класс SetPrintExtra

```js
export class SetPrintExtra {
    constructor(printExtraPlace: PrintExtraPlace,
                printGroupId: string,
                printables: [PrintableText, PrintableBarcode, PrintableImage]) {}
}
```

## Класс ExtraKey

```js
export class ExtraKey {
    constructor(identity: string | null, appId: string | null, description: string | null) {}
}
```

## Класс Position {#position}

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

## Класс ReceiptHeader {#receiptheader}

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

## Класс PrintGroup

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

## Класс Payment

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

## Класс PrintReceipt {#printreceipt}

```js
export class PrintReceipt {
    constructor(printGroup: PrintGroup | null,
                positions: Position[],
                payments: Map<Payment, number>,
                changes: Map<Payment, number>) {}
}
```

## Класс Receipt

```js
export class Receipt {

    constructor(header: ReceiptHeader,
                printDocuments: PrintReceipt[]) {}
}
```

### Методы класса

#### getPositions

```js
getPositions(): Position[]
```

**Описание**

**Параметры**

**Возвращает**

#### getPayments
```js
getPayments(): Payment[]
```

**Описание**

**Параметры**

**Возвращает**
