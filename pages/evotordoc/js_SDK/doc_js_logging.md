---
title: Логирование JS-приложения
keywords: логи, журналы, logger
summary:
sidebar: evotordoc_sidebar
permalink: doc_js_logging.html
tags: [Терминал, JavaScript]
folder: js_SDK
published: true
---
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
