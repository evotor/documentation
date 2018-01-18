---
title: Товары
keywords: react
sidebar: react_reference_sidebar
toc: true
permalink: react_reference_parameters_inventory.html
folder: react_reference
---

## Класс ProductItem {#productitem}

```js
export class ProductItem {
    constructor(uuid: string,
                parentUuid: string | null,
                code: string | null,
                name: string) {}
}
```

## Класс Field {#field}

```js
export class Field {
    constructor(name: string | null,
                fieldUUID: string,
                title: string | null,
                type: string) {}
}
```

## Класс ProductExtra {#productextra}

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
