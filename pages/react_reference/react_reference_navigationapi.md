---
title: Navigation API
keywords: react
sidebar: react_reference_sidebar
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
static getIntent(getter: (Intent) => void)
```

**Описание**

Получает намерение (`intent`).

**Параметры**

* `getter`

**Возвращает**

### startActivity

```js
static startActivity(intent: Intent)
```

**Описание**

Запускает операцию (`activity`).

**Параметры**

* `intent`

**Возвращает**

### startActivityForResult

```js
static startActivityForResult(intent: Intent, requestCode: number)
```

**Описание**

**Параметры**

* `intent`
* `requestCode`

**Возвращает**

### setResult

```js
static setResult(resultCode: number)
```

**Описание**

**Параметры**

* `resultCode`

**Возвращает**

### setIntegrationResult

```js
static setIntegrationResult(result: IntegrationEventResult)
```

**Описание**

**Параметры**

* `result`

**Возвращает**

### finish

```js
static finish()
```

**Описание**

**Параметры**

**Возвращает**

### addEventListener

```js
static addEventListener(type: NavigationEventType, listener: NavigationEventListener, isGlobal: boolean): void
```

**Описание**

Метод для [подписки приложения на события](./react_reference_introduction.html#eventslistening).

**Параметры**

* `type` – тип события. Для получения данных о навигации указывайте тип `NavigationEventType`.
* `listener` – тип слушателя. Для получения данных о навигации указывайте тип `NavigationEventListener`.
* `isGlobal` – указывает глобальную доступность метода. По умолчанию `true`.

**Возвращает**

### removeEventListener

```js
static removeEventListener(type: NavigationEventType, listener?: NavigationEventListener): boolean
```

**Описание**

Метод для отмены подписки на события.

**Параметры**


* `type` – тип события. Для отмены получения данных о навигации указывайте тип `NavigationEventType`.
* `listener` – тип слушателя. Для отмены получения данных о навигации указывайте тип `NavigationEventListener`. Не передавайте параметр если хотите удалить все слушатели.

**Возвращает**

* `true` – если слушатель удалён.
* `false` – если слушатель не удалён.
