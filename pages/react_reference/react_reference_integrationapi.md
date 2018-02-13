---
title: Интеграционные службы
keywords: react
sidebar: evotordoc_sidebar
toc: true
permalink: react_reference_integrationapi.html
tags: [terminal, react]
folder: react_reference
---

## Описание

С помощью интеграционных служб вы можете подписываться на события при формировании чека и вносить свои изменения.

{% include note.html content="Информацию о регистрации интеграционных служб смотрите в разделе [Инициализация служб](./react_reference_seviceapi.html)." %}

Изменения вносятся с помощью методов класса `IntegrationCallback`, экземпляр которого передаётся в каждый слушатель интеграционной службы.

## Методы класса IntegrationCallback

### onResult

```js
onResult(result: IntegrationServiceEventResult): Promise
```

**Описание**

Устанавливает результат события интеграционной службы.

**Параметры**

* `result` – [результат события интеграционной службы](./react_reference_integrationapi.html#IntegrationServiceEventResult).

**Возвращает**

* `Promise`

**Возможные ошибки**

* [`IntegrationError`](./doc_react_errorshandling.html#integrationerror)

### startActivity

```js
startActivity(intent: Intent): Promise
```

**Описание**

Запускает интеграционную операцию.

**Параметры**

* `intent`

**Возвращает**

* `Promise`

**Возможные ошибки**

* [`IntegrationError`](./doc_react_errorshandling.html#integrationerror)

### skip

```js
skip(): Promise
```

**Описание**

Завершает событие интеграционной службы без применения результата.

**Возвращает**

* `Promise`

**Возможные ошибки**

* [`IntegrationError`](./doc_react_errorshandling.html#integrationerror)

## Параметры

### Тип IntegrationServiceEventResult {#IntegrationServiceEventResult}

```js
export type IntegrationServiceEventResult =
    BeforePositionsEditedEventResult |
    ReceiptDiscountEventResult |
    PaymentSelectedEventResult |
    PrintGroupRequiredEventResult |
    PrintExtraRequiredEventResult;
```

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
