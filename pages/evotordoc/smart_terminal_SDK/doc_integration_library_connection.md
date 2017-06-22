---
title: Подключение оборудования
keywords: sample
summary:
sidebar: evotordoc_sidebar
permalink: doc_integration_library_connection.html
tags: [Оборудование, Терминал, Java]
folder: smart_terminal_SDK
---

Методы API смарт-терминала дают приложениям доступ к:

* [сканеру штрихкодов](doc_barcode_scanner.html);
* [встроенному принтеру чеков](doc_bill_printer.html);
* [весам](doc_scales.html).

Методы содержатся в библиотеке `integration-library`.

Чтобы подключить библиотеку, в файле `build.gradle` приложения, укажите:

```
allprojects {
    repositories {
        jcenter()
        maven { url 'https://jitpack.io' }
    }
}
dependencies {
compile 'com.github.evotor:integration-library:v0.3.1'
}
```

где:

* `repositories` – содержит ссылки на репозитории необходимые при сборке.
* `dependencies` – подключает библиотеку, которая содержит все данные, необходимые для работы с оборудованием, подключённым к смарт-терминалу. `v0.3.1` – точная версия проекта.
