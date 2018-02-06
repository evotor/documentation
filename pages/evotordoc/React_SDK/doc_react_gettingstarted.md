---
title: Начало работы
keywords:
summary:
sidebar: evotordoc_sidebar
permalink: doc_react_gettingstarted.html
tags: [terminal, react]
folder: react_SDK
published: false
---

## Введение

React Native – технология, которая позволяет использовать JavaScript для создания мобильных приложений. С помощью React Native вы можете обращаться к API написанному на Java используя только JavaScript.

У вас есть два способа разрабатывать приложение на React Native SDK для платформы Эвотор:

* Разработка с помощью демонстрационного приложения REvotor.
* Создание проекта React Native с нуля.

   Создание проекта React Native описано [здесь](https://facebook.github.io/react-native/docs/getting-started.html). Чтобы разрабатывать для платформы Эвотор, вам потребуется [подключить к своему проекту библиотеку evotor-integration-library](./doc_react_gettingstarted.html#evotorintegrationlibrary).


## Разработка с помощью демонстрационного приложения REvotor

Чтобы начать разработку с помощью демонстрационного приложения, [скачайте архив с приложением](./здесь должна быть ссылка на архив, который не влезает на гитхаб).

Структура проекта в архиве:

{% include image.html file="react_app_structure.png" url="images/react_app_structure.png" caption="Структура проекта" %}

Разработка ведётся в папке JS.

### Создание ключа для подписки apk-файла

Чтобы установить демонстрационное приложение на смарт-терминал вам необходимо создать подписанный apk-файл приложения. Для этого вам потребуется ключ, с помощью которого будет подписан apk-файл.

Чтобы создать ключ:

1. Перейдите в папку с установленным JDK.

   ```
   cd C:\Program Files\Java\jdkX.X.X_X\bin
   ```

2. Создайте ключ с помощью команды:

   ```
   keytool -genkey -v -keystore my-release-key.keystore -alias my-key-alias -keyalg RSA -keysize 2048 -validity 10000
   ```

   {% include note.html content="В процессе создания ключа ответьте на вопросы, которые будут появляться в командной строке." %}

3. Скопируйте ключ в папку `REvotor\android\app`.

### Создание apk-файла

Чтобы создать apk-файл приложения:

1. Откройте файл `REvotor\android\local.properties` и укажите актуальные пути к файлам SDK и NDK:

   ```
   ndk.dir=C\:\\Users\\<username>\\AppData\\Local\\Android\\sdk\\ndk-bundle
   sdk.dir=C\:\\Users\\<username>\\AppData\\Local\\Android\\sdk
   ```

2. В Android Studio откройте манифест приложения, размещённый по адресу `REvotor\android\app\src\AndroidManifest.xml`.
3. В поле `app_uuid` элемента `<meta-data>` вместо текущего идентификатора укажите идентификатор приложения, который вы получили в [процессе подготовки приложения на сайте разработчиков](./doc_java_app_tutorial.html#devSiteSettingUp)

   ```xml
   <meta-data
            android:name="app_uuid"
            android:value="66998575-ee62-4e87-b191-89f351fdc572" />
   ```

4. Измените `packageName` приложения, для чего установите курсор на ту часть `packageName`, которую требуется изменить, например `revotor`.

   ```xml
   <manifest xmlns:android="http://schemas.android.com/apk/res/android"
     package="com.revotor">
   ```

5. В контекстном меню выберите **Refactor > Rename** и укажите новое имя пакета.
6. В файле `REvotor\android\app\build.gradle` замените имя пакета в параметре `applicationId`.

   ```
   android {
    compileSdkVersion 27
    buildToolsVersion '27.0.3'

    defaultConfig {
        applicationId "com.revotor"
           ...
   ```

7. В командной строке перейдите в папку `REvotor\android` и выполните команду:

   ```
   gradlew AssembleRelease
   ```

  Готовый apk-файл приложения будет размещён по адресу `REvotor\android\app\build\outputs\apk\release`.



### Установка приложения

Вы можете установить приложение вручную, с помощью [командной строки или adb shell](./doc_app_installation.html#adb-shell) или из [Магазина приложений](./doc_app_installation.html#MarkeplaceAppInstallation).


## Подключение библиотеки evotor-integration-library к новому проекту React Native. {#evotorintegrationlibrary}

*Установите библиотеку с помощью команды:*

```
npm install evotor-integration-library --save
```

*Чтобы связать своё React Native приложение с библиотекой выполните следующую команду:*

```
react-native link evotor-integration-library
```

убедитесь, что в файле build.gradle module app подключён doc_smart_terminal_inventory_api


## Программные требования

Убедитесь, что у вас установлены:
