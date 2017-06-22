---
title: Примеры запросов
keywords: sample
summary: "Раздел содержит примеры запросов к Эвотор API и вебхуков облака Эвотор."
sidebar: evotordoc_sidebar
permalink: doc_example_calls.html
tags: [Облако Эвотор, Товары]
folder: evotordoc/evotor_about
---

### Запросы к Эвотор API

С помощью Эвотор API сторонние сервисы могут получить доступ к данным пользователей платформы, которые хранятся в облаке Эвотор.

Обращаясь к Эвотор API сторонние сервисы могут:

* искать магазины, сотрудников и смарт терминалы пользователя платформы;
* в рамках выбранного магазина:

  * получать и передавать информацию о продуктах;
  * удалять продукты;
  * получать документы смарт-терминалов.

#### Пример GET-запроса к облаку Эвотор

Получить список всех магазинов пользователя:

```
-X GET --header 'Accept: application/json' --header 'X-Authorization: <токен приложения>' --header 'Content-Type: application/json' 'https://api.evotor.ru/api/v1/inventories/stores/search'
```

Ответ:

```JSON
[
  {
    "uuid": "string",
    "address": null,
    "name": "Мой магазин1",
    "code": null
  },
  {
    "uuid": "string",
    "address": null,
    "name": "Мой магазин3",
    "code": null
  }
]
```

#### Пример POST-запроса

Создать новый товар в определённом магазине:

```
curl -X POST --header 'Content-Type: application/json' --header 'Accept: application/json' --header 'X-Authorization: <токен приложения>' -d '[{"uuid":"n1e2w3-t4ov5qr6","code":"","barCodes":[],"alcoCodes":[],"name":"Новый товар","price":0,"quantity":0,"costPrice":0,"measureName":"","tax":"NO_VAT","allowToSell":false,"description":"","articleNumber":"","parentUuid":"","group":false,"type":"NORMAL","alcoholByVolume":0,"alcoholProductKindCode":0,"tareVolume":0}]' 'https://api.evotor.ru/api/v1/inventories/stores/storeUuid-123456/products'
```

```
no content
```

При создании товаров в ответ приходит пустое сообщение. Код ответа в случае удачного добавления – 200.


### Вебхуки облака Эвотор

Все изменения в Личном кабинете пользователя (создание магазина, регистрация смарт-терминала и т.п.) облако Эвотор передаёт в сторонний сервис, с помощью вебхуков. Таким образом, все запросы пользователей к стороннему сервису проксируются через облако Эвотор.

Подписка на вебхуки позволяет:

* Регистрировать или авторизовывать учётные записи в стороннем сервисе.
* Активировать и деактивировать тарифы за использование стороннего сервиса.
* Редактировать магазины, сотрудников и смарт-терминалы пользователей в стороннем сервисе.
* Передавать в сторонний сервис чеки (упрощённые документы) и документы смарт-терминалов.
* Получать и передавать номенклатуру.

#### Пример вебкука-запроса

Проверить данные учётной записи:

```
-X POST --header 'Content-Type: application/json' --header 'Accept: application/json' --header 'Authorization: Basic <токен стороннего сервиса>' -d '{"userUuid":"01-000000000000001","username":"<Имя учётной записи>","password":"<пароль учётной записи>","customField":"любое значение"}' 'https://partner.org/api/v1/user/verify'
```

Ответ:

```JSON
{
  "userUuid": "01-000000000000001",
  "hasBilling": false,
  "token": "пользовательский токен"
}
```

#### Пример вебхука-уведомления
Передать список магазинов в сторонний сервис:

```
-X PUT --header 'Content-Type: application/json' --header 'Accept: application/json' --header 'Authorization: <пользовательсский токен>' -d '[{"uuid": "string", "name": "string", "address": "string"}]' 'https://partner.org/api/v1/inventories/stores'
```

Ответ:

```JSON
[
  {
    "uuid": "string",
    "parentId": "string",
  }
]
```


### Справочник API

Со всеми возможностями Эвотор API вы можете ознакомиться в [справочнике](https://api.evotor.ru/docs/).

Последние изменения в документации и API отражаются в разделе [**Что нового**](https://developer.evotor.ru/docs/whats_new).
