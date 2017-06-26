---
title: Запросы REST API Эвотор
keywords: sample
summary: "Раздел содержит информацию о запросах, которые вы можете отправлять в REST API Эвотор"
sidebar: evotordoc_sidebar
permalink: doc_evotor_rest_api_calls.html
tags: [Облако, Товары]
folder: evotordoc/evotor_integration
---

Данные пользователей платформы (информация о магазинах, устройствах, сотрудниках) хранятся в облаке Эвотор.

С помощью REST API  облака сторонние сервисы могут:

* искать магазины, сотрудников и смарт терминалы пользователя платформы;
* в рамках выбранного магазина:
    * получать и передавать информацию о продуктах;
    * удалять продукты;
    * получать документы смарт-терминалов.

### Авторизация
Все запросы к REST API облака Эвотор, должны содержать HTTP-заголовок `x-Authorization`, в котором требуется указать *ключ авторизации*. Ключ авторизации можно получить одним из следующих способов:

* В GET-параметре `token` веб-адреса iframe-приложения:

  ```
  https://partner.org/#/?uid=01-000000000011111&token=string
  ```

![Токен для интеграции с 1с](images/iframe_token.png)

* В Личном кабинете пользователя Эвотор, в разделе **Настройки** приложения.

![Токен для интеграции с 1с](images/1c_integration_API_key.png)

* В POST-запросе от облака Эвотор. Для этого сторонний сервис должен поддерживать адрес `http://<веб-адрес стороннего сервиса>/api/v1/user/token`.

### Пример GET-запроса к облаку Эвотор
Получить список всех магазинов пользователя:

```
-X GET --header 'Accept: application/json' --header 'X-Authorization: <ключ авторизации>' --header 'Content-Type: application/json' 'https://api.evotor.ru/api/v1/inventories/stores/search'
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

### Пример POST-запроса

Создать новый товар в определённом магазине:

```
curl -X POST --header 'Content-Type: application/json' --header 'Accept: application/json' --header 'X-Authorization: <токен>' -d '[{"uuid":"n1e2w3-t4ov5qr6","code":"","barCodes":[],"alcoCodes":[],"name":"Новый товар","price":0,"quantity":0,"costPrice":0,"measureName":"","tax":"NO_VAT","allowToSell":false,"description":"","articleNumber":"","parentUuid":"","group":false,"type":"NORMAL","alcoholByVolume":0,"alcoholProductKindCode":0,"tareVolume":0}]' 'https://api.evotor.ru/api/v1/inventories/stores/storeUuid-123456/products'
```

```
no cotent
```

При создании товаров в ответ приходит пустое сообщение. Код ответа в случае удачного добавления – 200.

### Справочник API
Ознакомиться c запросами к REST API облака Эвотор вы можете на сайте https://api.evotor.ru/docs в разделе **REST API облака Эвотор**.
