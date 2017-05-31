---
title: Манифест приложения
keywords: sample
summary:
sidebar: evotordoc_sidebar
permalink: doc_app_manifest.html
folder: smart_terminal_SDK
---

В корневой папке вашего приложения (Java или JS) должен находиться файл манифест приложения – [AndroidManifest.xml](https://developer.android.com/guide/topics/manifest/manifest-intro.html?hl=ru).

Если манифест Java-приложения вы создаёте сами, то манифест JS-приложения генерируется автоматически на основе файла client.yaml, размещённого по адресу `app\src\main\assets`.


### Пример файла `client.yaml`



~~~ yaml
version: 1
versionName: "1.0.0"

packageName: "packageName"
appName: "ApplicationName"
appUUID: "ApllicationUUID"

capabilities:
  - internet
  - barcode-scanner
  - storage
daemons:
  - name: check
    events:
    behavior: check-daemon.js
plugins:
  - name: discount
    moments:
    behavior: receipt-fixed.js
views:
  - name: hello_sales_view # Запрещено использовать верхний регистр и ,-*&^%$# и т.д
    header: "Hello header"
    label: "Hello"
    color: "#FF1493"
    icon_96: icons/icon-96.png
    icon_192: icons/icon-192.png
    icon_256: icons/icon-256.png
    source: views/view.html
    point: SALES_SCREEN # Variants are MAIN_SCREEN and SALES_SCREEN
    grants:
            - CASH_OPERATIONS_SELL
    scripts:
      - no-script
    styles:
      - "*.css"
~~~

Где:
* `version` – код версии приложения. При обновлении приложения возрастает на единицу. Увеличение версии сообщает смарт-терминалам о необходимости обновить приложение.
* `versionName` – версия приложения, которая отображается в интерфейсе, может содержать любое значение. Версию требуется указывать в кавычках.
* `packageName` – имя пакета согласно [правилам об именовании](https://docs.oracle.com/javase/tutorial/java/package/namingpkgs.html). Пример: `org.example.myApp`.
* `appName` – имя приложение, которое отображается в интерфейсе. Имя приложения требуется указывать в кавычках, поле поддерживает только латинские буквы и цифры.
* `appUUID` – идентификатор приложения в формате uuid4. Отображается  в адресной строке приложения на dev.evotor.ru в личном кабинете разработчика)

iconColor: "#0f70b7" — Цвет иконки приложения интеграции на терминале Evotor, если она размещена на рабочем столе (см. описание views, чтобы поместить иконку приложения на главный экран терминала)

views: — список html загружаются внутрь WebView, которые затем можно отобразить пользователю в UI
- name: karamba — Любое название view, по которому к нему можно обратиться
- header: "Подождите" — Заголовок окна
- label:
- color:
- icon_96:
- icon_192:
- icon_256:
source: client/views/discount-loader/view.html — Полный путь к html файлу
- point:
- grants:
- scripts:
styles: — список стилей которые должны быть подключены
- "*.css" — может подключить все файлы
