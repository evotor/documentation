---
title: User API
keywords: react
sidebar: react_reference_sidebar
toc: true
permalink: react_reference_parameters_receipt.html
folder: react_reference
---

## Описание

## Методы

### `getAllUsers`

#### getAllUsers

```js
static getAllUsers(getter: (User[]) => void): void
```

**Описание**

Получает список всех пользователей смарт-терминала.

**Параметры**

* `getter`

**Возвращает**

### getAuthenticatedUser

```js
static getAuthenticatedUser(getter: (User | null) => void): void
```

**Описание**

Получает данные авторизованного пользователя смарт-терминала.

**Параметры**

* `getter`

**Возвращает**

### getAllGrants

```js
static getAllGrants(getter: (Grant[]) => void): void
```

**Описание**

Получает все [права](./doc_app_grants.html).

**Параметры**

* `getter`

**Возвращает**

### getGrantsOfAuthenticatedUser

```js
static getGrantsOfAuthenticatedUser(getter: (Grant[]) => void): void
```

**Описание**

Получает [права](./doc_app_grants.html) авторизованного пользователя.

**Параметры**

* `getter`

**Возвращает**
