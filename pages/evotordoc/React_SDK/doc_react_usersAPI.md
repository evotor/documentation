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

В разделе приведены методы для работы с пользователями смарт-терминала. Методы React Native обращаются к Java интерфейсу описанному в разделе ["Работа с пользователями смарт-терминала"](./doc_java_app_users.html).

{% include note.html content="Так как выполнение запросов к Java API занимает много времени, методы React SDK требуется выполнять асинхронно. Для этого в качестве аргумента метода требуется передать колбэк-функцию." %}

## Методы

### Получить данные всех пользователей

```javascript
static getAllUsers(callback: (User[]) => void) {
    UserModule.getAllUsers(callback);
}
```

Где `User` – экземпляр класса с [данными о пользователе](./doc_react_usersAPI.html#userData).

### Получить данные авторизованного пользователя

```javascript
static getAuthenticatedUser(callback: (User | null) => void) {
    UserModule.getAuthenticatedUser(callback);
}
```

Где `User` – экземпляр класса с [данными о пользователе](./doc_react_usersAPI.html#userData).

### Получить список всех доступных прав

```javascript
static getAllGrants(callback: (Grant[]) => void) {
    UserModule.getAllGrants(callback);
}
```

Где `Grant` – экземпляр класса с [данными о роли](./doc_react_usersAPI.html#roleData).

### Получить список прав авторизованного пользователя

```javascript
static getGrantsOfAuthenticatedUser(callback: (Grant[]) => void) {
    UserModule.getGrantsOfAuthenticatedUser(callback);
}
```

Где `Grant` – экземпляр класса с [данными о роли](./doc_react_usersAPI.html#roleData).

## Возвращаемые данные

### Данные о пользователе {#userData}

```javascript
class User {
    constructor(uuid: string,
                secondName: string | null,
                firstName: string | null,
                phone: string | null,
                pin: string,
                roleUuid: string,
                roleTitle: string) {
        this.uid = uuid;//Идентификатор пользователя в Облаке Эвотор.
        this.secondName = secondName;//Фамилия пользователя.
        this.firstName = firstName;//Имя пользователя.
        this.phone = phone;//Номер телефона.
        this.pin = pin;//ПИН для доступа к пользователю на смарт-терминале.
        this.roleUuid = roleUuid;//Идентификатор присвоенной пользователю роли в формате uuid4.
        this.roleTitle = roleTitle;//Имя присвоенной пользователю роли.
    }
};
```

### Данные о роли {#roleData}

```javascript
class Grant {
    constructor(title: string, roleUuid: string) {
        this.title = title;//Имя роли.
        this.roleUuid = roleUuid//Идентификатор роли в Облаке Эвотор в формате uuid4.
      }
};
```

## Примеры

Пример колбэк-функции, которая передаётся в аргумент метода.

```javascript
let allUsers;
    const callback = (data: [User]) => {
        allUsers = data;
    };
    UserApi.getAllUsers(callback);
```
