---
title: Созданаие и установка подписанного APK
keywords:
summary:
sidebar: evotordoc_sidebar
permalink: doc_react_generatingsignedapk.html
tags: [terminal, react]
folder: react_SDK
published: true
---

## Подготовка к разработке

### Установка React Native CLI

### Создание проекта React Native


{% include note.html content="Более подробную информацию смотрите в документации [React Native]()." %}

### Установка библиотеки evotor-integration-library

## Установка debug-версии приложения на смарт-терминал

*Чтобы установить debug-версию приложения на смарт-терминал:*

1. В Android Studio откройте манифест приложения, размещённый по адресу `YourProjectName\android\app\src\AndroidManifest.xml`.
2. В поле `app_uuid` элемента `<meta-data>` вместо текущего идентификатора укажите идентификатор приложения, который вы получили в [процессе подготовки приложения на сайте разработчиков](./doc_java_app_tutorial.html#devSiteSettingUp)

   ```xml
   <meta-data
            android:name="app_uuid"
            android:value="66998575-ee62-4e87-b191-89f351fdc572" />
   ```

3. Подключитесь к смарт-терминалу в [режим разработчика](./doc_app_developer_mode.html).

4. Последовательно выполните команды:

   ```
   cd YourProjectName
   react-native run-Android
   ```

   <!-- Попробуйте удалить приложение с терминала **Настройки** > **Память устройства** > **YourProjectName** > **Удалить** -->
