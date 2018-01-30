---
title: Scales
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
static getWeight(getter: (weight: Weight) => void): Promise
```

**Описание**

Получает вес товара с помощью весов, подключённых к смарт-терминалу.

**Параметры**

* `getter` – функция для [получения данных](./doc_react_interactiontypes.html#getter). Тип данных – [Weight](./react_reference_devicescales.html#weight).

**Возвращает**

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
