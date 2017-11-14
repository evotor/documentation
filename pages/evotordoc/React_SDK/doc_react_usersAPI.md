---
title: Работа с пользователями смарт-терминала
keywords:
summary:
sidebar: evotordoc_sidebar
permalink: doc_react_usersAPI.html
tags: [terminal, react]
folder: react_SDK
published: false
---

Приведённые ниже методы, соответствуют методам описанным в разделе [Java SDK](./doc_java_app_users.html)

## Методы

### Получить данные всех пользователей

```javascript
static getAllUsers(callback: Function) {
    UserModule.getAllUsers(callback);
}
```

### Получить данные авторизованного пользователя

```javascript
static getAuthenticatedUser(callback: Function) {
    UserModule.getAuthenticatedUser(callback);
}
```

### Получить список всех доступных прав

```javascript
static getAllGrants(callback: Function) {
    UserModule.getAllGrants(callback);
}
```

### Получить список прав авторизованного пользователя

```javascript
static getGrantsOfAuthenticatedUser(callback: Function) {
    UserModule.getGrantsOfAuthenticatedUser(callback);
}
```

## Пример

В примере представлены все методы, доступные в API.

```javascript

```
