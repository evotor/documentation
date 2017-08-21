---
title: Приложение в интерфейсе смарт-терминала
keywords: Интерфейс, иконка, плитка, манифест
summary: Вы можете запускать приложение с помощью кнопок и иконок, добавленных в интерфейс смарт-терминала. Раздел содержит информацию о том как добавить свои иконки или заменить существующую кнопку интерфейса смарт-терминала.
sidebar: evotordoc_sidebar
permalink: doc_java_app_icon.html
tags: [Терминал, Java]
folder: java_SDK
---

Вы можете запустить своё приложение по плитке, расположенной на одном из экранов смарт-терминала:

* на главном экране;
* на экране продажи;
* на экране возврата.

Вы можете запускать приложение с помощью плитки на главном экране смарт-терминала или с помощью иконок на экране продажи и/или возврата товара

Вы можете интегрировать своё приложение в существующий процесс смарт-терминала, например, продажу или работу с оборудованием, или добавить плитку приложения на главный экран. Плиток может быть несколько, если приложение реализует независимые действия, например, плитки "Продать товар" и "Вернуть товар".

{: .center-image}
![Пример плитки](images\Tile_example.png)

## Рекомендации по добавлению плитки

Добавляйте плитку если:

* у приложения есть свой интерфейс;
* приложение реализует полезное действие и / или предоставляет сотруднику магазина доступ к аналитической информации.

Вы можете изменять следующие параметры плитки:

* **Цвет**. Может быть любым, пока на его фоне отчётливо отображаются символы и иконка.

  {% include tip.html content="Как правило цвет плитки делают таким же как и цвет основных кнопок в интерфейсе приложения." %}

* **Название**. Может быть названием приложения или полезного действия, например, "Продажи за неделю". Плитка отображает до 20 символов. Остальные символы скрываются многоточием.

* **Иконка**. Иконка должна быть квадратной – 64 dp. Требуется обеспечить набор иконок в трёх разрешениях: 96, 192, 256px.


## Иконка приложения на главном экране смарт-терминала

*Чтобы добавить иконку приложения на главный экран смарт-терминала:*

В [манифесте приложения](./doc_java_app_manifest.html), измените секцию требуемой операции следующим образом:

```xml
<activity
  android:name=".<НазваниеОперации>"
  android:icon="@mipmap/ic_launcher"
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
   Атрибут `android:name="ru.evotor.sales_screen.BACKGROUND_COLOR"` задаёт фон, на котором отображается иконка приложения.

   Элемент `<action android:name="android.intent.action.MAIN" />` указывает, что иконка приложения будет отображаться на главном экране смарт-терминала.

### Иконка приложения на экране оплаты {#SalesScreen}

*Чтобы добавить иконку приложения на экран оплаты смарт-терминала:*

1. В [созданном приложении](./doc_java_getting_started.html) создайте службу (`service`).

   Для этого, в Android Studio, в проекте выберите `app` и выполните следующие действия: File → New → Service → Service (IntentService).

   Добавленная служба автоматически объявится в манифесте приложения:

   ```xml
   <service
       android:name=".<Имя службы>"
       android:exported="false">
   </service>
   ```

2. В манифесте приложения, измените секцию добавленной службы следующим образом:

   ```xml
   <service
    android:name=".<Имя службы>"
    android:icon="@mipmap/ic_launcher_round"
    android:label="Hello world">
    <meta-data
        android:name="ru.evotor.sales_screen.BACKGROUND_COLOR"
        android:value="#133788" />

    <intent-filter android:priority="20">
        <category android:name="android.intent.category.DEFAULT" />

        <action android:name="evo.v2.receipt.sell.receiptDiscount" />
    </intent-filter>
    </service>
   ```

   Где:

   Атрибут `android:name="ru.evotor.sales_screen.BACKGROUND_COLOR"` задаёт фон, на котором отображается иконка приложения.

   Элемент `<action android:name="evo.v2.receipt.sell.receiptDiscount" />` сообщает приложению где отображать иконку.

Итоговый манифест приложения, иконки которого отображаются как на главном экране, так и на экране оплаты выглядит так:

```xml
<?xml version="1.0" encoding="utf-8"?>
<manifest xmlns:android="http://schemas.android.com/apk/res/android"
    package="com.example.yourprojectname">

    <application
        android:allowBackup="true"
        android:icon="@mipmap/ic_launcher"
        android:label="@string/app_name"
        android:roundIcon="@mipmap/ic_launcher_round"
        android:supportsRtl="true"
        android:theme="@style/AppTheme">
        <activity
            android:name=".<Имя операции>"
            android:icon="@mipmap/ic_launcher_round"
            android:label="Hello world"
            android:theme="@style/AppTheme.NoActionBar">
            <meta-data
                android:name="ru.evotor.sales_screen.BACKGROUND_COLOR"
                android:value="#133788" />

            <intent-filter>
                <action android:name="android.intent.action.MAIN" />

                <category android:name="android.intent.category.EVOTOR" />
            </intent-filter>
        </activity>

        <service
            android:name=".<Имя службы>"
            android:icon="@mipmap/ic_launcher_round"
            android:label="Hello world">
            <meta-data
                android:name="ru.evotor.sales_screen.BACKGROUND_COLOR"
                android:value="#133788" />

            <intent-filter android:priority="20">
                <category android:name="android.intent.category.DEFAULT" />

                <action android:name="evo.v2.receipt.sell.receiptDiscount" />
            </intent-filter>
        </service>
    </application>

</manifest>
```

## Замена кнопки **Продажа** на главном экране смарт-терминала

Вы можете заменить кнопку **Продажа**, расположенную на главном экране смарт-терминала, на кнопку своего приложения:

{: .center-image}
![](images\sale_button_changed.png)

_Чтобы заменить кнопку **Продажа**:_

В [манифесте приложения](./doc_java_app_manifest.html), измените секцию соответствующей операции следующим образом:

```xml
 <activity
   android:name=".<НазваниеОперации>"
   android:icon="@mipmap/ic_launcher"
   android:label="Example tile"
   >
   <meta-data
       android:name="ru.evotor.launcher.BACKGROUND_COLOR"
       android:value="#133788" />
   <intent-filter>
       <action android:name="ru.evotor.intent.action.SELL_MAIN" />
       <category android:name="android.intent.category.EVOTOR" />
       <category android:name="android.intent.category.LAUNCHER" />
    </intent-filter>
 </activity>
```

   Где:

   Атрибут `android:name="ru.evotor.sales_screen.BACKGROUND_COLOR"` задаёт фон, на котором отображается иконка приложения.

   Элемент `<action android:name="ru.evotor.intent.action.SELL_MAIN" />` указывает, что иконка приложения заменит кнопку **Продажа** на главном экране смарт-терминала.

Теперь вы можете собрать apk своего приложения и [установить его на терминал](./doc_app_installation.html).
