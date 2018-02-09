---
title: Класс Scaner
keywords: react
sidebar: evotordoc_sidebar
toc: true
permalink: react_reference_devicescanner.html
folder: react_reference
---

## Описание

Класс позволяет работать со сканером, подключённым к смарт-терминалу.

## Методы

### addEventListener

```js
static addEventListener(type: ScannerEventType, listener: ScannerEventListener, isGlobal: boolean = true): void
```

**Описание**

Регистрирует слушатель и [подписывает приложение на события](./doc_react_interactiontypes.html#eventsubscription).

**Параметры**

* `type` – событие типа  [`ScannerEventType`](./react_reference_devicescanner.html#ScannerEventType).
* `listener` – слушатель типа  [`ScannerEventListener`](./react_reference_devicescanner.html#scannereventlistener).
* `isGlobal` – [глобальная доступность метода](./doc_react_interactiontypes.html#eventsubscription).

### removeEventListener

```js
static removeEventListener(type: ScannerEventType, listener?: ScannerEventListener): boolean
```

**Описание**

Удаляет слушатель и отменяет [подписку на события](./doc_react_interactiontypes.html#eventsubscription).

**Параметры**

* `type` – событие типа [`ScannerEventType`](./react_reference_devicescanner.html#ScannerEventType).
* `listener` – слушатель типа [`ScannerEventListener`](./react_reference_devicescanner.html#scannereventlistener). Не передавайте параметр, если хотите удалить все слушатели.

**Возвращает**

* `true` – если слушатель удалён.
* `false` – если слушатель не удалён.

## Параметры

### Перечисление ScannerEventType {#ScannerEventType}

```js
export enum ScannerEventType {
    BARCODE_RECEIVED = "BARCODE_RECEIVED"
}
```

### Тип ScannerEventListener {#scannereventlistener}

```js
export type ScannerEventListener = BarcodeReceiveListener;
```

### Тип BarcodeReceiveListener

```js
export type BarcodeReceiveListener = (barcode: string) => void;
```
