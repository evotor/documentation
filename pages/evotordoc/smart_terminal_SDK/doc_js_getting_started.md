---
title: Начало разработки
keywords:
summary: Раздел содержит информацию, которая поможет вам начать разработку JS-приложения с нуля. Вы узнаете как собрать APK-файл своей программы, который потребуется для установки на смарт-терминал.
sidebar: evotordoc_sidebar
permalink: doc_JS_getting_started.html
tags: [Терминал, javascript]
folder: smart_terminal_SDK
---

Плагин template-plugin создаёт шаблон JS-приложения, которое, после установки на терминал добавляет две иконки на экран оплаты (см. скриншот).

![](./images/template_plugin_applied.png)

Изменяя и дополняя шаблон вы сможете разработать приложение, которое будет решать ваши задачи.

### Требования

Для разработки JS-приложения с помощью плагина, вам потребуется:

* Android Studio версии 2.3.3 или выше;
* плагин [template-plugin](https://github.com/evotor/template-plugin) версии 1.1.7.

### Подключение плагина template-plugin

*Чтобы подключить плагин template-plugin:*

1. В Android Studio создайте новый проект: `<YourProjectName>`.

    При создании проекта убедитесь, что в раскрывающемся списке **Minimum SDK** выбран API версии 22 или выше.

    На этапе выбора операции, выберите No Activity.

    Структура созданного проекта будет выглядеть следующим образом:

    ![](./images/JS_project_sctructure.png)

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

2. В файле `build.gradle (Module: app)`, подключите плагин template-plugin и укажите его в зависимостях (dependencies):

    ```
    apply plugin: 'ru.evotor.webbasedapplication'
    ```

    ```
    dependencies {
            compile 'com.github.evotor:template-plugin:v1.1.7'
    }
    ```

    Убедитесь, что в зависимости указана [актуальная версия плагина](https://github.com/evotor/integration-library/).

Плагин подключён к проекту. Теперь вы можете собрать APK-файл своей программы и [установить её на смарт-терминал](./doc_app_installation.html).

{% include note.html content="Обратите внимание на заполнение [Манифеста приложения](./doc_js_app_manifest.html))." %}

Структура проекта с подключённым плагином выглядит следующим образом:

![](./images/JS_project_sctructure_with_plugin.png)

Где файл client.yaml, это [манифест JS-приложения](./doc_js_app_manifest.html), на основе которого, Android Studio, при сборке apk-файла, автоматически наполняет файл AndroidManifest.xml.
