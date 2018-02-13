---
title: Класс ServiceAPI
keywords: react
sidebar: evotordoc_sidebar
toc: true
permalink: react_reference_seviceapi.html
tags: [terminal, react]
folder: react_reference
---

## Описание

С помощью методов класса вы можете создавать собственные службы, а также регистрировать [интеграционные службы](./react_reference_integrationapi.html).

## Методы

### addEventListener

```js
static addEventListener(type: ServiceEventType, listener: ServiceEventListener, isGlobal: boolean = true): void
```

**Описание**

Регистрирует слушатель и [подписывает приложение на события](./doc_react_interactiontypes.html#eventsubscription).

**Параметры**

* `type` – событие типа [`ServiceEventType`](./react_reference_integrationapi.html#ServiceEventType).
* `listener` – слушатель типа [`ServiceEventListener`](./react_reference_integrationapi.html#ServiceEventListener).
* `isGlobal` – [глобальная доступность слушателя](./doc_react_interactiontypes.html#eventsubscription).

### removeEventListener

```js
static removeEventListener(type: ServiceEventType, listener?: ServiceEventListener): boolean
```

**Описание**

Удаляет слушатель и отменяет [подписку на события](./doc_react_interactiontypes.html#eventsubscription).

**Параметры**

* `type` – событие типа [`ServiceEventType`](./react_reference_integrationapi.html#ServiceEventType).
* `listener` – слушатель типа [`ServiceEventListener`](./react_reference_integrationapi.html#ServiceEventListener). Не передавайте параметр, если хотите удалить все слушатели.

**Возвращает**

* `true` – если слушатель удалён.
* `false` – если слушатель не удалён.

## Параметры

### Тип ServiceEventType {#ServiceEventType}

```js
export type ServiceEventType = CustomServiceEventType | IntegrationServiceEventType;
```

### Тип CustomServiceEventType

```js
export type CustomServiceEventType = string;
```

### Перечисление IntegrationServiceEventType {#IntegrationServiceEventType}

```js
export enum IntegrationServiceEventType {
    BEFORE_POSITIONS_EDITED = "BEFORE_POSITIONS_EDITED",
    RECEIPT_DISCOUNT = "RECEIPT_DISCOUNT",
    PAYMENT_SELECTED = "PAYMENT_SELECTED",
    PAYMENT_SYSTEM = "PAYMENT_SYSTEM",
    PRINT_GROUP_REQUIRED = "PRINT_GROUP_REQUIRED",
    PRINT_EXTRA_REQUIRED = "PRINT_EXTRA_REQUIRED"
}
```

### Тип ServiceEventListener {#ServiceEventListener}

```js
export type ServiceEventListener = CustomServiceEventListener | IntegrationServiceEventListener;
```

### Тип CustomServiceEventListener

```js
export type CustomServiceEventListener = (extras: Object) => void;
```

### Тип IntegrationServiceEventListener

```js
export type IntegrationServiceEventListener =
    BeforePositionsEditedEventListener |
    ReceiptDiscountEventListener |
    PaymentSelectedEventListener |
    PaymentSystemEventListener |
    PrintGroupRequiredEventListener |
    PrintExtraRequiredEventListener;
```

### Тип BeforePositionsEditedEventListener

```js
export type BeforePositionsEditedEventListener = (positionsChanges: PositionChange[], callback: IntegrationCallback) => void
```

**См. также**

* [`PositionChange`](./react_reference_integrationapi.html#PositionChange)

### Тип ReceiptDiscountEventListener

```js
export type ReceiptDiscountEventListener = (discount: number, receiptUuid: string, callback: IntegrationCallback) => void
```

### Тип PaymentSelectedEventListener

```js
export type PaymentSelectedEventListener = (paymentSystem: PaymentSystem, callback: IntegrationCallback) => void
```

**См. также**

* [`PaymentSystem`](./react_reference_receiptapi.html#PaymentSystem)

### Тип PaymentSystemEventListener

```js
export type PaymentSystemEventListener = (operationType: PaymentSystemOperationType, event: PaymentSystemEvent, callback: IntegrationCallback) => void
```

**См. также**

* [`PaymentSystemOperationType`](./react_reference_receiptapi.html#PaymentSystemOperationType)

### Тип PrintGroupRequiredEventListener

```js
export type PrintGroupRequiredEventListener = (paymentSystem: PaymentSystem, callback: IntegrationCallback) => void
```

**См. также**

* [`PaymentSystem`](./react_reference_receiptapi.html#PaymentSystem)

### Тип PrintExtraRequiredEventListener

```js
export type PrintExtraRequiredEventListener = (callback: IntegrationCallback) => void
```
