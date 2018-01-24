---
title: IntegrationServices
keywords: react
sidebar: evotordoc_sidebar
toc: true
permalink: react_reference_integrationapi.html
folder: react_reference
---

## Описание

## Методы

### onResult

```js
onResult(result: IntegrationEventResult): Promise
```

**Описание**

**Параметры**

**Возвращает**

### startActivity

```js
startActivity(intent: Intent): Promise
```

**Описание**

Запускает операцию при получении намерения.

**Параметры**

`intent`

**Возвращает**

### skip

```js
skip(): Promise
```

**Описание**

**Параметры**

**Возвращает**

### addEventListener

```js
static addEventListener(type: IntegrationEventType, listener: IntegrationEventListener, isGlobal: boolean = true): void
```

**Описание**

Регистрирует слушатель и [подписывает приложение на события](./doc_react_events_subscription.html).

**Параметры**

* `type` – тип события. Для получения данных от интеграционных служб указывайте тип [`IntegrationEventType`](./react_reference_integrationapi.html#IntegrationEventType).
* `listener` – тип слушателя. Для получения данных от интеграционных служб указывайте тип `IntegrationEventListener`.
* `isGlobal` – указывает глобальную доступность метода. По умолчанию `true`.

**Возвращает**

### removeEventListener

```js
static removeEventListener(type: IntegrationEventType, listener: IntegrationEventListener): boolean
```

**Описание**

Удаляет слушатель и отменяет [подписку на события](./doc_react_events_subscription.html).

**Параметры**

* `type` – тип события. Для отмены получения данных от интеграционных служб указывайте тип [`IntegrationEventType`](./react_reference_integrationapi.html#IntegrationEventType).
* `listener` – тип слушателя. Для отмены получения данных от интеграционных служб указывайте тип `IntegrationEventListener`. Не передавайте параметр если хотите удалить все слушатели.

**Возвращает**

* `true` – если слушатель удалён.
* `false` – если слушатель не удалён.

## Параметры

### Класс BeforePositionsEditedEventResult

```js
export class BeforePositionsEditedEventResult {
    constructor(changes: PositionChange[] | null, extra: SetExtra | null) {}
}
```

### Класс ReceiptDiscountEventResult

```js
export class ReceiptDiscountEventResult {
    constructor(discount: number, extra: SetExtra | null, changes: PositionChange[]) {}
}
```

### Класс PaymentSelectedEventResult

```js
export class PaymentSelectedEventResult {
    constructor(extra: SetExtra | null, paymentParts: PaymentPurpose[]) {}
}
```

### Класс PrintGroupRequiredEventResult

```js
export class PrintGroupRequiredEventResult {
    constructor(extra: SetExtra | null, setPrintGroups: SetPrintGroup[]) {}
}
```

### Класс PrintExtraRequiredEventResult

```js
export class PrintExtraRequiredEventResult {
    constructor(extra: SetPrintExtra[]) {}
}
```

### Класс IntegrationError {#IntegrationError}

```js
export class IntegrationError extends Error {
    constructor(message: string) {}
}
```

### Тип IntegrationEventType {#IntegrationEventType}

```js
export enum IntegrationEventType {
    BEFORE_POSITIONS_EDITED = "BEFORE_POSITIONS_EDITED",
    RECEIPT_DISCOUNT = "RECEIPT_DISCOUNT",
    PAYMENT_SELECTED = "PAYMENT_SELECTED",
    PRINT_GROUP_REQUIRED = "PRINT_GROUP_REQUIRED",
    PRINT_EXTRA_REQUIRED = "PRINT_EXTRA_REQUIRED"
}
```
