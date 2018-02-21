---
title: Работа с пользователями смарт-терминала
keywords: API, пользователи, User, методы
summary: "Раздел содержит описание Users API смарт-терминала."
sidebar: evotordoc_sidebar
permalink: doc_java_app_users.html
tags: [java, terminal]
folder: java_SDK
published: true
---

С помощью User API вы можете узнать данные всех пользователей или пользователя, который авторизован на смарт-терминале в данный момент. Например, список прав авторизованного пользователя.

Для работы используйте класс [`UserAPI`](https://github.com/evotor/integration-library/blob/master/app/src/main/java/ru/evotor/framework/users/UserApi.kt).

## Методы

Класс `UserAPI` содержит следующие методы:

### Получить данные всех пользователей

```java
fun getAllUsers(context: Context): List<User>
```

Где:

* `context` – контекст приложения.
* `List<User>` – список всех пользователей смарт-терминала.

### Получить данные авторизованного пользователя

```java
fun getAuthenticatedUser(context: Context): User
```

Где:

* `context` – контекст приложения.
* `User` – пользователь авторизованный на смарт-терминале. Если пользователь не авторизован, возвращается `null`.

### Получить список всех доступных прав

```java
fun getAllGrants(context: Context): List<Grant>
```

Где:

* `context` – контекст приложения.
* `List<Grant>` – список всех возможных прав.

### Получить список прав авторизованного пользователя

```java
fun getGrantsOfAuthenticatedUser(context: Context): List<Grant>
```

Где:

* `context` – контекст приложения.
* `List<Grant>` – список всех прав авторизованного пользователя.

## Пример

Пример использования User API в [демонстрационном приложении](https://github.com/evotor/evotor-api-example/blob/master/app/src/main/java/ru/qualitylab/evotor/evotortest6/UserApiActivity.java).
