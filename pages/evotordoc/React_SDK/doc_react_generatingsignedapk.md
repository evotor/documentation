---
title: Создание и установка подписанного APK
keywords:
summary:
sidebar: evotordoc_sidebar
permalink: doc_react_generatingsignedapk.html
tags: [terminal, react]
folder: react_SDK
published: true
---

## Создание ключа для подписи apk-файла приложения

Чтобы пользователи могли установить ваше приложение на смарт-терминал вам необходимо создать подписанный apk-файл приложения. Для этого вам потребуется ключ, с помощью которого будет подписан apk-файл.

*Чтобы создать ключ:*

1. Перейдите в папку с установленным JDK.

   ```
   cd C:\Program Files\Java\jdkX.X.X_X\bin
   ```

2. Создайте ключ с помощью команды:

   ```
   keytool -genkey -v -keystore my-release-key.keystore -alias my-key-alias -keyalg RSA -keysize 2048 -validity 10000
   ```

   В процессе создания ключа ответьте на вопросы, которые будут появляться в командной строке.

3. Скопируйте ключ в папку `YourAppName\android\app`.

## Создание apk-файла

*Чтобы создать apk-файл приложения:*

1. В Android Studio откройте манифест приложения, размещённый по адресу `YourAppName\android\app\src\AndroidManifest.xml`.
2. В поле `app_uuid` элемента `<meta-data>` вместо текущего идентификатора укажите идентификатор приложения, который вы получили в [процессе подготовки приложения на сайте разработчиков](./doc_java_app_tutorial.html#devSiteSettingUp)

   ```xml
   <meta-data
            android:name="app_uuid"
            android:value="66998575-ee62-4e87-b191-89f351fdc572" />
   ```

3. В командной строке перейдите в папку `YourAppName\android` и выполните команду:

   ```
   gradlew AssembleRelease
   ```

  Готовый apk-файл приложения будет размещён по адресу `YourAppName\android\app\build\outputs\apk\release`.



## Установка приложения

Вы можете установить приложение вручную, с помощью [командной строки или adb shell](./doc_app_installation.html#adb-shell) или из [Магазина приложений](./doc_app_installation.html#MarkeplaceAppInstallation).
