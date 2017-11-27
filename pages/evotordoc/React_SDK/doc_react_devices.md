---
title: Работа с подключаемым оборудованием
keywords:
summary:
sidebar: evotordoc_sidebar
permalink: doc_react_devices.html
tags: [terminal, react]
folder: react_SDK
published: true
---

## Подключение оборудования

```javascript
static startInitConnections() {
    DevicesModule.startInitConnections();
}
```

## Принтер чеков

Для подключения принтера используйте метод:

```javascript
static setOnPrinterConnectionEventsListener(onEvent: (connected: boolean) => void) {
    Subscriber.onPrinterConnectionEvents = onEvent;
}
```

Для печати на чеке используйте метод:

```javascript
static print (text: String) {
    PrinterModule.print(text);
}
```

Для получения ошибок принтера используйте метод:

```javascript
static setOnPrintErrorListener(onEvent: (error: string) => void) {
    Subscriber.onPrintError = onEvent;
}
```

## Весы

Для подключения весов используйте метод:

```javascript
static setOnScalesConnectionEventsListener(onEvent: (connected: boolean) => void) {
    Subscriber.onScalesConnectionEvents = onEvent;
}
```

Для получения веса используйте метод:

```javascript
static getWeight(callback: (weight: Weight) => void) {
    DevicesModule.getWeight(callback);
}
```

Для получения ошибок весов используйте метод:

```javascript
static setOnWeighingErrorListener(onEvent: (error: string) => void) {
    Subscriber.onWeighingError = onEvent;
}
```

## Сканер штрихкодов

Для получения данных сканера штрихкодов используйте метод:

```javascript
static setOnBarcodeReceiveListener(onEvent: (barcode: string) => void) {
    Subscriber.onBarcodeReceive = onEvent;
}
```
