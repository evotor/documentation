---
title: Устройства
keywords: react
sidebar: react_reference_sidebar
toc: true
permalink: react_reference_parameters_device.html
folder: react_reference
---

##  Класс PrintableText {#PrintableText}

```js
export class PrintableText {
    constructor(text: string) {
        this.__name__ = 'PrintableText';
        this.type = 'TEXT';
        this.value = text;
    }
}
```

##  Класс PrintableBarcode {#PrintableBarcode}

```js
export class PrintableBarcode {
    constructor(barcodeValue: string, barcodeType: BarcodeType) {
        this.__name__ = 'PrintableBarcode';
        this.type = 'BARCODE';
        this.value = barcodeValue;
        this.barcodeType = barcodeType;
    }
}
```

##  Класс PrintableImage {#PrintableImage}

```js
export class PrintableImage {
    constructor(path: string) {
        this.__name__ = 'PrintableImage';
        this.type = 'IMAGE';
        this.value = path;
    }
}
```

##  Класс Weight {#Weight}

```js
export class Weight {
    constructor(weightInGrams: number, supportStable: boolean, stable: boolean) {
        this.__name__ = 'Weight';
        this.weightInGrams = weightInGrams;
        this.supportStable = supportStable;
        this.stable = stable;
    }
}
```
