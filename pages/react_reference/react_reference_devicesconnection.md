---
title: DeviceServiceConnector
keywords: react
sidebar: react_reference_sidebar
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

### addEventListener для любого устройства

```js
static addEventListener(type: DeviceConnectionEventType, listener: DeviceConnectionEventListener, isGlobal: boolean = true): void
```

**Описание**

Метод для [подписки приложения на события](./react_reference_introduction.html#eventslistening).

**Параметры**

* `type` – тип события. Для получения данных от подключённого устройства указывайте тип `DeviceConnectionEventType`.
* `listener` – тип слушателя. Для получения данных от подключённого устройства указывайте тип `DeviceConnectionEventListener`.
* `isGlobal` – указывает глобальную доступность метода. По умолчанию `true`.

**Возвращает**

### removeEventListener для любого устройства

```js
static removeEventListener(type: DeviceConnectionEventType, listener?: DeviceConnectionEventListener): boolean
```

**Описание**

Метод для отмены подписки на события.

**Параметры**

* `type` – тип события. Для отмены получения данных от подключённого устройства указывайте тип `DeviceConnectionEventType`.
* `listener` – тип слушателя. Для отмены получения данных от подключённого устройства указывайте тип `DeviceConnectionEventListener`. Не передавайте параметр если хотите удалить все слушатели.

**Возвращает**

* `true` – если слушатель удалён.
* `false` – если слушатель не удалён.
