---
title: Логирование
keywords: sample
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

### JS-приложение

Используйте функцию объекта `logger` для записи событий JS-приложений:

```javascript
    logger.log(String)
```

Функция отображает в `logcat` значение `String`.

{% include important.html content="Перед использованием объекта `logger` в демонах или плагинах, объект требуется получить с помощью функции `require`: `var logger = require('logger')`." %}


### Java-приложение

Для записи событий Java-приложений используйте методы класса `Log`:

* `Log.v(String, String)` – Verbose;
* `Log.d(String, String)` – Debug;
* `Log.i(String, String)` – Info;
* `Log.w(String, String)` – Warn;
* `Log.e(String, String)` – Error.

Подробное описание класса и используемых методов смотрите в [документации для ОС Android](https://developer.android.com/reference/android/util/Log.html).
