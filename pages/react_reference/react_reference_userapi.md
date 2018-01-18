---
title: User API
keywords: react
sidebar: react_reference_sidebar
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

* `getter` – функция, в параметры которой требуется передавать массив [пользователей](./react_reference_parameters_user.html#user).

**Возвращает**

### getAuthenticatedUser

```js
static getAuthenticatedUser(getter: (User | null) => void): void
```

**Описание**

Получает данные авторизованного пользователя смарт-терминала.

**Параметры**

* `getter` – функция, в параметры которой требуется передавать [пользователя](./react_reference_parameters_user.html#user).

**Возвращает**

### getAllGrants

```js
static getAllGrants(getter: (Grant[]) => void): void
```

**Описание**

Получает все [права](./doc_app_grants.html).

**Параметры**

* `getter` – функция, в параметры которой требуется передавать массив [прав пользователей](./react_reference_parameters_user.html#grant).

**Возвращает**

### getGrantsOfAuthenticatedUser

```js
static getGrantsOfAuthenticatedUser(getter: (Grant[]) => void): void
```

**Описание**

Получает [права](./doc_app_grants.html) авторизованного пользователя.

**Параметры**

* `getter` – функция, в параметры которой требуется передавать [права пользователей](./react_reference_parameters_user.html#grant).

**Возвращает**
