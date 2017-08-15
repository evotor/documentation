---
title: Подключение шаблона JS-приложения
keywords:
summary:
sidebar: evotordoc_sidebar
permalink: doc_js_app_template_link.html
tags: [Терминал, JavaScript]
folder: js_SDK
---

С помощью шаблона JS-приложения вы можете создать APK приложения, которое добавляет две новые иконки на экран скидок. Нажатие на иконки запускает экраны (views) приложения.

{% include important.html content="Перед началом работы убедитесь, что в настройках Android Studio отключён параметр Instant run." %}

### Требования

Для разработки js-приложения, вам потребуется:

* Android Studio версии 2.3.3 или выше;
* плагин [template-plugin](https://github.com/evotor/template-plugin) версии 1.1.7.

### Подключение шаблон JS-приложения

*Чтобы подключить шаблон JS-приложения:*

1. В Android Studio создайте новый проект: `<YourProjectName>`.

    При создании проекта убедитесь, что в раскрывающемся списке **Minimum SDK** выбран API версии 22 или выше.

    В качестве примера, используйте операцию **Empty Activity**. Вы можете не добавлять операцию или использовать любую из предложенных.

    На скриншоте представлена структура полученного проекта:

    ![](./images/JS_project_sctructure_with_plugin.png "Структура проекта <YourProjectName>")

    [Манифест проекта](/doc_js_app_manifest.html) выглядит так:

   ```yaml
   version: 1
   versionName: "1.0.0"

   packageName: "packageName"
   appName: "ApplicationName"
   appUUID: "ApllicationUUID"

   views:
     - name: hello_sales_view # Запрещено использовать верхний регистр и ,-*&^%$# и т.д
       header: "Hello header"
       label: "Hello"
       color: "#FF1493"
       icon_96: icons/icon-96.png
       icon_192: icons/icon-192.png
       icon_256: icons/icon-256.png
       source: views/view.html
       point: SALES_SCREEN # Variants are MAIN_SCREEN and SALES_SCREEN
       grants:
               - CASH_OPERATIONS_SELL
       scripts:
         - no-script
       styles:
         - "*.css"
     - name: world_sales_view # Запрещено использовать верхний регистр и ,-*&^%$# и т.д
       header: "World header"
       label: "World"
       color: "#0000CD"
       icon_96: icons/icon-96.png
       icon_192: icons/icon-192.png
       icon_256: icons/icon-256.png
       source: views/view.html
       point: SALES_SCREEN # Variants are MAIN_SCREEN and SALES_SCREEN
       grants:
               - CASH_OPERATIONS_SELL
       scripts:
         - no-script
       styles:
         - "*.css"
   ```

2. В файле `build.gradle (Project: <YourProjectName>)` укажите:

   ```
   buildscript {
       repositories {
           jcenter()
           maven { url 'https://jitpack.io' }
       }
       dependencies {
           ...
           classpath group: 'com.github.evotor', name: 'template-plugin', version: 'v1.1.7'
       }
   }

   allprojects {
       repositories {
         ...
         maven { url 'https://jitpack.io' }
       }
     }
   ```

3. В файле `build.gradle (Module: app)`, добавьте плагин template-plugin в зависимости (dependencies):

   ```
   dependencies {
           compile 'com.github.evotor:template-plugin:v1.1.7'
   }
   ```

   и подключите плагин:

   ```
   apply plugin: 'ru.evotor.webbasedapplication'
   ```

  Убедитесь, что в зависимости указана [актуальная версия плагина](https://github.com/evotor/template-plugin).


Плагин подключён к проекту. Теперь вы можете собрать APK-файл своей программы и [установить её на смарт-терминал](./doc_app_installation.html).

{% include important.html content="После подключения плагина, Android Studio не \"разрешает\" некоторые классы. Не обращайте на это внимания, вы всё равно можете собрать APK приложения и установить его на терминал." %}

Так же, теперь вы можете:

* [добавить иконку приложения на главный экран или экран оплаты](doc_js_app_icon.html);
* [установить приложение на смарт-терминал](./doc_app_installation.html).

<!-- {% include note.html content="Манифест должен содержать элемент \<meta-data/\> с информацией об идентификаторе приложения (см. раздел [\"Манифест приложения\"](./doc_js_app_manifest.html))." %} -->
