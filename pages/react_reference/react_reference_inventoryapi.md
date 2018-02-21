---
title: Класс InventoryAPI
keywords: react
sidebar: evotordoc_sidebar
toc: true
permalink: react_reference_inventoryapi.html
tags: [terminal, react]
folder: react_reference
---

## Описание

С помощью методов класса приложения получают данные товаров, которые хранятся в базе смарт-терминала.

## Методы

### getAllBarcodesForProduct

```js
static getAllBarcodesForProduct(productUuid: string): Promise<string[]>
```

**Описание**

Получает все штрихкоды товара.

**Параметры**

* `productUuid` – идентификатор товара в формате `uuid4`.

**Возвращает**

* `Promise`, результат которого – массив строк, штрихкодов товара.

### getProductByUuid

```js
static getProductByUuid(uuid: string): Promise<ProductItem | null>
```

**Описание**

Получает товар по идентификатору (`uuid`)

**Параметры**

* `uuid` – идентификатор товара в формате `uuid4`.

**Возвращает**

* `Promise`, результат которого – [товар](./react_reference_inventoryapi.html#productitem)  или `null`.

### getField

```js
static getField(fieldUuid: string): Promise<Field | null>
```

**Описание**

Получает дополнительное поле товара.

**Параметры**

* `fieldUuid` – идентификатор поля в формате `uuid4`.

**Возвращает**

* `Promise`, результат которого – [`поле`](./react_reference_inventoryapi.html#field) или `null`.

### getProductExtras

```js
static getProductExtras(productUuid: string): Promise<ProductExtra[]>
```

**Описание**

Получает дополнительные данные товара.

**Параметры**

* `productUuid` – идентификатор товара в формате `uuid4`.

**Возвращает**

* `Promise`, результат которого – массив [дополнительных полей](./react_reference_inventoryapi.html#productextra).

## Параметры

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
                type: FieldType) {}
}
```

### Перечисление FieldType

```js
export enum FieldType {
    TEXT_FIELD = "TEXT_FIELD",
    DICTIONARY_FIELD = "DICTIONARY_FIELD"
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

### Перечисление ProductType {#ProductType}

```js
export enum ProductType {
    NORMAL = "NORMAL",
    ALCOHOL_MARKED = "ALCOHOL_MARKED",
    ALCOHOL_NOT_MARKED = "ALCOHOL_NOT_MARKED",
    SERVICE = "SERVICE"
}
```
