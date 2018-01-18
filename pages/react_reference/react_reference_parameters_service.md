---
title: User API
keywords: react
sidebar: react_reference_sidebar
toc: true
permalink: react_reference_parameters_service.html
folder: react_reference
---

## Класс BeforePositionsEditedEventResult

```js
export class BeforePositionsEditedEventResult {
    constructor(changes: PositionChange[] | null, extra: SetExtra | null) {}
}
```

## Класс ReceiptDiscountEventResult

```js
export class ReceiptDiscountEventResult {
    constructor(discount: number, extra: SetExtra | null, changes: PositionChange[]) {}
}
```

## Класс PaymentSelectedEventResult

```js
export class PaymentSelectedEventResult {
    constructor(extra: SetExtra | null, paymentParts: PaymentPurpose[]) {}
}
```

## Класс PrintGroupRequiredEventResult

```js
export class PrintGroupRequiredEventResult {
    constructor(extra: SetExtra | null, setPrintGroups: SetPrintGroup[]) {}
}
```

## Класс PrintExtraRequiredEventResult

```js
export class PrintExtraRequiredEventResult {
    constructor(extra: SetPrintExtra[]) {}
}
```

## Класс BroadcastEvent

```js
export class BroadcastEvent {
    constructor(action: string, total: string | null, uuid: string | null) {}
}
```
