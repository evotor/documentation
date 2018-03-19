---
title: Класс DeviceServiceConnector
keywords: react
sidebar: evotordoc_sidebar
toc: true
permalink: react_reference_devicesconnection.html
tags: [terminal, react]
folder: react_reference
---

## Описание

Класс подключает устройства (принтер чеков и весы) к смарт-терминалу.

## Методы

### startInitConnections

```js
static startInitConnections(): void
```

**Описание**

Инициализирует подключение устройств.


### addEventListener

```js
static addEventListener(type: DeviceConnectionEventType, listener: DeviceConnectionEventListener): void
```

**Описание**

Регистрирует слушатель и [подписывает приложение на события](./doc_react_interactiontypes.html#eventsubscription).

**Параметры**

* `type` – событие типа [`DeviceConnectionEventType`](./react_reference_devicesconnection.html#DeviceConnectionEventType).
* `listener` – слушатель типа [`DeviceConnectionEventListener`](./react_reference_devicesconnection.html#DeviceConnectionEventListener).

### removeEventListener

```js
static removeEventListener(type: DeviceConnectionEventType, listener?: DeviceConnectionEventListener): boolean
```

**Описание**

Удаляет слушатель и отменяет [подписку на события](./doc_react_interactiontypes.html#eventsubscription).

**Параметры**

* `type` – событие типа [`DeviceConnectionEventType`](./react_reference_devicesconnection.html#DeviceConnectionEventType).
* `listener` – слушатель типа [`DeviceConnectionEventListener`](./react_reference_devicesconnection.html#DeviceConnectionEventListener). Не передавайте параметр, если хотите удалить все слушатели.

**Возвращает**

* `true` – если слушатель удалён.
* `false` – если слушатель не удалён.

## Параметры

### Перечисление DeviceConnectionEventType {#DeviceConnectionEventType}

```js
export enum DeviceConnectionEventType {
    PRINTER_CONNECTION_CHANGED = "PRINTER_CONNECTION_CHANGED",
    SCALES_CONNECTION_CHANGED = "SCALES_CONNECTION_CHANGED"
}
```

### Тип DeviceConnectionEventListener {#DeviceConnectionEventListener}

```js
export type DeviceConnectionEventListener = (connected: boolean) => void;
```
