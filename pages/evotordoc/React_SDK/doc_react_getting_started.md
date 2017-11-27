---
title: Подготовка среды для разработки на React Native
keywords:
summary:
sidebar: evotordoc_sidebar
permalink: doc_react_getting_started.html
tags: [terminal, react]
folder: react_SDK
published: true
---

React Native - технология, которая позволяет использовать JavaScript для создания мобильных приложений. С помощью React Native вы можете обращаться к API написанному на Java используя только JavaScript.

## Требования

Убедитесь, что у вас установлено следующее ПО:

* Актуальная версия [Node.js](https://nodejs.org/en/download/).
* [Android Studio версии 3.0 или выше](https://developer.android.com/studio/index.html).

## Подготовка к разработке

*Чтобы начать разработку приложения на React Native:*

1. Установите утилиту для создания React Native приложений:

    ```
    npm install -g create-react-native-app
    ```

2. Создайте проект (React Native приложение) с помощью команды:

    ```
    create-react-native-app YourAppName
    ```

    Для создания проекта вам может потребоваться установить npm версии 4. Используйте для этого команду:

    ```
    npm install -g npm@4
    ```

3. Чтобы получить возможность использовать Java API, в корневой папке проекта выполните команду:

    ```
    npm run eject
    ```

В папке проекта появится папка android, которую требуется открыть в Android Studio.

{% include note.html content="После установки приложения React Native, вам потребуется обновить Gradle Plugin и Build Tools. Android Studio автоматически предложит установить необходимые обновления." %}

## Подключение библиотеки evotor integration library

*Установите нашу библиотеку с помощью команды:*

```
npm install evotor-integration-library --save
```

*Чтобы связать своё React Native приложение с нашей библиотекой выполните следующую команду:*

```
react-native link evotor-integration-library
```

Выполнение команды приводит к следующим изменениям:

* В файле `settings.gradle`:

  ```
  include ':evotor-integration-library'
  project(':evotor-integration-library').projectDir = new File(rootProject.projectDir, '../node_modules/evotor-integration-library/android/app')
  ```

* В файле `app/build.gradle`:

  ```
  compile project(':evotor-integration-library')
  ```

  и

  ```
  compileSdkVersion 26
  buildToolsVersion '26.0.2'
  com.android.support:appcompat-v7:26.0.2
  minSdkVersion 22
     targetSdkVersion 22
  ```

* В файле `android/build.gradle` в разделе `allprojects repositories`:

  ```
  maven { url 'https://jitpack.io' }
  ```

* В файле `app/src/main/java/package.name/MainApplication`:

  ```
  protected List<ReactPackage> getPackages() {
    return Arrays.<ReactPackage>asList(
        new MainReactPackage(),
        new EvotorPackage()
    );
  }
  ```

{% include important.html content="Убедитесь, что ваш проект содержит все указанные изменения. При необходимости, внесите изменения вручную." %}
