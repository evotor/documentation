---
title: Класс Scales
keywords: react
sidebar: evotordoc_sidebar
toc: true
permalink: react_reference_devicescales.html
folder: react_reference
---

## Описание

Класс позволяет работать с весами, подключёнными к смарт-терминалу.

## Методы

### getWeight

```js
static getWeight(): Promise<Weight>
```

**Описание**

Получает вес товара, установленного на весах.

**Возвращает**

* `Promise`, результат которого - [вес товара](./react_reference_devicescales.html#weight).

**Возможные ошибки**

* [`DeviceError`](./doc_react_errorshandling.html#DeviceError)

## Параметры

### Weight {#weight}

```js
export class Weight {
    constructor(weightInGrams: number, supportStable: boolean, stable: boolean) {}
}
```
