---
title:
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

**Параметры**

**Возвращает**

### getProductByUuid

```js
static getProductByUuid(uuid: string, getter: (ProductItem | null) => void): void
```

**Описание**

**Параметры**

**Возвращает**

### getField

```js
static getField(fieldUuid: string, getter: (Field | null) => void): void
```

**Описание**

**Параметры**

**Возвращает**

### getProductExtras

```js
static getProductExtras(productUuid: string, getter: (ProductExtra[]) => void): void
```

**Описание**

**Параметры**

**Возвращает**
