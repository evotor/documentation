---
title: Scanner
keywords: react
sidebar: evotordoc_sidebar
toc: true
permalink: react_reference_devicescanner.html
folder: react_reference
---

## Описание

## Методы

### addEventListener

```js
static addEventListener(type: ScannerEventType, listener: ScannerEventListener, isGlobal: boolean = true): void
```

**Описание**

Регистрирует слушатель и [подписывает приложение на события](./doc_react_interactiontypes.html#eventsubscription).

**Параметры**

* `type` – тип события. Для получения данных от сканера штрихкодов указывайте тип [`ScannerEventType`](./react_reference_devicescanner.html#ScannerEventType).
* `listener` – тип слушателя. Для получения данных от сканера штрихкодов указывайте тип `ScannerEventListener`.
* `isGlobal` – указывает глобальную доступность метода. По умолчанию `true`.

**Возвращает**

### removeEventListener

```js
static removeEventListener(type: ScannerEventType, listener?: ScannerEventListener): boolean
```

**Описание**

Удаляет слушатель и отменяет [подписку на события](./doc_react_interactiontypes.html#eventsubscription).

**Параметры**

* `type` – тип события. Для отмены получения данных от сканера штрихкодов указывайте тип [`ScannerEventType`](./react_reference_devicescanner.html#ScannerEventType).
* `listener` – тип слушателя. Для отмены получения данных от сканера штрихкодов указывайте тип `ScannerEventListener`. Не передавайте параметр если хотите удалить все слушатели.

**Возвращает**

* `true` – если слушатель удалён.
* `false` – если слушатель не удалён.

## Параметры

### Тип ScannerEventType {#ScannerEventType}

```js
export enum ScannerEventType {
    BARCODE_RECEIVED = "BARCODE_RECEIVED"
}
```
