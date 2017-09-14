---
title: Манифест Java-приложения
keywords: Манифест, Java, manifest
summary:
sidebar: evotordoc_sidebar
permalink: doc_java_app_manifest.html
tags: [Terminal, Java]
folder: java_SDK
---

Ниже приведён пример манифеста java-приложения, которое добавляет две [иконки на экран оплаты](./doc_java_app_icon.html).

Изменяйте манифест соответствующим образом, чтобы настроить взаимодействие приложения со смарт-терминалом с помощью [точек интеграции](./doc_app_integration_points.html).

При разработке драйвера для устройств нужно учитывать дополнительные параметры (см. [SDK для денежных ящиков](./doc_drivers_cashdrawer.html) и другие разделы, посвящённые разработке драйверов).

```xml
<manifest package="com.example.myapplication">

  <application android:theme="@style/AppTheme" android:icon="@mipmap/ic_launcher" android:allowBackup="true" xmlns:android="http://schemas.android.com/apk/res/android">

    <meta-data android:name="app_uuid" android:value="<Строка с идентификатором приложения, представленном в формате uuid4>"/>

    <service android:name=".UIPluginServiceImplementation" android:exported="true" android:enabled="true">
      <intent-filter>
        <action android:name="android.intent.action.MAIN"/>
        <category android:name="android.intent.category.DEFAULT"/>
        <category android:name="android.intent.category.EVOTOR"/>
      </intent-filter>
    </service>

    <service android:name=".DaemonServiceImplementation" android:exported="true" android:enabled="true">
      <intent-filter>
        <action android:name="android.intent.action.MAIN"/>
        <category android:name="android.intent.category.DEFAULT"/>
        <category android:name="android.intent.category.EVOTOR"/>
      </intent-filter>
    </service>

    <activity android:icon="@mipmap/hello_sales_view_icon" android:name=".HELLO_SALES_VIEW" android:label="Hello">
      <intent-filter android:priority="90">
        <action android:name="android.intent.action.MAIN"/>
        <category android:name="evo.v2.receipt.sell.receiptDiscount"/>
        <category android:name="android.intent.category.DEFAULT"/>
      </intent-filter>
      <meta-data android:name="ru.evotor.sales_screen.BACKGROUND_COLOR" android:value="@color/hello_sales_view_launcher_color"/>
    </activity>

    <service android:icon="@mipmap/hello_sales_view_icon" android:name=".HELLO_SALES_VIEW_SERVICE" android:exported="true" android:enabled="true" android:label="Hello">
      <intent-filter>
        <action android:name="android.intent.action.MAIN"/>
        <action android:name="evo.v2.receipt.sell.receiptDiscount"/>
        <category android:name="android.intent.category.DEFAULT"/>
      </intent-filter>
      <meta-data android:name="ru.evotor.sales_screen.BACKGROUND_COLOR" android:value="@color/hello_sales_view_launcher_color"/>
    </service>

    <activity android:icon="@mipmap/world_sales_view_icon" android:name=".WORLD_SALES_VIEW" android:label="World">
      <intent-filter android:priority="90">
        <action android:name="android.intent.action.MAIN"/>
        <category android:name="evo.v2.receipt.sell.receiptDiscount"/>
        <category android:name="android.intent.category.DEFAULT"/>
      </intent-filter>
      <meta-data android:name="ru.evotor.sales_screen.BACKGROUND_COLOR" android:value="@color/world_sales_view_launcher_color"/>
    </activity>

    <service android:icon="@mipmap/world_sales_view_icon" android:name=".WORLD_SALES_VIEW_SERVICE" android:exported="true" android:enabled="true" android:label="World">
      <intent-filter>
        <action android:name="android.intent.action.MAIN"/>
        <action android:name="evo.v2.receipt.sell.receiptDiscount"/>
        <category android:name="android.intent.category.DEFAULT"/>
      </intent-filter>
      <meta-data android:name="ru.evotor.sales_screen.BACKGROUND_COLOR" android:value="@color/world_sales_view_launcher_color"/>
    </service>

  </application>

</manifest>
```

{% include note.html content="В секции `application`, требуется указать элемент `meta-data`, который содержит идентификатор приложения – строка в формате uuid4. Вы найдёте идентификатор приложения в адресной строке браузера, когда выберете приложение на сайте [dev.evotor.ru](https://dev.evotor.ru)." %}
