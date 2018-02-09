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

<!-- Представленная информация актуальна для ОС Wndows, Mac OS, Linux. -->

Убедитесь, что у вас установлено следующее ПО:

* [Node.js](https://nodejs.org/en/download/);
* [Java SE Development Kit](http://www.oracle.com/technetwork/java/javase/downloads/jdk8-downloads-2133151.html);
* [Android Studio](https://developer.android.com/studio/install.html).

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

3. Перейдите в папку проекта:

   ```
   cd YourAppName
   ```

4. Чтобы ваше React Native приложение могло обращаться к Java API выполните следующую команду, :

   ```
   npm run eject
   ```

   Ответьте на вопросы, которые появятся в командной строке. В результате выполнения команды, в папке проекта появится папка `android`.

{% include note.html content="Более подробную информацию смотрите в документации [React Native](https://facebook.github.io/react-native/docs/getting-started.html)." %}

### Установка библиотеки evotor-integration-library

Мы подготовили библиотеку evotor-integration-library, чтобы ваше React Native приложение могло взаимодействовать с Java API смарт-терминала.

Вам потребуется установить и связать библиотеку со своим приложением. Для этого, находясь в папке приложения, выполните следующие действия:

1. Установите библиотеку:

   ```
   npm install evotor-integration-library --save
   ```

2. Свяжите библиотеку со своим приложением:

   ```
   react-native link evotor-integration-library
   ```

#### Решение возможных проблем

При привязывании библиотеки может возникнуть ошибка:

   ```
   Command `link` unrecognized. Make sure that you have run `npm install` and that you are inside a react-native project.
   ```

В этом случае:

1. Удалите из проекта папку `node_modules`.
2. [Скачайте и установите менеджер пакетов Yarn](https://yarnpkg.com/lang/en/docs/install/).
2. Выполните команду:

   ```
   yarn
   ```

3. Повторно выполните команду:

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

3. Подключитесь к смарт-терминалу в [режиме разработчика](./doc_app_developer_mode.html).

4. Последовательно выполните команды:

   ```
   cd YourAppName
   react-native run-Android
   ```

   <!-- Попробуйте удалить приложение с терминала **Настройки** > **Память устройства** > **YourAppName** > **Удалить** -->
