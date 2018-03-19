---
title: Класс NavigationAPI
keywords: react
sidebar: evotordoc_sidebar
toc: true
permalink: react_reference_navigationapi.html
tags: [terminal, react]
folder: react_reference
---

## Описание

Класс предоставляет собой обёртку нативной навигации андроида.

С помощью методов класса приложения запускают службы и операции. Внутри своего приложения вы можете запускать любые экспортированные операции других приложений.

## Методы

### createIntentForSellReceiptEdit

```js
static createIntentForSellReceiptEdit(): Intent
```

**Описание**

Создаёт намерение (`Intent`) для формы наполнения чека продажи.

**Возвращает**

* `Intent`

### createIntentForPaybackReceiptEdit

```js
static createIntentForPaybackReceiptEdit(): Intent
```

**Описание**

Создаёт намерение (`Intent`) для формы наполнения чека возврата.

**Возвращает**

* `Intent`

### createIntentForSellReceiptPayment {#createIntentForSellReceiptPayment}

```js
static createIntentForSellReceiptPayment(): Intent
```

**Описание**

Создаёт намерение (`Intent`) для формы оплаты чека продажи.

**Возвращает**

* `Intent`

### createIntentForPaybackReceiptPayment {#createIntentForPaybackReceiptPayment}

```js
static createIntentForPaybackReceiptPayment(): Intent
```

**Описание**

Создаёт намерение (`Intent`) для формы оплаты чека возврата.

**Возвращает**

* `Intent`

### createIntentForCashReceiptSettings

```js
static createIntentForCashReceiptSettings(): Intent
```

**Описание**

Создаёт намерение (`Intent`) для формы настроек кассового чека.

**Возвращает**

* `Intent`

### createIntentForCashRegisterReport

```js
static createIntentForCashRegisterReport(): Intent
```

**Описание**

Создаёт намерение (`Intent`) для формы кассового отчёта.

**Возвращает**

* `Intent`

### getIntent

```js
static getIntent(): Promise<Intent>
```

**Описание**

Получает намерение (`Intent`) для текущей операции.

**Возвращает**

* `Promise` – возвращает объект с намерением.

**Возможные ошибки**

* [`NavigationError`](./doc_react_errorshandling.html#navigationerror).

### startActivity

```js
static startActivity(intent: Intent): Promise<void>
```

**Описание**

Запускает операцию (`activity`).

**Параметры**

* `intent`

**Возвращает**

* `Promise`

**Возможные ошибки**

* [`NavigationError`](./doc_react_errorshandling.html#navigationerror).


### startActivityForResult {#startActivityForResult}

```js
static startActivityForResult(intent: Intent, requestCode: number): Promise<void>
```

**Описание**

Запускает операцию для получения результата.

**Параметры**

* `intent`
* `requestCode`

**Возвращает**

* `Promise`

**Возможные ошибки**

* [`NavigationError`](./doc_react_errorshandling.html#navigationerror).


### startService

```js
static startService(intent: Intent): Promise<void>
```

**Описание**

Запускает службу.

**Параметры**

* `intent`

**Возвращает**

* `Promise`

**Возможные ошибки**

* [`NavigationError`](./doc_react_errorshandling.html#navigationerror).


### setResult

```js
static setResult(resultCode: number, data?: Intent): Promise<void>
```

**Описание**

Устанавливает результат текущей операции, если она была запущена методом [startActivityForResult](./react_reference_navigationapi.html#startActivityForResult).

**Параметры**

* `resultCode`
* `data`

**Возвращает**

* `Promise`

**Возможные ошибки**

* [`NavigationError`](./doc_react_errorshandling.html#navigationerror).


### setIntegrationResult

```js
static setIntegrationResult(result: IntegrationServiceEventResult): Promise<void>
```

**Описание**

Устанавливает интеграционный результат текущей операции, если она унаследована от интеграционной операции.

**Параметры**

* `result`

**Возвращает**

* `Promise`

**Возможные ошибки**

* [`NavigationError`](./doc_react_errorshandling.html#navigationerror).


### finish

```js
static finish(): Promise<void>
```

**Описание**

Завершает текущую операцию.

**Возвращает**

* `Promise`

**Возможные ошибки**

* [`NavigationError`](./doc_react_errorshandling.html#navigationerror).


### addEventListener

```js
static addEventListener(type: NavigationEventType, listener: NavigationEventListener): void
```

**Описание**

Регистрирует слушатель и [подписывает приложение на события](./doc_react_interactiontypes.html#eventsubscription).

**Параметры**

* `type` – событие типа [`NavigationEventType`](./react_reference_navigationapi.html#navigationeventtype).
* `listener` – слушатель типа `NavigationEventListener`.

### removeEventListener

```js
static removeEventListener(type: NavigationEventType, listener?: NavigationEventListener): boolean
```

**Описание**

Удаляет слушатель и отменяет [подписку на события](./doc_react_interactiontypes.html#eventsubscription).

**Параметры**

* `type` – событие типа [`NavigationEventType`](./react_reference_navigationapi.html#navigationeventtype).
* `listener` – слушатель типа `NavigationEventListener`. Не передавайте параметр если хотите удалить все слушатели.

**Возвращает**

* `true` – если слушатель удалён.
* `false` – если слушатель не удалён.

## Параметры

### Тип NavigationEventType {#navigationeventtype}

```js
export enum NavigationEventType {
    ACTIVITY_RESULT = "ACTIVITY_RESULT",
    BACK_PRESSED = "BACK_PRESSED"
}
```
<!-- tobundle - TODO -->
