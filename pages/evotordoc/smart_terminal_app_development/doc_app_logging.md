---
title: Логирование
keywords:
summary: "Раздел содержит информацию о доступе к логам приложений."
sidebar: evotordoc_sidebar
permalink: doc_app_logging.html
tags: [Терминал, JavaScript, Java]
folder: smart_terminal_app_development
published: true
---
Для доступа к логам и отладки приложения на терминале реализован [режим разработчика](./doc_developer_mode.html).

Вы можете просматривать логи с помощью утилиты `logcat`.

Запись событий приложения зависит от типа приложения.

{% include tip.html content="Вам будет легче найти логи своего приложения, если вы добавите `packageName` приложения в текст лога или в виде тега. " %}

### JS-приложение

*Чтобы записывать логи в JS-приложении:*

1. Подключите модуль для записи логов:

   ```javascript
   var storage = require('logger')
   ```

2. Используйте функцию объекта `logger` для записи событий JS-приложений:

   ```javascript
   logger.log(String)
   ```

Функция отображает в `logcat` значение `String`.

### Java-приложение

Для записи событий Java-приложений используйте методы класса `Log`:

* `Log.v(String, String)` – Verbose;
* `Log.d(String, String)` – Debug;
* `Log.i(String, String)` – Info;
* `Log.w(String, String)` – Warn;
* `Log.e(String, String)` – Error.

Подробное описание класса и используемых методов смотрите в [документации для ОС Android](https://developer.android.com/reference/android/util/Log.html).
