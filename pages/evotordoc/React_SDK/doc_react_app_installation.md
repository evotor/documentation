---
title: Установка приложения на смарт-терминал
keywords:
summary:
sidebar: evotordoc_sidebar
permalink: doc_react_app_installation.html
tags: [terminal, react]
folder: react_SDK
published: true
---

*Чтобы установить приложение на смарт-терминал:*

1. Включите на смарт-терминале [режим разработчика](./doc_app_developer_mode.html).

   При включении режима разработчика выберите опцию **Ввести ID пакета вручную** и укажите packageName приложения, которое вы собираетесь устанавливать на смарт-терминал, например, `com.ProjectName`.

2. Подключитесь к смарт-терминалу с помощью команды

   ```
   adb connect <IP-адрес смарт-терминала>:2111
   ```

3. Запустите командную строку от имени Администратора.
4. Перейдите в папку C:\Program Files\Java\jdk1.8.0_121\bin>
5. Выполните команды:

   ```
   keytool -genkey -v -keystore my-release-key.keystore -alias my-key-alias -keyalg RSA -keysize 2048 -validity 10000
   ```

6. В папке <ProjectName>\аndroid выполните команды:

   ```
   gradlew assembleRelease
   ```

   ```
   adb install -r <ProjectName>\android\app\build\outputs\apk\release\app-release.apk
   ```

Ваше приложение будет установлено на смарт-терминал. Проверить это вы можете тут ещё>память>приложения (или как-то так).
