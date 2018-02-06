---
title: Принтер
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

* `printables` – функция, в параметры которой передаётся массив элементов для печати: [`PrintableText`](./react_reference_devicesprinter.html#PrintableText), [PrintableBarcode](./react_reference_devicesprinter.html#PrintableBarcode), [PrintableImage](./react_reference_devicesprinter.html#PrintableImage).

**Возвращает**

* `Promise`

### getAllowableSymbolsLineLength

```js
static getAllowableSymbolsLineLength(): Promise<number>
```

**Описание**

Получает длину печатной строки в символах.

**Параметры**

**Возвращает**

* `Promise` – объект, который содержит число, указывающее длину печатной строки в символах.

### getAllowablePixelLineLength

```js
static getAllowablePixelLineLength(): Promise<number>
```

**Описание**

Получает длину печатной строки в пикселях.

**Параметры**

**Возвращает**

* `Promise` – объект, который содержит число, указывающее длину печатной строки в пикселях.

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
