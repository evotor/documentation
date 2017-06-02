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
* `capabilities` – возможности приложения:
    * `internet` – приложение может обращаться к стороннему сервису.
    * `barcode-scanner` – приложение может получать данные со сканера штрихкодов.
    * `storage` – приложение может между запусками хранить данные на смарт-терминале.
* `daemons` – список подключённых скриптов-демонов. Скрипты хранятся в папке `app\src\main\assets\daemons`. Содержит параметры:
    * `name` – в параметре требуется указать имя скрипта.
    * `events` – параметр, который содержит список событий, запускающих скрипт.
    * `behavior` – в параметре требуется указать называние запускаемого скрипта в формате <Название скрипта>.js
* `plugins` – список подключённых скриптов-плагинов. Скрипты хранятся в папке `app\src\main\assets\plugins`. Содержит параметры:
    * `name` – в параметре требуется указать имя скрипта.
    * `moments` – параметр, который содержит список событий, запускающих скрипт.
    * `behavior` – в параметре требуется указать называние запускаемого скрипта в формате <Название скрипта>.js
* `views` – список html-страниц. Страницы загружаются в вебвью и отображаются в интерфейсе приложения. Содержит параметры
    * `name` – имя html-страницы. Название элемента может содержать только латинские буквы, цифры и символ "\_".
    * `header` – Текст заголовка. Указывайте в кавычках. Поддерживает только латинские буквы.
    * `label` – Текст сообщения на странице. Указывайте в кавычках.
    * `color` – цвет фона иконки. Указывайте в кавычках в шестнадцатиричном формате, например: "#FF1493".
    * `icon_96` – путь к файлу иконки в разрешении 96 пикселей: icons/icon-96.png.
    * `icon_192` – путь к файлу иконки в разрешении 192 пикселя: icons/icon-192.png
    * `icon_256` – путь к файлу иконки в разрешении 256 пикселей: icons/icon-256.png
    * `source` – путь к файлу html-страницы: views/view.html
    * `point` – экран, на котором отображается иконка приложения. Возможные варианты: MAIN_SCREEN (главный экран) и SALES_SCREEN (экран оплаты).
    * `grants` – Список прав приложения.
    * `scripts` – список js-скриптов, которые вызывает страница. Если скрипты не используются укажите `no-script`.
    * `styles` – список используемых css-стилей указывается в виде "*.css"
      -

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
