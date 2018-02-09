---
title: UserAPI
keywords: react
sidebar: evotordoc_sidebar
toc: true
permalink: react_reference_userapi.html
folder: react_reference
---

## Описание

С помощью методов класса приложения получают данные пользователей смарт-терминала.

## Методы

### getAllUsers

```js
static getAllUsers(): Promise<User[]>
```

**Описание**

Получает список всех пользователей смарт-терминала.

**Возвращает**

* `Promise`, результат которого, –  массив [пользователей](./react_reference_userapi.html#user)

### getAuthenticatedUser

```js
static getAuthenticatedUser(): Promise<User | null>
```

**Описание**

Получает данные авторизованного пользователя смарт-терминала.

**Возвращает**

* `Promise`, результат которого, – [`пользователь`](./react_reference_userapi.html#user).

### getAllGrants

```js
static getAllGrants(): Promise<Grant[]>
```

**Описание**

Получает все [права](./doc_app_grants.html).

**Параметры**

**Возвращает**

* `Promise`, результат которого, –  массив [прав](./react_reference_userapi.html#grant).

### getGrantsOfAuthenticatedUser

```js
static getGrantsOfAuthenticatedUser(): Promise<Grant[]>
```

**Описание**

Получает [права](./doc_app_grants.html) авторизованного пользователя.

**Параметры**

**Возвращает**

* `Promise`, результат которого, –  массив [прав](./react_reference_userapi.html#grant).

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
