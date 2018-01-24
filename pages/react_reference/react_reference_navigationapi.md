---
title: Navigation API
keywords: react
sidebar: evotordoc_sidebar
toc: true
permalink: react_reference_navigationapi.html
folder: react_reference
---

## Описание

## Методы

### createIntentForSellReceiptEdit

```js
static createIntentForSellReceiptEdit(): Intent
```

**Описание**

Создаёт намерение (`intent`) изменения чека продажи.

**Параметры**

**Возвращает**

### createIntentForPaybackReceiptEdit

```js
static createIntentForPaybackReceiptEdit(): Intent
```

**Описание**

Создаёт намерение (`intent`) изменения чека возврата.

**Параметры**

**Возвращает**

### createIntentForSellReceiptPayment

```js
static createIntentForSellReceiptPayment(): Intent
```

**Описание**

Создаёт намерение (`intent`) оплаты по чеку продажи.

**Параметры**

**Возвращает**

### createIntentForPaybackReceiptPayment

```js
static createIntentForPaybackReceiptPayment(): Intent
```

**Описание**

Создаёт намерение (`intent`) оплаты по чеку возврата.

**Параметры**

**Возвращает**

### createIntentForCashReceiptSettings

```js
static createIntentForCashReceiptSettings(): Intent
```

**Описание**

Создаёт намерение (`intent`) оплаты по чеку продажи.

**Параметры**

**Возвращает**

### createIntentForCashRegisterReport

```js
static createIntentForCashRegisterReport(): Intent
```

**Описание**

**Параметры**

**Возвращает**

### getIntent

```js
static getIntent(getter: (Intent) => void): Promise
```

**Описание**

Получает намерение (`intent`).

**Параметры**

* `getter`

**Возвращает**

### startActivity

```js
static startActivity(intent: Intent): Promise
```

**Описание**

Запускает операцию (`activity`).

**Параметры**

* `intent`

**Возвращает**

### startActivityForResult

```js
static startActivityForResult(intent: Intent, requestCode: number): Promise
```

**Описание**

**Параметры**

* `intent`
* `requestCode`

**Возвращает**

### setResult

```js
static setResult(resultCode: number): Promise
```

**Описание**

**Параметры**

* `resultCode`

**Возвращает**

### setIntegrationResult

```js
static setIntegrationResult(result: IntegrationEventResult): Promise
```

**Описание**

**Параметры**

* `result`

**Возвращает**

### finish

```js
static finish(): Promise
```

**Описание**

**Параметры**

**Возвращает**

### addEventListener

```js
static addEventListener(type: NavigationEventType, listener: NavigationEventListener, isGlobal: boolean = true): void
```

**Описание**

Регистрирует слушатель и [подписывает приложение на события](./doc_react_events_subscription.html).

**Параметры**

* `type` – тип события. Для получения данных о навигации указывайте тип [`NavigationEventType`](./react_reference_navigationapi.html#navigationeventtype).
* `listener` – тип слушателя. Для получения данных о навигации указывайте тип `NavigationEventListener`.
* `isGlobal` – указывает глобальную доступность метода. По умолчанию `true`.

**Возвращает**

### removeEventListener

```js
static removeEventListener(type: NavigationEventType, listener?: NavigationEventListener): boolean
```

**Описание**

Удаляет слушатель и отменяет [подписку на события](./doc_react_events_subscription.html).

**Параметры**


* `type` – тип события. Для отмены получения данных о навигации указывайте тип [`NavigationEventType`](./react_reference_navigationapi.html#navigationeventtype).
* `listener` – тип слушателя. Для отмены получения данных о навигации указывайте тип `NavigationEventListener`. Не передавайте параметр если хотите удалить все слушатели.

**Возвращает**

* `true` – если слушатель удалён.
* `false` – если слушатель не удалён.

## Параметры

## Класс NavigationError {#NavigationError}

```js
export class NavigationError extends Error {
    constructor(message: NavigationErrorMessage) {}
}
```

### Тип NavigationErrorMessage

```js
export enum NavigationErrorMessage {
    CURRENT_ACTIVITY_IS_NULL = "CURRENT_ACTIVITY_IS_NULL",
    MISSED_NECESSARY_INTENT_DATA = "MISSED_NECESSARY_INTENT_DATA",
    TARGET_CLASS_NOT_FOUND = "TARGET_CLASS_NOT_FOUND",
    TARGET_PACKAGE_NOT_FOUND = "TARGET_PACKAGE_NOT_FOUND",
    TARGET_CLASS_NOT_EXPORTED = "TARGET_CLASS_NOT_EXPORTED"
}
```

### Тип NavigationEventType {#navigationeventtype}

```js
export enum NavigationEventType {
    ACTIVITY_RESULT = "ACTIVITY_RESULT"
}
```
