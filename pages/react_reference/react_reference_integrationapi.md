---
title: Интеграционные службы
keywords: react
sidebar: evotordoc_sidebar
toc: true
permalink: react_reference_integrationapi.html#
folder: react_reference
---

## Описание

С помощью интеграционных служб вы можете подписываться на события при формировании чека и вносить свои изменения.

{% include note.html content="Информацию о регистрации интеграционных служб смотрите в разделе [Инициализация служб](./react_reference_seviceapi.html)." %}

## Применение результата

### onResult

```js
onResult(result: IntegrationEventResult): Promise
```

**Описание**

**Параметры**

* `result`

**Возвращает**

* `Promise`

**Возможные ошибки**

* [`IntegrationError`](./doc_react_errorshandling.html#integrationerror)

### startActivity

```js
startActivity(intent: Intent): Promise
```

**Описание**

Запускает операцию при получении намерения.

**Параметры**

* `Intent`

**Возвращает**

* `Promise`

**Возможные ошибки**

* [`IntegrationError`](./doc_react_errorshandling.html#integrationerror)

### skip

```js
skip(): Promise
```

**Описание**

**Возвращает**

* `Promise`

**Возможные ошибки**

* [`IntegrationError`](./doc_react_errorshandling.html#integrationerror)

## Параметры

### Класс BeforePositionsEditedEventResult

```js
export class BeforePositionsEditedEventResult {
    constructor(changes: PositionChange[] | null, extra: SetExtra | null) {}
}
```

**См. также**

* [`PositionChange`](./react_reference_integrationapi.html#PositionChange)

### Класс ReceiptDiscountEventResult

```js
export class ReceiptDiscountEventResult {
    constructor(discount: number, extra: SetExtra | null, changes: PositionChange[]) {}
}
```

**См. также**

* [`SetExtra`](./react_reference_receiptapi.html#setextra)
* [`PositionChange`](./react_reference_integrationapi.html#PositionChange)

### Класс PaymentSelectedEventResult

```js
export class PaymentSelectedEventResult {
    constructor(extra: SetExtra | null, paymentParts: PaymentPurpose[]) {}
}
```

**См. также**

* [`SetExtra`](./react_reference_receiptapi.html#setextra)
* [`PaymentPurpose`](./react_reference_receiptapi.html#PaymentPurpose)


### Класс PrintGroupRequiredEventResult

```js
export class PrintGroupRequiredEventResult {
    constructor(extra: SetExtra | null, setPrintGroups: SetPrintGroup[]) {}
}
```

**См. также**

* [`SetExtra`](./react_reference_receiptapi.html#setextra)
* [`SetPrintGroup`](./react_reference_receiptapi.html#SetPrintGroup)

### Класс PrintExtraRequiredEventResult

```js
export class PrintExtraRequiredEventResult {
    constructor(extra: SetPrintExtra[]) {}
}
```

**См. также**

* [`SetPrintExtra`](./react_reference_receiptapi.html#SetPrintExtra)

### Тип PositionChange {#PositionChange}

```js
export type PositionChange = PositionAdd | PositionEdit | PositionRemove
```
