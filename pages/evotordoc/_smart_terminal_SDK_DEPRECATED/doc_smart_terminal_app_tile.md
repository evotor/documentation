---
title: Иконка JS-приложения в интерфейсе смарт-терминала
keywords: sample
summary: "Раздел содержит требования к плитке приложения, а также информацию о том как добавить плитку в интерфейс смарт-терминала."
sidebar: evotordoc_sidebar
permalink: doc_smart_terminal_app_tile.html
tags: [Терминал, Java, JavaScript]
folder: smart_terminal_SDK
---

Вы можете запустить своё приложение по плитке, расположенной на одном из экранов смарт-терминала:

* на главном экране;
* на экране продажи;
* на экране возврата.

Вы можете запускать приложение с помощью плитки на главном экране смарт-терминала или с помощью иконок на экране продажи и/или возврата товара

Вы можете интегрировать своё приложение в существующий процесс смарт-терминала, например, продажу или работу с оборудованием, или добавить плитку приложения на главный экран. Плиток может быть несколько, если приложение реализует независимые действия, например, плитки "Продать товар" и "Вернуть товар".

![Пример плитки](images\Tile_example.png)

### Рекомендации по добавлению плитки

Добавляйте плитку если:

* у приложения есть свой интерфейс;
* приложение реализует полезное действие и / или предоставляет сотруднику магазина доступ к аналитической информации.

Вы можете изменять следующие параметры плитки:

* **Цвет**. Может быть любым, пока на его фоне отчётливо отображаются символы и иконка.

  {% include tip.html content="Как правило цвет плитки делают таким же как и цвет основных кнопок в интерфейсе приложения." %}

* **Название**. Может быть названием приложения или полезного действия, например, "Продажи за неделю". Плитка отображает до 20 символов. Остальные символы скрываются многоточием.

* **Иконка**. Иконка должна быть квадратной – 64 dp. Требуется обеспечить набор иконок в трёх разрешениях: 96, 192, 256px.

<!-- ### Java-приложение

Чтобы добавить плитку java-приложения на главный экран смарт-терминала, в манифесте приложения, измените соответствующий элемент `<Activity>` следующим образом:

```xml
<activity
    android:name=".someActivity"
    android:icon="@drawable/icon"
    android:label="Example tile"
    >
    <meta-data
        android:name="ru.evotor.launcher.BACKGROUND_COLOR"
        android:value="#133788" />
    <intent-filter>
        <action android:name="android.intent.action.MAIN" />
        <category android:name="android.intent.category.EVOTOR" />
    </intent-filter>
</activity>
```

Где:

* Атрибут `android:name` задаёт название соответствующего элемента `Activity`.
* Атрибут `android:icon` задаёт иконку, которая отображается на плитке.
* Атрибут `android:label` название плитки.
* Необязательный тег `<meta-data>`, содержит атрибуты:
    * `android:name` – имя параметра, который задаёт цвет иконки.
    *  `android:value` – значение параметра, который задаёт цвет иконки в шестнадцатиричной кодировке.
* Интент фильтр содержит соответствующие элементы action (`android:name="android.intent.action.MAIN"`) и category (`android:name="android.intent.category.EVOTOR"`).

Вы также можете добавить иконку приложения на экран продажи, например, для [начисления скидок](./doc_discounts.html). Для этого создайте соответствующую службу:

```xml
<service
  android:name=".InventoryAPI.ExampleService"
  android:enabled="true"
  android:exported="true"
  android:icon="@mipmap/pirate"
  android:label="DiscByButton">
  <meta-data
  android:name="ru.evotor.sales_screen.BACKGROUND_COLOR"
  android:value="#cc0000" />
    <intent-filter android:priority="20">
      <category android:name="android.intent.category.DEFAULT" />
      <action android:name="evo.v2.receipt.sell.receiptDiscount" />
    </intent-filter>
</service>
``` -->


### JS-приложение

Чтобы добавить плитку JS-приложения на главный экран смарт-терминала, в файле *client.yaml*, модифицируйте список `views` следующим образом:

```yaml
 views:
  - name: Example
    header: "Заголовок окна"
    label: "Название приложения для плитки"
    color: #133788
    icon_96: client/views/example/icon-96.png
    icon_192: client/views/example/icon-192.png
    icon_256: client/views/example/icon-256.png
    source: client/views/example/view.html
    point: MAIN_SCREEN
    grants:
            - CASH_OPERATIONS_SELL
    scripts:
      - no-script
    styles:
      - "*.css"
```

Где:

* `name` – задаёт название элемента списка `views`.

  {% include important.html content="Название элемента может содержать только латинские буквы, цифры и символ \"_\"." %}

* `header` – задаёт заголовок окна, которое открывается по нажатию на плитку.
* `label` – задаёт название плитки.
* `color` – задаёт цвет плитки в шестнадцатиричной кодировке.
* `icon_96` – задаёт путь к иконке в разрешении 96 х 96 пикселей. Иконка копируется в папку drawable-hdpi, файл переименовывается в `<Значение параметра name>-icon.png`.
* `icon_192` – задаёт путь к иконке в разрешении 192 х 192 пикселя. Иконка копируется в папку xxdrawable-hdpi, файл переименовывается в `<Значение параметра name>-icon.png`.
* `icon_256` – задаёт путь к иконке в разрешении 256 х 256 пикселей. Иконка копируется в папку xxxdrawable-hdpi, файл переименовывается в `<Значение параметра name>-icon.png`.
* `source` – задаёт полный путь к html-файлу, который открывается по нажатию на плитку.
* `point` – задаёт экран смарт-терминала, с которого вызывается приложение. Возможные значения: `SALES_SCREEN` и `MAIN_SCREEN`
* `grants` – задаёт [права приложения](doc_smart_terminal_app_grants.html).
* `scripts` – задаёт список подключаемых скриптов.
* `styles` – задаёт список подключаемых стилей.
