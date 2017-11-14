---
title: Подготовка среды для разработки на React Native
keywords:
summary:
sidebar: evotordoc_sidebar
permalink: doc_react_getting_started.html
tags: [terminal, react]
folder: react_SDK
published: false
---

React Native - технология, которая позволяет использовать JavaScript для создания мобильных приложений. С помощью React Native вы можете обращаться к API написанному на Java используя только JavaScript.

*Чтобы начать разработку приложения на React Native:*

1. Установите актуальную версию [Node.js](https://nodejs.org/)
2. Установите React Native с помощью команды:

    ```
    npm install -g create-react-native-app
    ```

3. Создайте проект с помощью команды:

    ```
    create-react-native-app <Project>
    ```

    Для создания проекта вам может потребоваться установить npm версии 4. Используйте для этого команду:

    ```
    npm install -g npm@4
    ```

4. Перейдите в папку проекта:

    ```
    cd <Project>
    ```

7. Чтобы получить позможность использовать Java API, выполните команду:

    ```
    npm run eject
    ```

6. Установите нашу библиотеку:

    ```
    npm i evotor-integration-library --s
    ```

Вы подготовили среду и создали проект на React Native:

Следующий раздел содержит информацию о том какие зависимости надо указать для корректной работы вашего прилолжения.
