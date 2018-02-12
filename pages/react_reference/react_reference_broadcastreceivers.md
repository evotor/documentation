---
title: BroadcastReceiver
keywords: react
sidebar: evotordoc_sidebar
toc: true
permalink: react_reference_broadcastreceivers.html
folder: react_reference
---

## Описание

Класс позволяет подписываться на широковещательные сообщения, которые рассылает смарт-терминал.

## Методы

### addEventListener

```js
static addEventListener(type: BroadcastReceiverEventType, listener: BroadcastReceiveListener, isGlobal: boolean = true): void
```

**Описание**

Добавляет слушатель и [подписывает приложение на события](./doc_react_interactiontypes.html#eventsubscription).

**Параметры**

* `type` – событие типа [`BroadcastReceiverEventType`](./react_reference_broadcastreceivers.html#BroadcastReceiverEventType).
* `listener` – слушатель типа [`BroadcastReceiveListener`](./react_reference_broadcastreceivers.html#BroadcastEventListener).
* `isGlobal` – [глобальная доступность слушателя](./doc_react_interactiontypes.html#eventsubscription).

### removeEventListener

```js
static removeEventListener(type: BroadcastReceiverEventType, listener?: BroadcastReceiveListener): boolean
```

**Описание**

Удаляет широковещательный слушатель и отменяет [подписку на события](./doc_react_interactiontypes.html#eventsubscription).

**Параметры**

* `type` – событие типа [`BroadcastReceiverEventType`](./react_reference_broadcastreceivers.html#BroadcastReceiverEventType).
* `listener` – слушатель типа [`BroadcastReceiveListener`](./react_reference_broadcastreceivers.html#BroadcastEventListener). Не передавайте параметр если хотите удалить все слушатели.

**Возвращает**

* `true` – если слушатель удалён.
* `false` – если слушатель не удалён.

## Параметры


### Тип BroadcastEventType

```js
export type BroadcastEventType =
    ProductEventType |
    ReceiptEventType |
    PositionEventType |
    CashDrawerEventType |
    CashOperationEventType;
```

### Перечисление ProductEventType

```js
export enum ProductEventType {
    PRODUCT_CARD_OPEN = "PRODUCT_CARD_OPEN"
}
```

### Перечисление ReceiptEventType

```js
export enum ReceiptEventType {
    SELL_RECEIPT_OPENED = "SELL_RECEIPT_OPENED",
    PAYBACK_RECEIPT_OPENED = "PAYBACK_RECEIPT_OPENED",
    SELL_RECEIPT_CLEARED = "SELL_RECEIPT_CLEARED",
    PAYBACK_RECEIPT_CLEARED = "PAYBACK_RECEIPT_CLEARED",
    SELL_RECEIPT_CLOSED = "SELL_RECEIPT_CLOSED",
    PAYBACK_RECEIPT_CLOSED = "PAYBACK_RECEIPT_CLOSED"
}
```

### Перечисление PositionEventType

```js
export enum PositionEventType {
    SELL_RECEIPT_POSITION_ADDED = "SELL_RECEIPT_POSITION_ADDED",
    PAYBACK_RECEIPT_POSITION_ADDED = "PAYBACK_RECEIPT_POSITION_ADDED",
    SELL_RECEIPT_POSITION_EDITED = "SELL_RECEIPT_POSITION_EDITED",
    PAYBACK_RECEIPT_POSITION_EDITED = "PAYBACK_RECEIPT_POSITION_EDITED",
    SELL_RECEIPT_POSITION_REMOVED = "SELL_RECEIPT_POSITION_REMOVED",
    PAYBACK_RECEIPT_POSITION_REMOVED = "PAYBACK_RECEIPT_POSITION_REMOVED"
}
```

### Перечисление CashDrawerEventType

```js
export enum CashDrawerEventType {
    CASH_DRAWER_OPEN = "CASH_DRAWER_OPEN"
}
```

### Перечисление CashOperationEventType

```js
export enum CashOperationEventType {
    CASH_IN = "CASH_IN",
    CASH_OUT = "CASH_OUT"
}
```

### Тип BroadcastEventListener {#BroadcastEventListener}

```js
export type BroadcastEventListener =
    ProductEventListener |
    ReceiptEventListener |
    PositionEventListener |
    CashDrawerEventListener |
    CashOperationEventListener;
```

### Тип ProductEventListener

```js
export type ProductEventListener = (event: ProductEvent) => void;
```

### Тип ReceiptEventListener

```js
export type ReceiptEventListener = (event: ReceiptEvent) => void;
```

### Тип PositionEventListener

```js
export type PositionEventListener = (event: PositionEvent) => void;
```

### Тип CashDrawerEventListener

```js
export type CashDrawerEventListener = (event: CashDrawerEvent) => void;
```

### Тип CashOperationEventListener

```js
export type CashOperationEventListener = (event: CashOperationEvent) => void;
```

### Класс ProductEvent

```js
export class ProductEvent extends BroadcastEvent {
    constructor(action: string, productUuid: string) {}
}
```

### Класс ReceiptEvent

```js
export class ReceiptEvent extends BroadcastEvent {
    constructor(action: string, receiptUuid: string) {}
}
```

### Класс PositionEvent

```js
export class PositionEvent extends BroadcastEvent {
    constructor(action: string, receiptUuid: string, position: Position) {}
}
```

### Класс CashDrawerEvent

```js
export class CashDrawerEvent extends BroadcastEvent {
    constructor(action: string, cashDrawerId: number) {}
}
```

### Класс CashOperationEvent

```js
export class CashOperationEvent extends BroadcastEvent {
    constructor(action: string, total: number, documentUuid: string) {}
}
```
