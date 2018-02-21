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

3. Перейдите в корневую папку проекта:

   ```
   cd YourAppName
   ```

4. Выполните следующую команду, чтобы получить возможность подключать к своему приложению нативный код:

   ```
   npm run eject
   ```

   Ответьте на вопросы, которые появятся в командной строке. В результате выполнения команды, в папке проекта появится папка `android`.

{% include note.html content="Более подробную информацию смотрите в документации [React Native](https://facebook.github.io/react-native/docs/getting-started.html)." %}

### Установка библиотеки evotor-integration-library

*Чтобы установить библиотеку evotor-integration-library:*

1. В файле `YourAppName\android\app\build.gradle` измените следующие параметры:

   ```
   compileSdkVersion 25
   buildToolsVersion "25.0.3"
   ```

   ```
   minSdkVersion 22
   ```

   ```
   compile "com.android.support:appcompat-v7:25.3.1"
   ```
2. Установите библиотеку, выполнив следующую команду в корневой папке проекта:

   ```
   npm install evotor-integration-library --save
   ```

3. Свяжите библиотеку с вашим приложением:

   * В корневой папке проекта выполните команду:

   ```
   react-native link evotor-integration-library
   ```

   * В файле `YourAppName\android\build.gradle`, в разделе `allprojects` добавьте репозиторий `maven { url 'https://jitpack.io' }`:

   ```
   allprojects {
       repositories {
           mavenLocal()
           jcenter()
           maven {
               // All of React Native (JS, Obj-C sources, Android binaries) is installed from npm
               url "$rootDir/../node_modules/react-native/android"
           }
           maven { url 'https://jitpack.io' }
       }
   }
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

1. В Android Studio откройте манифест приложения, размещённый по адресу `YourAppName\android\app\src\main\AndroidManifest.xml`.

2. В разделе `<uses-sdk>` измените параметр:

   ```xml
   android:minSdkVersion="22"
   ```

3. После раздела `<application>` добавьте следующий раздел:

   ```xml
   <meta-data
       android:name="app_uuid"
       android:value="<Идентификатор приложения>" />
   ```
   Где требуется указать идентификатор приложения, который вы получили в [процессе подготовки приложения на сайте разработчиков](./doc_java_app_tutorial.html#devSiteSettingUp)

4. Подключитесь к смарт-терминалу в [режиме разработчика](./doc_app_developer_mode.html).

5. Выполните следующую команду в корневой папке проекта:

   ```
   react-native run-android
   ```

6. Запустите установленное приложение.

   На экране терминала откроется окно с ошибкой:

   {% include image.html file="react-error.png" url="images/react-error.png" %}

7. Чтобы исправить ошибку, выполните команду, которая открывает **Меню разработчика** (**Developer Menu**):

   ```
   adb shell input keyevent 82
   ```

8. В **Меню разработчика** выберите пункты **Dev Settings** → **Debug server host & port for device**.
9. В открывшемся окне укажите:

   ```
   <IP-адрес вашего компьютера>:8081
   ```

10. Повторно откройте **Меню разработчика** и выберите пункт **Reload**.
