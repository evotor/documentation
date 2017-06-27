---
title: Создание JS-приложения с помощью шаблона
keywords: sample
summary:
sidebar: evotordoc_sidebar
permalink: doc_JS_template_integration.html
tags: [JavaScript, Терминал]
folder: evotordoc\tutorials
published: true
---

С помощью шаблона JS-приложения вы можете создать APK приложения, которое добавляет две новые иконки на экран скидок. Нажатие на иконки запускает экраны (views) приложения.

{% include important.html content="Перед началом работы убедитесь, что в настройках Android Studio отключён параметр Instant run." %}

Чтобы собрать приложение по шаблону:

1. Создайте новый проект в Android Studio.
2. В файле `build.gradle` проекта укажите:

   ```
   buildscript {
       repositories {
           jcenter()
           maven { url 'https://jitpack.io' }
       }
       dependencies {
           ...
           classpath group: 'com.github.evotor', name: 'template-plugin', version: 'v1.1.7'
       }
   }

   allprojects {
       repositories {
         ...
         maven { url 'https://jitpack.io' }
       }
     }
   ```

3. В файле `build.gradle` приложения добавьте зависимость:

   ```
   dependencies {
           compile 'com.github.evotor:template-plugin:v1.1.7'
   }
   ```

   и подключите плагин:

   ```
   apply plugin: 'ru.evotor.webbasedapplication'
   ```

4. Соберите apk.

   Необходимые данные загружаются автоматически из нашего репозитория.
