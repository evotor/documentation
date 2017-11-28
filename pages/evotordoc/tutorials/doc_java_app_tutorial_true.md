---
title: Сборка и установка демонстрационного приложения
keywords:
summary:
sidebar: evotordoc_sidebar
permalink: doc_java_app_tutorial.html
tags: [java, terminal]
folder: tutorials
published: true
---

Демонстрационное приложение предоставляет доступ к интерфейсам, которые поддерживает смарт-терминал. Среди функций приложения:

* открытие чека продажи и возврата;
* добавление скидки к чеку продажи;
* взаимодействие с базой товаров на смарт-терминале;
* Замена кнопки "Продажа";
* Взаимодействие со сканером штрихкодов и принтером чеков.

В разделе представлена информация, необходимая для установки на смарт-терминал [демонстрационного приложения](https://github.com/evotor/evotor-api-example).

## Требования

{% include note.html content="Приведённая ниже инструкция актуальна для платформы Windows 10." %}

Перед тем как приступить к сборке и установке демонстрационного приложения убедитесь, что у вас установлено следующее ПО:

* [Android Studio 3.0 или выше](https://developer.android.com/studio/index.html).
* Android SDK platform 25.
* Build tools 26.0.2.
* [Oracle JDK](http://www.oracle.com/technetwork/java/javase/downloads/index.html).
* [Git 2.15.0 или выше](https://git-scm.com/).
* Заданы следующие переменные среды:

  ```
  Path = <ПУТЬ_К_КАТАЛОГУ_platform-tools>, например C:\Android\android-sdk\platform-tools
  JAVA_HOME = <ПУТЬ_К_КАТАЛОГУ_JDK>, например C:\Program Files (x86)\Java\jdk1.8.0_112
  ```

## Сборка приложения

1. В Android Studio выполните VCS → Checkout from Version Control → GitHub.

   Укажите данные своей учётной записи на GitHub.

2. В поле **Git Repository URL** укажите адрес репозитория https://github.com/evotor/evotor-api-example.
3. В поле **Parent Directory** укажите локальный адрес, куда будет клонирован репозиторий.
4. Нажмите **Clone**.

   Выберите **Use local gradle distribution** и укажите путь к локальному дистрибутиву Gradle, который поставляется с Android Studio.

   {% include note.html content="Соглашайтесь, если Android Studio предлагает установить недостающие компоненты" %}

Структура скопированного проекта, выглядит следующим образом:

{% include image.html file="app_structure.png" url="images/app_structure.png" caption="Структура проекта" %}

Вам потребуется изменить `packageName` и `app_uuid` полученного проекта.

### Замена packageName

*Чтобы заменить packageName:*

1. В Android Studio откройте манифест приложения `AndroidManifest.xml`.
2. Установите курсор на ту часть packageName, которую требуется изменить, например `evotortest6`.

   ```xml
   <manifest xmlns:android="http://schemas.android.com/apk/res/android"
     package="ru.qualitylab.evotor.evotortest6">
   ```
3. В контекстном меню выберите **Refactor > Rename** и укажите новое имя пакета.
4. В файле **build.gradle (Module: app)** замените имя пакета в параметре **applicationId**.

   ```
   android {
       compileSdkVersion 25
       buildToolsVersion '26.0.2'
       defaultConfig {
           applicationId 'ru.qualitylab.evotor.evotortest6'
           ...
   ```

5. Выполните команду **Tools - Android - Sync Project with Gradle Files**.

### Замена идентификатора приложения {#appUuidReplacement}

*Чтобы заменить идентификатор приложения:*

1. В Android Studio откройте манифест приложения `AndroidManifest.xml`.
2. В поле `app_uuid` элемента `<meta-data>` вместо текущего идентификатора укажите идентификатор приложения, который вы получили в [процессе подготовки приложения на сайте разработчиков](./doc_java_app_tutorial.html#devSiteSettingUp)

   ```xml
   <meta-data
            android:name="app_uuid"
            android:value="66998575-ee62-4e87-b191-89f351fdc572" />
   ```

3. Последовательно выполните команды:

   1. **Build - Clean Project**.
   2. **Build - Build APK(s)**.

Вы получите файл `app-debug.apk` приложения, который можно загрузить в облако и установить на терминал для тестирования.

## Подготовка приложения на сайте разработчиков  {#devSiteSettingUp}

Чтобы установить приложение на терминал, вам потребуется идентификатор приложения (`app_uuid`), который вы можете получить на [сайте разработчиков](https://dev.evotor.ru).

*Чтобы получить идентификатор приложения:*

1. Зарегистрируйтесь на [сайте разработчиков](https://developer.evotor.ru/).
2. Нажмите **Добавить новое**.

   Укажите название своего приложения. Например, “Тестирование API Эвотор”. Установите флажок **Приложение с APK**.

3. Нажмите кнопку **Продолжить**.

   Откроется страница со вкладками **Обзор**, **Видео и скриншоты** и **Интеграция**. Для разработки приложения вам в первую очередь потребуется вкладка **Интеграция**.

   Вкладки **Обзор** и **Видео и скриншоты** необходимы для оформления страницы приложения в Магазине приложений и потребуются вам, когда вы будете готовы распространять своё приложение.

4. Перейдите на вкладку **APK**. Скопируйте параметр **app_uuid** и [укажите его в файле `AndroidManifest.xml`](./doc_java_app_tutorial.html#appUuidReplacement)

   {% include image.html file="app_uuid.png" url="images/app_uuid.png.png" caption="Идентификатор приложения" %}

## Установка приложения

Вы можете установить приложение вручную, с помощью [командной строки или adb shell](./doc_app_installation.html#adb-shell) или из [Магазина приложений](./doc_app_installation.html#MarkeplaceAppInstallation).
