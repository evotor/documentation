---
title: Об Облаке Эвотор
keywords: sample
summary: "Раздел содержит вводную информацию для работы с нашей документацией."
sidebar: evotordoc_sidebar
permalink: doc_evotor_api_about.html
tags: [Облако, Товары, Чеки]
folder: evotordoc/evotor_api
published: true
---

Облако Эвотор позволяет интегрировать сторонний сервис и смарт-терминал. В Облаке хранятся следующие данные пользователей платформы:

* Магазины;
* Сотрудники;
* Смарт-терминалы;
* Товары;
* Документы смарт-терминала.

Для доступа к данным облака используйте Эвотор API. Эвотор API – это REST API, который поддерживает методы как для доступа к данным пользователя, так и для взаимодействия со сторонним сервисом. Все методы Эвотор API описаны в [справочние API](https://api.evotor.ru/docs).

Методы, которые дают доступ к данным описаны в разделах:

* [Сущности пользователя Эвотор](https://api.evotor.ru/docs/#tag/Sushnosti-polzovatelya-Evotor);
* [Товары и документы](https://api.evotor.ru/docs/#tag/Tovary-i-dokumenty);
* [Схемы и дополнительные поля товаров](https://api.evotor.ru/docs/#tag/Shemy-i-dopolnitelnye-polya-tovarov).

Методы, собранные в разделах [вебхуки-запросы](https://api.evotor.ru/docs/#tag/Vebhuki-zaprosy) и [веб-хуки уведомления](https://api.evotor.ru/docs/#tag/Vebhuki-uvedomleniya), позволяют стороннему сервису получать изменения, которые происходят в Облаке.

[Установленные на смарт-терминале приложения](./doc_smart_terminal_applications.html) не работают с Облаком напрямую и получают данные с помощью сторонних сервисов.
