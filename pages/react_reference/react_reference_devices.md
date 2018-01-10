---
title:
keywords: react
sidebar: react_reference_sidebar
toc: true
permalink: react_reference_devices.html
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
static addEventListener(type: DeviceConnectionEventType, listener: DeviceConnectionEventListener, isGlobal: boolean): void
```

**Описание**

**Параметры**

**Возвращает**

### removeEventListener для любого устройства

```js
static removeEventListener(type: DeviceConnectionEventType, listener?: DeviceConnectionEventListener): boolean
```

**Описание**

**Параметры**

**Возвращает**

### print

```js
static print(printables: [PrintableText, PrintableBarcode, PrintableImage]): Promise
```

**Описание**

**Параметры**

**Возвращает**

### getAllowableSymbolsLineLength

```js
static getAllowableSymbolsLineLength(getter: (number) => void): Promise
```

**Описание**

**Параметры**

**Возвращает**

### getAllowablePixelLineLength

```js
static getAllowablePixelLineLength(getter: (number) => void): Promise
```

**Описание**

**Параметры**

**Возвращает**

### getWeight

```js
static getWeight(getter: (weight: Weight) => void): Promise
```

**Описание**

**Параметры**

**Возвращает**

### registerReceiver

```js
static registerReceiver(): void
```

**Описание**

**Параметры**

**Возвращает**

### unregisterReceiver

```js
static unregisterReceiver(): void
```

**Описание**

**Параметры**

**Возвращает**

### addEventListener для сканера штрих-кодов

```js
static addEventListener(type: ScannerEventType, listener: ScannerEventListener, isGlobal: boolean): void
```

**Описание**

**Параметры**

**Возвращает**

### removeEventListener для сканера штрих-кодов

```js
static removeEventListener(type: ScannerEventType, listener?: ScannerEventListener): boolean
```

**Описание**

**Параметры**

**Возвращает**
