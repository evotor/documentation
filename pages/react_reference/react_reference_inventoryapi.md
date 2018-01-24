---
title: Inventory API
keywords: react
sidebar: evotordoc_sidebar
toc: true
permalink: react_reference_inventoryapi.html
folder: react_reference
---

## Описание

## Методы

### getAllBarcodesForProduct

```js
static getAllBarcodesForProduct(productUuid: string, getter: (string[]) => void): void
```

**Описание**

Получает все штрихкоды товара.

**Параметры**

* `productUuid` – идентификатор товара в формате `uuid4`. Строка.
* `getter` – функция для получения данных. Тип данных – массив строк, штрихкодов товара.

**Возвращает**

### getProductByUuid

```js
static getProductByUuid(uuid: string, getter: (ProductItem | null) => void): void
```

**Описание**

Получает товар по идентификатору (`uuid`)

**Параметры**

* `uuid` – идентификатор товара. Строка.
* `getter` – функция для получения данных. Тип данных – [`ProductItem`](./react_reference_inventoryapi.html#productitem).

**Возвращает**

### getField

```js
static getField(fieldUuid: string, getter: (Field | null) => void): void
```

**Описание**

Получает поле.

**Параметры**

* `fieldUuid` – идентификатор поля в формате `uuid4`. Строка.
* `getter` – функция для получения данных. Тип данных – [`Field`](./react_reference_inventoryapi.html#field).

**Возвращает**

### getProductExtras

```js
static getProductExtras(productUuid: string, getter: (ProductExtra[]) => void): void
```

**Описание**

Получает дополнительные поля товара.

**Параметры**

* `productUuid` – идентификатор товара в формате `uuid4`. Строка.
* `getter` – функция для получения данных. Тип данных – [`ProductExtra[ ]`](./react_reference_inventoryapi.html#productextra).

**Возвращает**

### Параметры

### Класс ProductItem {#productitem}

```js
export class ProductItem {
    constructor(uuid: string,
                parentUuid: string | null,
                code: string | null,
                name: string) {}
}
```

### Класс Field {#field}

```js
export class Field {
    constructor(name: string | null,
                fieldUUID: string,
                title: string | null,
                type: string) {}
}
```

### Класс ProductExtra {#productextra}

```js
export class ProductExtra {
    constructor(uuid: string,
                name: string | null,
                commodityUUID: string,
                fieldUUID: string,
                fieldValue: string | null,
                data: string | null) {}
}
```

### Тип ProductType

```js
export enum ProductType {
    NORMAL = "NORMAL",
    ALCOHOL_MARKED = "ALCOHOL_MARKED",
    ALCOHOL_NOT_MARKED = "ALCOHOL_NOT_MARKED",
    SERVICE = "SERVICE"
}
```
