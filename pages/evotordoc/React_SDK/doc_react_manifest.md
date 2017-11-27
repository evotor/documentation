---
title: Манифест приложения на React Native
keywords:
summary:
sidebar: evotordoc_sidebar
permalink: doc_react_manifest.html
tags: [terminal, react]
folder: react_SDK
published: true
---

Ниже приведён пример манифеста React Native  приложения, которое вы создали при [подготовке среды к разработке приложения](./doc_react_getting_started.html).

{% include note.html content="В секции `application`, требуется указать элемент `meta-data`, который содержит идентификатор приложения – строка в формате `uuid4`. Идентификатор отображается в поле **Идентификатор приложениия** на вкладке **APK** вашего приложения, на сайте [dev.evotor.ru](https://dev.evotor.ru)." %}

```xml
<manifest xmlns:android="http://schemas.android.com/apk/res/android"
    package="com.YourAppName"
    android:versionCode="1"
    android:versionName="1.0">

    <uses-permission android:name="android.permission.INTERNET" />
    <uses-permission android:name="android.permission.SYSTEM_ALERT_WINDOW"/>

    <uses-sdk
        android:minSdkVersion="22"
        android:targetSdkVersion="22" />

    <application
      android:name=".MainApplication"
      android:allowBackup="true"
      android:label="@string/app_name"
      android:icon="@mipmap/ic_launcher"
      android:theme="@style/AppTheme">

      <meta-data android:name="app_uuid" android:value="<Идентификатор приложения>"/>

      <activity
        android:name=".MainActivity"
        android:label="@string/app_name"
        android:configChanges="keyboard|keyboardHidden|orientation|screenSize"
        android:windowSoftInputMode="adjustResize">
          <meta-data
              android:name="ru.evotor.launcher.BACKGROUND_COLOR"
              android:value="#133788" />
          <intent-filter>
              <action android:name="android.intent.action.MAIN" />
              <category android:name="android.intent.category.EVOTOR" />
          </intent-filter>
          <intent-filter>
            <action android:name="android.intent.action.MAIN" />
            <category android:name="android.intent.category.LAUNCHER" />
        </intent-filter>
      </activity>
      <activity android:name="com.facebook.react.devsupport.DevSettingsActivity" />
    </application>

</manifest>

```

{% include note.html content="Все необходимые разрешения и службы объявлены в манифесте, размещённом по адресу `YourAppName/node_modules/evotor-integration-library/android/app/src/main`." %}
