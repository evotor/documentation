---
title: Весы
keywords: react
sidebar: evotordoc_sidebar
toc: true
permalink: react_reference_devicescales.html
folder: react_reference
---

## Описание

## Методы

### getWeight

```js
static getWeight(): Promise<Weight>
```

**Описание**

Получает вес товара с помощью весов, подключённых к смарт-терминалу.

**Параметры**

**Возвращает**

* `Promise` – объект с данными о [весе товара (`Weight`)](./react_reference_devicescales.html#weight).

## Параметры

## Класс DeviceError {#DeviceError}

```js
export class DeviceError extends Error {
    constructor(message: string) {}
}
```

### Класс Weight {#weight}

```js
export class Weight {
    constructor(weightInGrams: number, supportStable: boolean, stable: boolean) {}
}
```
