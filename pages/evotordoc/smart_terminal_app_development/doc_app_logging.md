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

Описание доступа к логам приложения приводится в соответствующих разделах:

* [Логирование Java-приложения](./doc_java_logging.html).
* [Логирование JS-приложения](./doc_js_logging.html).
