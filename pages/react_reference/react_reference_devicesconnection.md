---
title: Подключение устройств
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

**Параметры**

**Возвращает**

### addEventListener для любого устройства

```js
static addEventListener(type: DeviceConnectionEventType, listener: DeviceConnectionEventListener, isGlobal: boolean = true): void
```

**Описание**

**Параметры**

* `type`
* `listener`
* `isGlobal`

**Возвращает**

### removeEventListener для любого устройства

```js
static removeEventListener(type: DeviceConnectionEventType, listener?: DeviceConnectionEventListener): boolean
```

**Описание**

**Параметры**

* `type`
* `listener`

**Возвращает**
