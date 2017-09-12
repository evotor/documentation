---
title: Логирование Java-приложения
keywords: логи, журналы, log
summary:
sidebar: evotordoc_sidebar
permalink: doc_java_logging.html
tags: [Терминал, Java]
folder: java_SDK
published: true
---
Для записи событий Java-приложений используйте методы класса `Log`:

* `Log.v(String, String)` – Verbose;
* `Log.d(String, String)` – Debug;
* `Log.i(String, String)` – Info;
* `Log.w(String, String)` – Warn;
* `Log.e(String, String)` – Error.

Смарт-терминал фильтрует логи по имени пакета (*packagename*) приложения.

Чтобы ваши логи отображались в logcat необходимо добавить имя пакета приложения в тэг или в текст сообщения:

```java
private static final String TAG = "packagename";
Log.v(TAG, String);
```

Подробное описание класса и используемых методов смотрите в [документации для ОС Android](https://developer.android.com/reference/android/util/Log.html).
