---
title: Printer
keywords: react
sidebar: evotordoc_sidebar
toc: true
permalink: react_reference_devicesprinter.html
folder: react_reference
---

## Описание

## Методы

### print

```js
static print(printables: [PrintableText, PrintableBarcode, PrintableImage]): Promise
```

**Описание**

Передаёт данные для печати на принтере смарт-терминала.

**Параметры**

* `printables` – функция, в параметры которой передаётся массив элементов для печати: [`PrintableText`](.react_reference_devicesprinter.html#PrintableText), [PrintableBarcode](./react_reference_devicesprinter.html#PrintableBarcode), [PrintableImage](./react_reference_devicesprinter.html#PrintableImage).

**Возвращает**

### getAllowableSymbolsLineLength

```js
static getAllowableSymbolsLineLength(getter: (number) => void): Promise
```

**Описание**

Получает длину печатной строки в символах.

**Параметры**

* `getter` – функция для [получения данных](./doc_react_getter.html), в параметры которой передаётся число, указывающее длину печатной строки в символах.

**Возвращает**

### getAllowablePixelLineLength

```js
static getAllowablePixelLineLength(getter: (number) => void): Promise
```

**Описание**

Получает длину печатной строки в пикселях.

**Параметры**

* `getter` – функция для [получения данных](./doc_react_getter.html), в параметры которой передаётся число, указывающее длину печатной строки в пикселях.

**Возвращает**


## Параметры

## Класс DeviceError {#DeviceError}

```js
export class DeviceError extends Error {
    constructor(message: string) {}
}
```

### Класс PrintableText {#PrintableText}

```js
export class PrintableText {
    constructor(text: string) {}
}
```

### Класс PrintableBarcode {#PrintableBarcode}

```js
export class PrintableBarcode {
    constructor(barcodeValue: string, barcodeType: BarcodeType) {}
}
```

### Класс PrintableImage {#PrintableImage}

```js
export class PrintableImage {
    constructor(path: string) {}
}
```

### Тип BarcodeType

```js
export enum BarcodeType {
    EAN8,
    UPCA,
    EAN13,
    CODE39
}
```
