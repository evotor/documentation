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
static getAllUsers(): Promise<User[]>
```

**Описание**

Получает список всех пользователей смарт-терминала.

**Параметры**

**Возвращает**

* `Promise` – тип данных – [`User[]`](./react_reference_userapi.html#user)

### getAuthenticatedUser

```js
static getAuthenticatedUser(): Promise<User | null>
```

**Описание**

Получает данные авторизованного пользователя смарт-терминала.

**Параметры**

**Возвращает**

* `Promise` – тип данных – [`User`](./react_reference_userapi.html#user).

### getAllGrants

```js
static getAllGrants(): Promise<Grant[]>
```

**Описание**

Получает все [права](./doc_app_grants.html).

**Параметры**

**Возвращает**

* `Promise` – тип данных – [`Grant[]`](./react_reference_userapi.html#grant).

### getGrantsOfAuthenticatedUser

```js
static getGrantsOfAuthenticatedUser(): Promise<Grant[]>
```

**Описание**

Получает [права](./doc_app_grants.html) авторизованного пользователя.

**Параметры**

**Возвращает**

* `Promise` – тип данных – [`Grant[]`](./react_reference_userapi.html#grant).

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
