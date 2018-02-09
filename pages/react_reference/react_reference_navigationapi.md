---
title: NavigationAPI
keywords: react
sidebar: evotordoc_sidebar
toc: true
permalink: react_reference_navigationapi.html
folder: react_reference
---

## Описание

Класс предоставляет доступ к нативной навигации андроида и позволяет запускать службы и операции. Внутри своего приложения вы можете запускать любые экспортированные операции других приложений.

## Методы

### createIntentForSellReceiptEdit

```js
static createIntentForSellReceiptEdit(): Intent
```

**Описание**

Создаёт намерение (`Intent`) изменения чека продажи.

**Возвращает**

* `Intent`

### createIntentForPaybackReceiptEdit

```js
static createIntentForPaybackReceiptEdit(): Intent
```

**Описание**

Создаёт намерение (`Intent`) изменения чека возврата.

**Возвращает**

* `Intent`

### createIntentForSellReceiptPayment

```js
static createIntentForSellReceiptPayment(): Intent
```

**Описание**

Создаёт намерение (`Intent`) оплаты по чеку продажи.

**Возвращает**

* `Intent`

### createIntentForPaybackReceiptPayment

```js
static createIntentForPaybackReceiptPayment(): Intent
```

**Описание**

Создаёт намерение (`Intent`) оплаты по чеку возврата.

**Возвращает**

* `Intent`

### createIntentForCashReceiptSettings

```js
static createIntentForCashReceiptSettings(): Intent
```

**Описание**

Создаёт намерение (`Intent`) оплаты по чеку продажи.

**Возвращает**

* `Intent`

### createIntentForCashRegisterReport

```js
static createIntentForCashRegisterReport(): Intent
```

**Описание**

**Возвращает**

* `Intent`

### getIntent

```js
static getIntent(): Promise<Intent>
```

**Описание**

Получает намерение (`Intent`).

**Возвращает**

* `Promise` – возвращает объект с намерением.

### startActivity

```js
static startActivity(intent: Intent): Promise
```

**Описание**

Запускает операцию (`activity`).

**Параметры**

* `Intent`

**Возвращает**

* `Promise`

### startActivityForResult

```js
static startActivityForResult(intent: Intent, requestCode: number): Promise
```

**Описание**

**Параметры**

* `intent`
* `requestCode`

**Возвращает**

* `Promise`

### startService

```js
static startService(intent: Intent): Promise
```

**Описание**

Запускает службу.

**Параметры**

* `intent`

**Возвращает**

* `Promise`

### setResult

```js
static setResult(resultCode: number, data?: Intent): Promise
```

**Описание**

Устанавливает результат, если ваша активность была открыта методом [startActivityForResult](./).

**Параметры**

* `resultCode`

**Возвращает**

* `Promise`

### setIntegrationResult

```js
static setIntegrationResult(result: IntegrationServiceEventResult): Promise
```

**Описание**

Устанавливает результат [интеграционного события](./).

**Параметры**

* `result`

**Возвращает**

* `Promise`

### finish

```js
static finish(): Promise
```

**Описание**

**Возвращает**

* `Promise`

### addEventListener

```js
static addEventListener(type: NavigationEventType, listener: NavigationEventListener, isGlobal: boolean = true): void
```

**Описание**

Регистрирует слушатель и [подписывает приложение на события](./doc_react_interactiontypes.html#eventsubscription).

**Параметры**

* `type` – событие типа [`NavigationEventType`](./react_reference_navigationapi.html#navigationeventtype).
* `listener` – слушатель типа `NavigationEventListener`.
* `isGlobal` – указывает [глобальную доступность метода](./doc_react_interactiontypes.html#eventsubscription)

**Возвращает**

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

## Ошибки

При вызове методов класса могут возникать ошибки класса [`NavigationError`](./doc_react_errorshandling.html#navigationerror).


<!-- tobundle - TODO -->
