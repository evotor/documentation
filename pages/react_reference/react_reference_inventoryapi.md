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
static getAllBarcodesForProduct(productUuid: string): Promise<string[]>
```

**Описание**

Получает все штрихкоды товара.

**Параметры**

* `productUuid` – идентификатор товара в формате `uuid4`. Строка.

**Возвращает**

* `Promise` – тип данных – массив строк, штрихкодов товара.

### getProductByUuid

```js
static getProductByUuid(uuid: string): Promise<ProductItem | null>
```

**Описание**

Получает товар по идентификатору (`uuid`)

**Параметры**

* `uuid` – идентификатор товара. Строка.

**Возвращает**

* `Promise` – тип данных – [`ProductItem`](./react_reference_inventoryapi.html#productitem).

### getField

```js
static getField(fieldUuid: string): Promise<Field | null>
```

**Описание**

Получает поле.

**Параметры**

* `fieldUuid` – идентификатор поля в формате `uuid4`. Строка.

**Возвращает**

* `Promise` – тип данных – [`Field`](./react_reference_inventoryapi.html#field).

### getProductExtras

```js
static getProductExtras(productUuid: string): Promise<ProductExtra[]>
```

**Описание**

Получает дополнительные поля товара.

**Параметры**

* `productUuid` – идентификатор товара в формате `uuid4`. Строка.

**Возвращает**

* `Promise` – тип данных – [`ProductExtra[ ]`](./react_reference_inventoryapi.html#productextra).

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
