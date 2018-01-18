---
title: Scanner
keywords: react
sidebar: react_reference_sidebar
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

Метод для [подписки приложения на события](./react_reference_introduction.html#eventslistening).

**Параметры**

* `type` – тип события. Для получения данных от сканера штрихкодов указывайте тип `ScannerEventType`.
* `listener` – тип слушателя. Для получения данных от сканера штрихкодов указывайте тип `ScannerEventListener`.
* `isGlobal` – указывает глобальную доступность метода. По умолчанию `true`.

**Возвращает**

### removeEventListener

```js
static removeEventListener(type: ScannerEventType, listener?: ScannerEventListener): boolean
```

**Описание**

Метод для отмены подписки на события.

**Параметры**

* `type` – тип события. Для отмены получения данных от сканера штрихкодов указывайте тип `ScannerEventType`.
* `listener` – тип слушателя. Для отмены получения данных от сканера штрихкодов указывайте тип `ScannerEventListener`. Не передавайте параметр если хотите удалить все слушатели.

**Возвращает**

* `true` – если слушатель удалён.
* `false` – если слушатель не удалён.
