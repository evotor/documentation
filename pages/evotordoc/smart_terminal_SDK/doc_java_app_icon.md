---
title: Иконка приложения в интерфейсе смарт-терминала
keywords:
summary:
sidebar: evotordoc_sidebar
permalink: doc_java_app_icon.html
tags: [Терминал, Java]
folder: smart_terminal_SDK
---

### Иконка приложения на главном экране смарт-терминала

*Чтобы добавить иконку приложения на главный экран смарт-терминала:*

В [манифесте приложения](./doc_java_app_manifest.html), измените секцию требуемой операции следующим образом:

```xml
 <activity
   android:name=".<НазваниеОперации>"
   android:icon="@mipmap/ic_launcher"
   android:label="Example tile"
   >
   <meta-data
       android:name="ru.evotor.launcher.BACKGROUND_COLOR"
       android:value="#133788" />
   <intent-filter>
       <action android:name="android.intent.action.MAIN" />
       <category android:name="android.intent.category.EVOTOR" />
    </intent-filter>
 </activity>
```

   Где:

   Атрибут `android:name="ru.evotor.launcher.BACKGROUND_COLOR"` указывает, что иконка приложения будет отображаться на главном экране смарт-терминала.

### Иконка приложения на экране оплаты:

*Чтобы добавить иконку приложения на экран оплаты смарт-терминала:*

1. В [созданном приложении](./doc_java_getting_started.html) создайте службу (`service`).

   Для этого выполните следующие действия: File → New → Service → Service (IntentService).

   Добавленная служба автоматически объявится в манифесте приложения:

   ```xml
   <service
       android:name=".<Имя службы>"
       android:exported="false">
   </service>
   ```

2. В манифесте приложения, измените секцию добавленной службы следующим образом:

   ```xml
   <service
    android:name=".<Имя службы>"
    android:icon="@mipmap/ic_launcher_round"
    android:label="Hello world">
    <meta-data
        android:name="ru.evotor.sales_screen.BACKGROUND_COLOR"
        android:value="#133788" />

    <intent-filter android:priority="20">
        <category android:name="android.intent.category.DEFAULT" />

        <action android:name="evo.v2.receipt.sell.receiptDiscount" />
    </intent-filter>
    </service>
   ```

   Где:

   Атрибут `android:name="ru.evotor.sales_screen.BACKGROUND_COLOR"` указывает, что иконка приложения будет отображаться на экране оплаты смарт-терминала.

   Фильтр `<action android:name="evo.v2.receipt.sell.receiptDiscount" />` сообщает приложению где отображать иконку.

Итоговый манифест приложения, иконки которого отображаются как на главном экране, так и на экране оплаты выглядит так:

```xml
<?xml version="1.0" encoding="utf-8"?>
<manifest xmlns:android="http://schemas.android.com/apk/res/android"
    package="com.example.yourprojectname">

    <application
        android:allowBackup="true"
        android:icon="@mipmap/ic_launcher"
        android:label="@string/app_name"
        android:roundIcon="@mipmap/ic_launcher_round"
        android:supportsRtl="true"
        android:theme="@style/AppTheme">
        <activity
            android:name=".<Имя операции>"
            android:icon="@mipmap/ic_launcher_round"
            android:label="Hello world"
            android:theme="@style/AppTheme.NoActionBar">
            <meta-data
                android:name="ru.evotor.sales_screen.BACKGROUND_COLOR"
                android:value="#133788" />

            <intent-filter>
                <action android:name="android.intent.action.MAIN" />

                <category android:name="android.intent.category.EVOTOR" />
            </intent-filter>
        </activity>

        <service
            android:name=".<Имя службы>"
            android:icon="@mipmap/ic_launcher_round"
            android:label="Hello world">
            <meta-data
                android:name="ru.evotor.sales_screen.BACKGROUND_COLOR"
                android:value="#133788" />

            <intent-filter android:priority="20">
                <category android:name="android.intent.category.DEFAULT" />

                <action android:name="evo.v2.receipt.sell.receiptDiscount" />
            </intent-filter>
        </service>
    </application>

</manifest>
```

Теперь вы можете собрать apk своего приложения и [установить его на терминал](./doc_app_installation.html). Иконки приложения будут отображаться как на главном экране смарт-терминала, так и на экране оплаты.
