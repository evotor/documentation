---
title: Inventory API
keywords: react
sidebar: react_reference_sidebar
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
* `getter` – функция, в которую передаётся массив штрихкодов товара в виде строк.

**Возвращает**

### getProductByUuid

```js
static getProductByUuid(uuid: string, getter: (ProductItem | null) => void): void
```

**Описание**

Получает товар по идентификатору (`uuid`)

**Параметры**

* `uuid` – идентификатор товара. Строка.
* `getter` – функция, в параметры которой передаётся [товар](./react_reference_parameters_inventory.html#productitem).

**Возвращает**

### getField

```js
static getField(fieldUuid: string, getter: (Field | null) => void): void
```

**Описание**

Получает поле.

**Параметры**

* `fieldUuid` – идентификатор поля в формате `uuid4`. Строка.
* `getter` – функция, в параметры которой передаётся [поле](./react_reference_parameters_inventory.html#field).

**Возвращает**

### getProductExtras

```js
static getProductExtras(productUuid: string, getter: (ProductExtra[]) => void): void
```

**Описание**

Получает дополнительные поля товара.

**Параметры**

* `productUuid` – идентификатор товара в формате `uuid4`. Строка.
* `getter` – функция, в параметры которой передаётся массив [дополнительных полей товара](./react_reference_parameters_inventory.html#productextra).

**Возвращает**
