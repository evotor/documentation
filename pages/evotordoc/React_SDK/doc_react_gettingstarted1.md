---
title: Начало работы
keywords:
summary:
sidebar: evotordoc_sidebar
permalink: doc_react_gettingstarted.html
tags: [terminal, react]
folder: react_SDK
published: true
---

## Подготовка к разработке

Перед разработкой установите следующее ПО:

* [Node.js](https://nodejs.org/en/download/)
* [Java SE Development Kit](http://www.oracle.com/technetwork/java/javase/downloads/jdk8-downloads-2133151.html)
* [Android Studio](https://developer.android.com/studio/install.html)

### Установка React Native CLI

Для создания и работы с проектами React Native установите интерфейс командной строки React Native CLI.

*Для этого, в командной строке, выполните команду:*

   ```
   npm install -g react-native-cli
   ```

### Создание проекта React Native

*Чтобы создать проект React Native:*

1. Перейдите в папку, где будет создан ваш проект:

   ```
   cd devfolder
   ```

2. Выполните команду:

   ```
   create-react-native-app YourAppName
   ```

   Команда создаст проект со следующей структурой:
   {% include image скриншот структуры проекта %}

3. Перейдите в папку проекта:

   ```
   cd YourAppName
   ```

4. Выполните следующую команду, чтобы ваше React Native приложение могло обращаться к Java API:

   ```
   npm run eject
   ```

{% include note.html content="Более подробную информацию смотрите в документации [React Native]()." %}

### Установка библиотеки evotor-integration-library

мы подготовили библиотеку evotor-integration-library, чтобы ваше React Native приложение могло взаимодействовать с Java API смарт-терминала.

Вам потребуется установить и связать библиотеку со своим приложением. Для этого, находясь в папке приложения, выполните следующие действия:

1. Установите библиотеку:

   ```
   npm install evotor-integration-library --save
   ```

2. Свяжите библиотеку со своим приложением:

   ```
   react-native link evotor-integration-library
   ```

## Установка debug-версии приложения на смарт-терминал

*Чтобы установить debug-версию приложения на смарт-терминал:*

1. В Android Studio откройте манифест приложения, размещённый по адресу `YourAppName\android\app\src\AndroidManifest.xml`.
2. В поле `app_uuid` элемента `<meta-data>` вместо текущего идентификатора укажите идентификатор приложения, который вы получили в [процессе подготовки приложения на сайте разработчиков](./doc_java_app_tutorial.html#devSiteSettingUp)

   ```xml
   <meta-data
            android:name="app_uuid"
            android:value="66998575-ee62-4e87-b191-89f351fdc572" />
   ```

3. Подключитесь к смарт-терминалу в [режим разработчика](./doc_app_developer_mode.html).

4. Последовательно выполните команды:

   ```
   cd YourAppName
   react-native run-Android
   ```

   <!-- Попробуйте удалить приложение с терминала **Настройки** > **Память устройства** > **YourAppName** > **Удалить** -->
