---
title: Подключение библиотеки для разработки Java-приложений
keywords: Разработка, Java, библиотека, integration-library
summary: Раздел содержит информацию, которая поможет вам начать разработку java-приложения с нуля. Вы узнаете как собрать APK-файл своей программы, который потребуется для установки на смарт-терминал.
sidebar: evotordoc_sidebar
permalink: doc_java_integration_library_connection.html
tags: [terminal, java]
folder: java_SDK
---

## Требования

Для разработки java-приложения, вам потребуется:

* Android Studio версии 3.0 или выше;
* библиотека [integration-library](https://github.com/evotor/integration-library) версии 0.4+.

## Подключение библиотеки

*Чтобы подключить библиотеку integration-library:*

1. В Android Studio создайте новый проект: `<YourProjectName>`.

   При создании проекта убедитесь, что в раскрывающемся списке **Minimum SDK** выбран API версии 22 или выше.

   В качестве примера, используйте операцию **Empty Activity**. Вы можете не добавлять операцию или использовать любую из предложенных.

   На скриншоте представлена структура полученного проекта:

   {% include image.html file="project_sctructure.png" url="images/project_sctructure.png" caption="Структура проекта" %}

   [Манифест созданного проекта](/doc_java_app_manifest.html) выглядит так:

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

   {% include note.html content="Работы с приложением, манифест должен содержать элемент `<meta-data/>` с идентификатором приложения (см. раздел [\"Манифест приложения\"](./doc_java_app_manifest.html))." %}

2. В файле проекта `build.gradle (Project: <YourProjectName>)` укажите:

   ```
   allprojects {
       repositories {
           jcenter()
           maven { url 'https://jitpack.io' }
       }
   }
   ```

3. В файле приложения `build.gradle (Module: app)`, добавьте библиотеку integration-library в зависимости:

   ```
   dependencies {
   compile group: 'com.github.evotor', name: 'integration-library', version: 'v0.4.+'
   }
   ```

    Убедитесь, что вы используете [актуальную версию библиотеки](https://github.com/evotor/integration-library/).

4. В проекте укажите параметр minSdkVersion:

   ```
   defaultConfig {
        minSdkVersion 22
   ...
   }
   ```

Библиотека подключена к проекту. Теперь вы можете собрать APK-файл своего приложения.

Также вы можете:

* [добавить иконку приложения на главный экран или экран оплаты](doc_java_app_icon.html);
* [установить приложение на смарт-терминал](./doc_app_installation.html).
