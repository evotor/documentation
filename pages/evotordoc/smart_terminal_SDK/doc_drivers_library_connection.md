---
title: Подготовка к разработке
keywords: sample
summary:
sidebar: evotordoc_sidebar
permalink: doc_drivers_library_connection.html
folder: smart_terminal_SDK
---

Для начала разработки подключите библиотеку для работы с оборудованием.

Добавьте ссылку на репозиторий на репозиторий `jitpack` в `build.gradle` проекта.

```g
     allprojects {
repositories {
    jcenter()
    maven { url 'https://jitpack.io' }
    }
}
```

В модуле `build.gradle` добавьте зависимость и укажите точную версию:

```g
    dependencies {
    compile 'com.github.evotor:device-drivers:v2.0.1+'
    }
```

{% include note.html content="Все имена констант указаны из `ru.evotor.devices.drivers.Constants`."%}
