---
title: Printer
keywords: react
sidebar: react_reference_sidebar
toc: true
permalink: react_reference_devicesprinter.html
folder: react_reference
---

### print

```js
static print(printables: [PrintableText, PrintableBarcode, PrintableImage])
```

**Описание**

Передаёт данные для печати на принтере смарт-терминала.

**Параметры**

* `printables` – функция, в параметры которой требуется передать массив элементов для печати: [текст](./react_reference_parameters_device.html#PrintableText), [штрихкод](./react_reference_parameters_device.html#PrintableBarcode), [изображение](./react_reference_parameters_device.html#PrintableImage).

**Возвращает**

### getAllowableSymbolsLineLength

```js
static getAllowableSymbolsLineLength(getter: (number) => void)
```

**Описание**

Получает длину печатной строки в символах.

**Параметры**

* `getter` – функция, в параметры которой передаётся число, указывающее длину печатной строки в символах.

**Возвращает**

### getAllowablePixelLineLength

```js
static getAllowablePixelLineLength(getter: (number) => void) Promise
```

**Описание**

Получает длину печатной строки в пикселях.

**Параметры**

* `getter` – функция, в параметры которой передаётся число, указывающее длину печатной строки в пикселях.

**Возвращает**
