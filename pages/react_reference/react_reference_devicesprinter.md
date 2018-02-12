---
title: Класс Printer
keywords: react
sidebar: evotordoc_sidebar
toc: true
permalink: react_reference_devicesprinter.html
folder: react_reference
---

## Описание

Класс позволяет работать с принтером смарт-терминала.

## Методы

### print

```js
static print(printables: Printable[]): Promise
```

**Описание**

Вызывает команду печати.

**Параметры**

* `printables` – массив [ печатных элементов](./react_reference_devicesprinter.html#printable).

**Возвращает**

* `Promise`

**Возможные ошибки**

* [`DeviceError`](./doc_react_errorshandling.html#DeviceError)

### getAllowableSymbolsLineLength

```js
static getAllowableSymbolsLineLength(): Promise<number>
```

**Описание**

Позволяет получить длину печатной строки в символах.

**Возвращает**

* `Promise`, результат которого – число.

**Возможные ошибки**

* [`DeviceError`](./doc_react_errorshandling.html#DeviceError)

### getAllowablePixelLineLength

```js
static getAllowablePixelLineLength(): Promise<number>
```

**Описание**

Позволяет получить длину печатной строки в пикселях.

**Возвращает**

* `Promise`, результат которого – число.

**Возможные ошибки**

* [`DeviceError`](./doc_react_errorshandling.html#DeviceError)

## Параметры

### Тип Printable {#printable}

```js
export type Printable = PrintableText | PrintableBarcode | PrintableImage;
```


### Класс PrintableText {#PrintableText}

```js
export class PrintableText {
    constructor(text: string) {}
}
```

### Класс PrintableImage {#PrintableImage}

```js
export class PrintableImage {
    constructor(path: string) {}
}
```

### Класс PrintableBarcode {#PrintableBarcode}

```js
export class PrintableBarcode {
    constructor(barcodeValue: string, barcodeType: BarcodeType) {}
}
```

### Перечисление BarcodeType

```js
export enum BarcodeType {
    EAN8,
    UPCA,
    EAN13,
    CODE39
}
```
