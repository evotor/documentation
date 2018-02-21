---
title: Авторизация вебхуков, которые Облако Эвотор передаёт в сторонний сервис
keywords:
summary:
sidebar: evotordoc_sidebar
permalink: doc_evotor_api_authorization.html
tags: [cloud]
folder: evotor_api
---

Облако Эвотор авторизует запросы с помощью заголовка `X-Authorization`, который содержит [токен Облака Эвотор](./doc_authorization.html).

Запросы Облака к стороннему сервису требуется авторизовать в зависимости от типа запроса:


* *Вебхуки-запросы*. Сторонний сервис авторизует такие запросы с помощью [токена приложения стороннего сервиса](./doc_evotor_api_authorization.html#serverToken), который вы указываете в соответствующих параметрах, на вкладке **Интеграция**, в Личном кабинете на [сайте разработчиков](https://dev.evotor.ru).
* *Вебхуки-уведомления*. Все уведомления, кроме [*Событий подписки*](https://api.evotor.ru/docs/#tag/Vebhuki-uvedomleniya%2Fpaths%2F~1partner.ru~1api~1v1~1subscription~1event%2Fpost) и [*Событий установки и удаления приложений*](https://api.evotor.ru/docs/#tag/Vebhuki-uvedomleniya%2Fpaths%2F~1partner.ru~1api~1v1~1subscription~1event%2Fpost), сторонний сервис должен авторизовать с помощью [токена пользователя приложения стороннего сервиса](./doc_evotor_api_authorization.html#usersToken), который Облако получает от стороннего сервиса при регистрации или авторизации пользователей.

  {% include note.html content="События подписки и события установки и удаления приложений авторизуются с помощью токена приложения стороннего сервиса." %}

## Токен приложения стороннего сервиса {#serverToken}

Токен приложения стороннего сервиса необходим для авторизации следующих запросов и уведомлений Облака:

* [Регистрация новой учётной записи](https://api.evotor.ru/docs/#tag/Vebhuki-zaprosy%2Fpaths%2F~1partner.ru~1api~1v1~1user~1create%2Fpost);
* [Авторизация существующего пользователя](https://api.evotor.ru/docs/#tag/Vebhuki-zaprosy%2Fpaths%2F~1partner.ru~1api~1v1~1user~1verify%2Fpost);
* [События подписки](https://api.evotor.ru/docs/#tag/Vebhuki-uvedomleniya%2Fpaths%2F~1partner.ru~1api~1v1~1subscription~1event%2Fpost);
* [События установки и удаления приложений](https://api.evotor.ru/docs/#tag/Vebhuki-uvedomleniya%2Fpaths%2F~1partner.ru~1api~1v2~1installation~1event%2Fpost);
* [Передача токена Облака Эвотор](https://api.evotor.ru/docs/#tag/Vebhuki-zaprosy%2Fpaths%2F~1partner.ru~1api~1v1~1user~1token%2Fpost).

*Чтобы задать токен приложения стороннего сервиса:*

1. На сайте dev.evotor.ru выберите приложение для которого требуется задать токен.
2. На вкладке **Интеграция** выберите необходимый параметр (например, **Регистрация учётной записи в стороннем сервисе**) и укажите один из вариантов:

   * Если вы указали **С помощью токена**. В поле **Токен**, укажите токен приложения стороннего сервиса в формате `uuid4`.

     Облако передаёт токен в заголовке `Authorization`.

   * Если вы указали **Запрос логина и пароля ( Basic Auth )**. В полях **Логин** и **Пароль** укажите данные для доступа к стороннему сервису.

     Облако кодирует логин и пароль с помощью base64 и передаёт закодированные данные в заголовке `Authorization`.

В ответ на вебхуки-запросы [Регистрация новой учётной записи](https://api.evotor.ru/docs/#tag/Vebhuki-zaprosy%2Fpaths%2F~1partner.ru~1api~1v1~1user~1create%2Fpost) и [Авторизация существующего пользователя](https://api.evotor.ru/docs/#tag/Vebhuki-zaprosy%2Fpaths%2F~1partner.ru~1api~1v1~1user~1verify%2Fpost) сторонний сервис возвращает в Облако токен пользователя.

## Токен пользователя приложения стороннего сервиса {#usersToken}

При [создании нового](https://api.evotor.ru/docs/#tag/Vebhuki-zaprosy%2Fpaths%2F~1partner.ru~1api~1v1~1user~1create%2Fpost) или [авторизации существующего](https://api.evotor.ru/docs/#tag/Vebhuki-zaprosy%2Fpaths%2F~1partner.ru~1api~1v1~1user~1verify%2Fpost) пользователя, сторонний сервис возвращает в Облако уникальный токен пользователя приложения стороннего сервиса. Облако передаёт токен в заголовке `Authorization` вебхуков-уведомлений.

С помощью токена пользователя приложения стороннего сервиса вы можете определить пользователя своего приложения.

Облако передаёт токен пользователя приложения стороннего сервиса в следующих вебхуках-уведомлениях:

* [Создать товары](https://api.evotor.ru/docs/#tag/Vebhuki-uvedomleniya%2Fpaths%2F~1partner.ru~1api~1v1~1inventories~1stores~1%7BstoreUuid%7D~1products%2Fpost);
* [Передать документы](https://api.evotor.ru/docs/#tag/Vebhuki-uvedomleniya%2Fpaths%2F~1partner.ru~1api~1v1~1inventories~1stores~1%7BstoreUuid%7D~1documents%2Fput);
* [Создать смарт-терминал](https://api.evotor.ru/docs/#tag/Vebhuki-uvedomleniya%2Fpaths%2F~1partner.ru~1api~1v1~1inventories~1devices%2Fput);
* [Создать сотрудника](https://api.evotor.ru/docs/#tag/Vebhuki-uvedomleniya%2Fpaths%2F~1partner.ru~1api~1v1~1inventories~1employees%2Fput);
* [Создать магазин](https://api.evotor.ru/docs/#tag/Vebhuki-uvedomleniya%2Fpaths%2F~1partner.ru~1api~1v1~1inventories~1stores%2Fput);
* [Отправить чек (V2)](https://api.evotor.ru/docs/#tag/Vebhuki-uvedomleniya%2Fpaths%2F~1partner.ru~1api~1v2~1receipts%2Fpost).
