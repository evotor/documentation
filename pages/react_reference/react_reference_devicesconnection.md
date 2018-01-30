---
title: DeviceServiceConnector
keywords: react
sidebar: evotordoc_sidebar
toc: true
permalink: react_reference_devicesconnection.html
folder: react_reference
---

## Описание

## Методы

### startInitConnections

```js
static startInitConnections(): void
```

**Описание**

Инициализирует оборудование подключённое к смарт-терминалу.

**Параметры**

**Возвращает**

### addEventListener

```js
static addEventListener(type: DeviceConnectionEventType, listener: DeviceConnectionEventListener, isGlobal: boolean = true): void
```

**Описание**

Регистрирует слушатель и [подписывает приложение на события](./doc_react_interactiontypes.html#eventsubscription).

**Параметры**

* `type` – тип события. Для получения данных от подключённого устройства указывайте тип [`DeviceConnectionEventType`](./react_reference_devicesconnection.html#DeviceConnectionEventType).
* `listener` – тип слушателя. Для получения данных от подключённого устройства указывайте тип `DeviceConnectionEventListener`.
* `isGlobal` – указывает глобальную доступность метода. По умолчанию `true`.

**Возвращает**

### removeEventListener

```js
static removeEventListener(type: DeviceConnectionEventType, listener?: DeviceConnectionEventListener): boolean
```

**Описание**

Удаляет слушатель и отменяет [подписку на события](./doc_react_interactiontypes.html#eventsubscription).

**Параметры**

* `type` – тип события. Для отмены получения данных от подключённого устройства указывайте тип [`DeviceConnectionEventType`](./react_reference_devicesconnection.html#DeviceConnectionEventType).
* `listener` – тип слушателя. Для отмены получения данных от подключённого устройства указывайте тип `DeviceConnectionEventListener`. Не передавайте параметр если хотите удалить все слушатели.

**Возвращает**

* `true` – если слушатель удалён.
* `false` – если слушатель не удалён.

## Параметры

### Тип DeviceConnectionEventType {#DeviceConnectionEventType}

```js
export enum DeviceConnectionEventType {
    PRINTER_CONNECTION_CHANGED = "PRINTER_CONNECTION_CHANGED",
    SCALES_CONNECTION_CHANGED = "SCALES_CONNECTION_CHANGED"
}
```
