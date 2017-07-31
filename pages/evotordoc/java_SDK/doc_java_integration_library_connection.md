---
title: Подключение библиотеки для разработки Java-приложений
keywords:
summary: Раздел содержит информацию, которая поможет вам начать разработку java-приложения с нуля. Вы узнаете как собрать APK-файл своей программы, который потребуется для установки на смарт-терминал.
sidebar: evotordoc_sidebar
permalink: doc_java_integration_library_connection.html
tags: [Терминал, Java]
folder: java_SDK
---

### Требования

Для разработки java-приложения, вам потребуется:

* Android Studio версии 2.3.3 или выше;
* библиотека [integration-library](https://github.com/evotor/integration-library) версии 0.4+.

### Подключение библиотеки

*Чтобы подключить библиотеку integration-library:*

1. В Android Studio создайте новый проект: `<YourProjectName>`.

    При создании проекта убедитесь, что в раскрывающемся списке **Minimum SDK** выбран API версии 22 или выше.

    В качестве примера, используйте операцию **Empty Activity**. Вы можете не добавлять операцию или использовать любую из предложенных.

    На скриншоте представлена структура полученного проекта:

    ![](./images/project_sctructure.png "Структура проекта <YourProjectName>")

    [Манифест проекта](/doc_js_app_manifest.html) выглядит так:

   ```xml
   <?xml version="1.0" encoding="utf-8"?>
    <manifest xmlns:android="http://schemas.android.com/apk/res/android" package="com.example.<yourprojectname>">

      <application
          android:allowBackup="true"
          android:icon="@mipmap/ic_launcher"
          android:label="@string/app_name"
          android:roundIcon="@mipmap/ic_launcher_round"
          android:supportsRtl="true"
          android:theme="@style/AppTheme">
          <activity android:name=".<НазваниеОперации>">
              <intent-filter>
                  <action android:name="android.intent.action.MAIN" />

                  <category android:name="android.intent.category.LAUNCHER" />
              </intent-filter>
          </activity>
      </application>

    </manifest>
   ```

2. В файле `build.gradle (Project: <YourProjectName>)` укажите:

   ```
   allprojects {
       repositories {
           jcenter()
           maven { url 'https://jitpack.io' }
       }
   }
   ```

3. В файле `build.gradle (Module: app)`, добавьте библиотеку integration-library в зависимости (dependencies):

   ```
   compile group: 'com.github.evotor', name: 'integration-library', version: 'v0.4.+'
   ```

    Убедитесь, что в зависимости указана [актуальная версия библиотеки](https://github.com/evotor/integration-library/).


Библиотека подключена к проекту. Теперь вы можете собрать APK-файл своей программы и [установить её на смарт-терминал](./doc_app_installation.html).

Так же, теперь вы можете:

* [добавить иконку приложения на главный экран или экран оплаты](doc_java_app_icon.html);
* [установить приложение на смарт-терминал](./doc_app_installation.html).

<!-- {% include note.html content="Манифест должен содержать элемент \<meta-data/\> с информацией об идентификаторе приложения (см. раздел [\"Манифест приложения\"](./doc_js_app_manifest.html))." %} -->
