---
title:
keywords: react
sidebar: react_reference_sidebar
toc: true
permalink: react_reference_userapi.html
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

Получить список всех пользователей смарт-терминала.

**Параметры**

**Возвращает**

### getAuthenticatedUser

```js
static getAuthenticatedUser(getter: (User | null) => void): void
```

**Описание**

Получить авторизованного пользователя смарт-терминала.

**Параметры**

**Возвращает**

### getAllGrants

```js
static getAllGrants(getter: (Grant[]) => void): void
```

**Описание**

Получить все права.

**Параметры**

**Возвращает**

### getGrantsOfAuthenticatedUser

```js
static getGrantsOfAuthenticatedUser(getter: (Grant[]) => void): void
```

**Описание**

Получить права авторизованного пользователя.

**Параметры**

**Возвращает**
