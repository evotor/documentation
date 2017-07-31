---
title: Манифест JS-приложения
keywords: sample
summary:
sidebar: evotordoc_sidebar
permalink: doc_js_app_manifest.html
tags: [JavaScript, Терминал]
folder: smart_terminal_SDK
---

В папке `app/manifests` вашего приложения должен находиться файл манифеста приложения – [AndroidManifest.xml](https://developer.android.com/guide/topics/manifest/manifest-intro.html?hl=ru).

Манифест JS-приложения генерируется автоматически на основе файла client.yaml, размещённого по адресу `app\assets`.


### Пример файла client.yaml

Ниже приведён пример заполненного файла `client.yaml` для приложения, которое имеет интерфейс, использует плагины и демоны.

```yaml
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
  - name: daemon1
    events:
    behavior: daemon1.js
  - name: daemon2
    events:
    behavior: daemon2.js
plugins:
  - name: plugin1
    moments:
    behavior: plugin1.js
  - name: plugin2
    moments:
    behavior: plugin2.js
views:
  - name: hello_sales_view
    header: "Hello header"
    label: "Hello"
    color: "#FF1493"
    icon_96: icons/icon-96.png
    icon_192: icons/icon-192.png
    icon_256: icons/icon-256.png
    source: views/view.html
    point: SALES_SCREEN
    grants:
            - CASH_OPERATIONS_SELL
    scripts:
      - script1.js
      - script2.js
    styles:
      - "*.css"
  - name: world_sales_view # Запрещено использовать верхний регистр и ,-*&^%$# и т.д
    header: "World header"
    label: "world"
    color: "#FF1493"
    icon_96: icons/icon-96.png
    icon_192: icons/icon-192.png
    icon_256: icons/icon-256.png
    source: views/view1.html
    point: SALES_SCREEN # Variants are MAIN_SCREEN and SALES_SCREEN
    grants:
            - CASH_OPERATIONS_SELL
    scripts:
      - no-script
    styles:
      - "*.css"
```

Где:

* `version` – код версии приложения. При обновлении приложения возрастает на единицу. Увеличение версии сообщает смарт-терминалам о необходимости обновить приложение.
* `versionName` – версия приложения, которая отображается в магазине приложений или в интерфейсе, может содержать любое значение. Версию требуется указывать в кавычках.
* `packageName` – имя пакета согласно [правилам об именовании](https://docs.oracle.com/javase/tutorial/java/package/namingpkgs.html). Пример: `org.example.myApp`.
* `appName` – имя приложения, которое отображается в интерфейсе. Имя приложения требуется указывать в кавычках, поле поддерживает только латинские буквы и цифры.
* `appUUID` – идентификатор приложения в формате uuid4. Отображается  в адресной строке приложения на [dev.evotor.ru](https://dev.evotor.ru), в личном кабинете разработчика.

#### Список capabilities
Список доступных приложению функций:

* `internet` – указывайте, если хотите дать приложению возможность [выходить в интернет](./doc_cloud_proxy.html), например, чтобы обратиться к стороннему сервису.
* `barcode-scanner` – указывайте, если хотите дать приложению возможность получать штрихкоды от [сканера штрихкодов](./doc_barcode_scanner.html).
* `storage` – указывайте, если хотите дать приложению возможность [хранить данные на смарт-терминале](./doc_storage_api.html), между запусками приложения.

#### Список daemons

Список демонов (js-скриптов), которые использует приложение. Демонам доступна функциональность логирования (`logger`) и хранения данных (`storage`) Храните демоны в папке `app\assets\daemons`.

С помощью демонов приложение можно подписать на широковещательные сообщения, которые рассылает смарт-терминал. Широковещательные сообщения рассылаются после применения изменений, смарт-терминал не ждёт ответа от приложений.
Параметры элемента списка:

* `name` – в параметре требуется указать имя демона. Имя может содержать только латинские буквы, цифры и символ "\_"
* `events` – параметр, который содержит список событий, запускающих демон. Каждое событие вызывает соответствующий метод, в аргументе которого передаются данные о событии:

<style type="text/css">
.tg  {border-collapse:collapse;border-spacing:0;}
.tg td{font-family:Arial, sans-serif;font-size:14px;padding:10px 5px;border-style:solid;border-width:1px;overflow:hidden;word-break:normal;}
.tg th{font-family:Arial, sans-serif;font-size:14px;font-weight:normal;padding:10px 5px;border-style:solid;border-width:1px;overflow:hidden;word-break:normal;}
.tg .tg-e3zv{font-weight:bold}
.tg .tg-yw4l{vertical-align:top}
@media screen and (max-width: 767px) {.tg {width: auto !important;}.tg col {width: auto !important;}.tg-wrap {overflow-x: auto;-webkit-overflow-scrolling: touch;}}</style>
<div class="tg-wrap"><table class="tg">
  <tr>
    <th class="tg-e3zv">Событие</th>
    <th class="tg-e3zv">Метод</th>
  </tr>
  <tr>
    <td class="tg-031e"><code>evotor.intent.action.receipt.sell.OPENED</code></td>
    <td class="tg-031e"><code>onSellReceiptOpened(actionData)</code></td>
  </tr>
  <tr>
    <td class="tg-031e"><code>evotor.intent.action.receipt.payback.OPENED</code></td>
    <td class="tg-031e"><code>onPaybackReceiptOpened(actionData)</code></td>
  </tr>
  <tr>
    <td class="tg-031e"><code>evotor.intent.action.receipt.sell.CLEARED</code></td>
    <td class="tg-031e"><code>onSellReceiptCleared(actionData)</code></td>
  </tr>
  <tr>
    <td class="tg-031e"><code>evotor.intent.action.receipt.payback.CLEARED</code></td>
    <td class="tg-031e"><code>onPaybackReceiptCleared(actionData)</code></td>
  </tr>
  <tr>
    <td class="tg-yw4l"><code>evotor.intent.action.receipt.sell.RECEIPT_CLOSED</code></td>
    <td class="tg-yw4l"><code>onSellReceiptClosed(actionData)</code></td>
  </tr>
  <tr>
    <td class="tg-031e"><code>evotor.intent.action.receipt.payback.RECEIPT_CLOSED</code></td>
    <td class="tg-031e"><code>onPaybackReceiptClosed(actionData)</code></td>
  </tr>
  <tr>
    <td class="tg-031e"><code>evotor.intent.action.cashDrawer.OPEN</code></td>
    <td class="tg-031e"><code>onCashDrawerOpened(actionData)</code></td>
  </tr>
  <tr>
    <td class="tg-yw4l"><code>evotor.intent.action.cashOperation.IN</code></td>
    <td class="tg-yw4l"><code>onCashIn(actionData)</code></td>
  </tr>
  <tr>
    <td class="tg-yw4l"><code>evotor.intent.action.cashOperation.CASH_OUT</code></td>
    <td class="tg-yw4l"><code>onCashOut(actionData)</code></td>
  </tr>
  <tr>
    <td class="tg-yw4l"><code>evotor.intent.action.inventory.CARD_OPEN</code></td>
    <td class="tg-yw4l"><code>onInventoryCardOpened(actionData)</code></td>
  </tr>
  <tr>
    <td class="tg-yw4l"><code>evotor.intent.action.receipt.sell.POSITION_ADDED</code></td>
    <td class="tg-yw4l"><code>onSellReceiptPositionAdded(actionData)</code></td>
  </tr>
  <tr>
    <td class="tg-yw4l"><code>evotor.intent.action.receipt.payback.POSITION_ADDED</code></td>
    <td class="tg-yw4l"><code>onPaybackReceiptPositionAdded(actionData)</code></td>
  </tr>
  <tr>
    <td class="tg-yw4l"><code>evotor.intent.action.receipt.sell.POSITION_EDITED</code></td>
    <td class="tg-yw4l"><code>onSellReceiptPositionEdited(actionData)</code></td>
  </tr>
  <tr>
    <td class="tg-yw4l"><code>evotor.intent.action.receipt.payback.POSITION_EDITED</code></td>
    <td class="tg-yw4l"><code>onPaybackReceiptPositionEdited(actionData)</code></td>
  </tr>
  <tr>
    <td class="tg-yw4l"><code>evotor.intent.action.receipt.sell.POSITION_REMOVED</code></td>
    <td class="tg-yw4l"><code>onSellReceiptPositionRemoved(actionData)</code></td>
  </tr>
  <tr>
    <td class="tg-yw4l"><code>evotor.intent.action.receipt.payback.POSITION_REMOVED</code></td>
    <td class="tg-yw4l"><code>onPaybackReceiptPositionRemoved(actionData)</code></td>
  </tr>
</table></div>

* `behavior` – в параметре требуется указать название запускаемого демона в формате `<Название скрипта>.js`.

#### Список plugins

Список плагинов (js-скриптов), которые использует приложение. Храните плагины в папке `app\assets\plugins`.

С помощью плагинов приложение можно подписать на события, которые рассылает смарт-терминал. Смарт-терминал создаёт события перед применением изменений, смарт-терминал ждёт ответ от приложений, например, [добавление позиции в чек](./doc_receipt_interactions.html)
Параметры элемента списка:

* `name` – в параметре требуется указать имя плагина. Имя может содержать только латинские буквы, цифры и символ "\_"
* `moments` – параметр, который содержит список событий, запускающих плагин. При получении события, плагин должен вызвать соответствующий метод:


* `behavior` – в параметре требуется указать название запускаемого плагин в формате `<Название скрипта>.js`.

#### Список views

Список файлов экранов интерфейса приложения в формате HTML. Храните файлы экранов в папке `app\assets\views`

Параметры элемента списка:

* `name` – имя экрана. Имя может содержать только латинские буквы, цифры и символ "\_".
* `header` – Текст заголовка. Указывайте в кавычках. Поддерживает только латинские буквы.
* `label` – Текст сообщения на странице. Указывайте в кавычках.
* `color` – цвет фона иконки. Указывайте в кавычках в шестнадцатиричном формате, например: `"#FF1493"`.
* `icon_96` – путь к файлу иконки в разрешении 96 пикселей: `icons/icon-96.png`.
* `icon_192` – путь к файлу иконки в разрешении 192 пикселя: `icons/icon-192.png`
* `icon_256` – путь к файлу иконки в разрешении 256 пикселей: `icons/icon-256.png`
* `source` – путь к файлу экрана: `views/view.html`
* `point` – экран, на котором отображается иконка приложения. Возможные варианты: `MAIN_SCREEN` (главный экран) и `SALES_SCREEN` (экран оплаты).
* `grants` – Список прав приложения.
* `scripts` – список js-скриптов, которые вызывает страница. Храните скрипты в одной папке с экранами `app/assets/views` Если скрипты не используются укажите `no-script`.
* `styles` – список используемых css-стилей, указывается в виде "\*.css"

<!-- {% include note.html content="Скрипты плагинов и демонов запускаются во внутренней среде выполнения JavaScript, которая не содержит возможностей использования веб-технологий, например, разбор DOM, поддержку HTTP, чтение файлов или расширения HTML5." %} -->
