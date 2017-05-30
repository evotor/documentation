---
title: Манифест приложения
keywords: sample
summary:
sidebar: evotordoc_sidebar
permalink: doc_app_manifest.html
folder: smart_terminal_SDK
---

### Манифест Java-приложения

Ниже приведён манифет приложения, которое вы можете собрать воспользовавшись [шаблоном]().

``` xml
<?xml version="1.0" encoding="UTF-8"?><manifest package="com.example.name.name">
  <application xmlns:tools="http://schemas.android.com/tools" xmlns:android="http://schemas.android.com/apk/res/android" android:icon="@mipmap/ic_launcher" android:allowBackup="true" android:theme="@style/AppTheme" android:label="@string/generated_app_name" tools:replace="android:label">
    <meta-data android:value="ApllicationUUID" android:name="app_uuid"/>
    <activity android:icon="@mipmap/hello_sales_view_icon" android:label="Hello" android:name=".HELLO_SALES_VIEW">
      <intent-filter android:priority="90">
        <action android:name="android.intent.action.MAIN"/>
        <category android:name="android.intent.category.SALES_SCREEN"/>
      </intent-filter>
      <meta-data android:value="@color/hello_sales_view_launcher_color" android:name="ru.evotor.sales_screen.BACKGROUND_COLOR"/>
      <meta-data android:resource="@array/hello_sales_view_grants" android:name="ru.evotor.launcher.GRANTS"/>
    </activity>
    <activity android:icon="@mipmap/world_sales_view_icon" android:label="World" android:name=".WORLD_SALES_VIEW">
      <intent-filter android:priority="90">
        <action android:name="android.intent.action.MAIN"/>
        <category android:name="android.intent.category.SALES_SCREEN"/>
      </intent-filter>
      <meta-data android:value="@color/world_sales_view_launcher_color" android:name="ru.evotor.sales_screen.BACKGROUND_COLOR"/>
      <meta-data android:resource="@array/world_sales_view_grants" android:name="ru.evotor.launcher.GRANTS"/>
    </activity>
    <service android:enabled="true" android:name=".UIPluginServiceImplementation" android:exported="true">
      <intent-filter>
        <action android:name="android.intent.action.MAIN"/>
        <category android:name="android.intent.category.DEFAULT"/>
        <category android:name="android.intent.category.EVOTOR"/>
      </intent-filter>
    </service>
    <service android:enabled="true" android:name=".DaemonServiceImplementation" android:exported="true">
      <intent-filter>
        <action android:name="android.intent.action.MAIN"/>
        <category android:name="android.intent.category.DEFAULT"/>
        <category android:name="android.intent.category.EVOTOR"/>
      </intent-filter>
    </service>
  </application>
</manifest>
```

### Манифест JS-приложения



``` yaml
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


Где:
version: 2 — Код версии приложения (инкремент этого параметра значит, что приложение изменилось и его необходимо обновить на терминалах)
versionName: "1.0.1" — Версия приложения (версия служит просто для отображения пользователю, можно писать что угодно)

packageName: org.example.myApp — Имя пакета (используйте правила соглашения об именовании – https://docs.oracle.com/javase/tutorial/java/package/namingpkgs.html)
appName: "testApp" — Отображаемое пользователю имя приложения
appUUID: "2e6dc4b8-fdac-48c1-8a1a-ade402863947" — UUID приложения (его можно посмотреть в адресной строке приложения на dev.evotor.ru в личном кабинете разработчика)

iconColor: "#0f70b7" — Цвет иконки приложения интеграции на терминале Evotor, если она размещена на рабочем столе (см. описание views, чтобы поместить иконку приложения на главный экран терминала)

views: — список html загружаются внутрь WebView, которые затем можно отобразить пользователю в UI
- name: karamba — Любое название view, по которому к нему можно обратиться
- header: "Подождите" — Заголовок окна
- label:
- color:
- icon_96:
- icon_192:
- icon_256:
source: client/views/discount-loader/view.html — Полный путь к html файлу
- point:
- grants:
- scripts:
styles: — список стилей которые должны быть подключены
- "*.css" — может подключить все файлы
