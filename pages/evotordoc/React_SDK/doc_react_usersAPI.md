---
title: Работа с пользователями смарт-терминала
keywords:
summary:
sidebar: evotordoc_sidebar
permalink: doc_react_usersAPI.html
tags: [terminal, react]
folder: react_SDK
published: true
---

В разделе приведены методы для работы с пользователями смарт-терминала. Методы React Native обращаются к Java интерфейсу описанному в разделе ["Работа с пользователями смарт-терминала"](./doc_java_app_users.html)

{% include note.html content="Так как выполнение запросов к Java API занимает много времени, методы React SDK требуется выполнять асинхронно. Для этого в аргумент метода требуется передать колбэк-функцию." %}

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

## Примеры

Пример использования метода для получения списка всех пользователей по нажатию на кнопку в интерфейсе приложения.

```javascript
const onUsersSelect = (actionIndex, callback) => {
    switch (actionIndex) {
        UserApi.getAllUsers(callback);
        break;
      }
};
```

Пример колбэк-функции, которая передаётся в аргумент метода и выводит список всех пользователей в лог.

```javascript
const callback = (data) => {
    console.log(data);
};
```
