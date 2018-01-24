---
title: User API
keywords: react
sidebar: evotordoc_sidebar
toc: true
permalink: react_reference_userapi.html
folder: react_reference
---

## Описание

## Методы

### getAllUsers

```js
static getAllUsers(getter: (User[]) => void): void
```

**Описание**

Получает список всех пользователей смарт-терминала.

**Параметры**

* `getter` – функция для [получения данных](./doc_react_getter.html). Тип данных – [`User[]`](./react_reference_userapi.html#user).

**Возвращает**

### getAuthenticatedUser

```js
static getAuthenticatedUser(getter: (User | null) => void): void
```

**Описание**

Получает данные авторизованного пользователя смарт-терминала.

**Параметры**

* `getter` – функция для [получения данных](./doc_react_getter.html). Тип данных – [`User`](./react_reference_userapi.html#user).

**Возвращает**

### getAllGrants

```js
static getAllGrants(getter: (Grant[]) => void): void
```

**Описание**

Получает все [права](./doc_app_grants.html).

**Параметры**

* `getter` – функция для [получения данных](./doc_react_getter.html). Тип данных – [`Grant[]`](./react_reference_userapi.html#grant).

**Возвращает**

### getGrantsOfAuthenticatedUser

```js
static getGrantsOfAuthenticatedUser(getter: (Grant[]) => void): void
```

**Описание**

Получает [права](./doc_app_grants.html) авторизованного пользователя.

**Параметры**

* `getter` – функция для [получения данных](./doc_react_getter.html). Тип данных – [`Grant[]`](./react_reference_userapi.html#grant).

**Возвращает**

## Параметры

### Класс User {#user}

```js
export class User {
    constructor(uuid: string,
                secondName: string | null,
                firstName: string | null,
                phone: string | null,
                pin: string | null,
                roleUuid: string,
                roleTitle: string) {}
}
```

### Класс Grant {#grant}

```js
export class Grant {
    constructor(title: string, roleUuid: string) {}
}
```
