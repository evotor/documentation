---
title: Манифест Java-приложения
keywords: Манифест, Java, manifest
summary:
sidebar: evotordoc_sidebar
permalink: doc_java_app_manifest.html
tags: [terminal, java]
folder: java_SDK
---

Ниже приведён пример манифеста java-приложения, которое добавляет две [иконки на экран оплаты](./doc_java_app_icon.html).

Изменяйте манифест соответствующим образом, чтобы настроить взаимодействие приложения со смарт-терминалом с помощью [точек интеграции](./doc_app_integration_points.html).

При разработке драйвера для устройств нужно учитывать дополнительные параметры (см. [SDK для денежных ящиков](./doc_drivers_cashdrawer.html) и другие разделы, посвящённые разработке драйверов).

{% include note.html content="В секции `application`, требуется указать элемент `meta-data`, который содержит идентификатор приложения – строка в формате `uuid4`. Вы найдёте идентификатор приложения в адресной строке браузера, когда выберете приложение на сайте [dev.evotor.ru](https://dev.evotor.ru)." %}

{% include image.html file="app_uuid.png" url="images/app_uuid.png" caption="Идентификатор приложения" %}

## Пример манифеста приложения

```xml
<?xml version="1.0" encoding="utf-8"?>
<manifest xmlns:android="http://schemas.android.com/apk/res/android"
    package="com.example.mythirdjavaapplication">

  <application
      android:allowBackup="true"
      android:icon="@mipmap/ic_launcher"
      android:label="@string/app_name"
      android:roundIcon="@mipmap/ic_launcher_round"
      android:supportsRtl="true"
      android:theme="@style/AppTheme">

      <meta-data android:name="app_uuid" android:value="<Строка с идентификатором приложения, представленном в формате uuid4>"/>

      <activity
          android:name=".MainActivity"
          android:label="@string/title_activity_main"
          android:theme="@style/AppTheme.NoActionBar">
          <meta-data
              android:name="ru.evotor.launcher.BACKGROUND_COLOR"
              android:value="#133788" />

          <intent-filter>
              <action android:name="android.intent.action.MAIN" />

              <category android:name="android.intent.category.EVOTOR" />
          </intent-filter>
      </activity>

    <service
        android:name=".MyLittleService"
        android:enabled="true"
        android:exported="true">
        <intent-filter>
            <category android:name="android.intent.category.DEFAULT" />

            <action android:name="evo.v2.receipt.sell.beforePositionsEdited" />
        </intent-filter>
    </service>

    <activity android:name=".SugarSuggestionActivity" />

    <receiver
        android:name=".MyLittleReceiver"
        android:enabled="true"
        android:exported="true">
        <intent-filter>
            <action android:name="evotor.intent.action.receipt.sell.POSITION_ADDED" />
            <category android:name="android.intent.category.DEFAULT" />
        </intent-filter>
    </receiver>
  </application>

</manifest>
```
