---
title: Манифест Java-приложения
keywords:
summary:
sidebar: evotordoc_sidebar
permalink: doc_java_app_manifest.html
tags: [Терминал, Java]
folder: smart_terminal_SDK
---

Ниже приведён пример манифеста java-приложения, которое добавляет две [иконки на экран оплаты](./doc_java_app_icon.html).

При разработке драйвера для устройств нужно учитывать дополнительные параметры (см. [SDK для денежных ящиков](./doc_drivers_cashdrawer.html) и другие разделы, посвящённые разработке драйверов)

```xml
<manifest package="com.example.myapplication">

  <application android:theme="@style/AppTheme" android:icon="@mipmap/ic_launcher" android:allowBackup="true" xmlns:android="http://schemas.android.com/apk/res/android">

    <meta-data android:name="app_uuid" android:value="<Строка с идентификатором приложения, представленном в формате uuid4>"/>

    <service android:name=".UIPluginServiceImplementation" android:exported="true" android:enabled="true">
      <intent-filter>
        <action android:name="android.intent.action.MAIN"/>
        <category android:name="android.intent.category.DEFAULT"/>
        <category android:name="android.intent.category.EVOTOR"/>
      </intent-filter>
    </service>

    <service android:name=".DaemonServiceImplementation" android:exported="true" android:enabled="true">
      <intent-filter>
        <action android:name="android.intent.action.MAIN"/>
        <category android:name="android.intent.category.DEFAULT"/>
        <category android:name="android.intent.category.EVOTOR"/>
      </intent-filter>
    </service>

    <activity android:icon="@mipmap/hello_sales_view_icon" android:name=".HELLO_SALES_VIEW" android:label="Hello">
      <intent-filter android:priority="90">
        <action android:name="android.intent.action.MAIN"/>
        <category android:name="evo.v2.receipt.sell.receiptDiscount"/>
        <category android:name="android.intent.category.DEFAULT"/>
      </intent-filter>
      <meta-data android:name="ru.evotor.sales_screen.BACKGROUND_COLOR" android:value="@color/hello_sales_view_launcher_color"/>
    </activity>

    <service android:icon="@mipmap/hello_sales_view_icon" android:name=".HELLO_SALES_VIEW_SERVICE" android:exported="true" android:enabled="true" android:label="Hello">
      <intent-filter>
        <action android:name="android.intent.action.MAIN"/>
        <action android:name="evo.v2.receipt.sell.receiptDiscount"/>
        <category android:name="android.intent.category.DEFAULT"/>
      </intent-filter>
      <meta-data android:name="ru.evotor.sales_screen.BACKGROUND_COLOR" android:value="@color/hello_sales_view_launcher_color"/>
    </service>

    <activity android:icon="@mipmap/world_sales_view_icon" android:name=".WORLD_SALES_VIEW" android:label="World">
      <intent-filter android:priority="90">
        <action android:name="android.intent.action.MAIN"/>
        <category android:name="evo.v2.receipt.sell.receiptDiscount"/>
        <category android:name="android.intent.category.DEFAULT"/>
      </intent-filter>
      <meta-data android:name="ru.evotor.sales_screen.BACKGROUND_COLOR" android:value="@color/world_sales_view_launcher_color"/>
    </activity>

    <service android:icon="@mipmap/world_sales_view_icon" android:name=".WORLD_SALES_VIEW_SERVICE" android:exported="true" android:enabled="true" android:label="World">
      <intent-filter>
        <action android:name="android.intent.action.MAIN"/>
        <action android:name="evo.v2.receipt.sell.receiptDiscount"/>
        <category android:name="android.intent.category.DEFAULT"/>
      </intent-filter>
      <meta-data android:name="ru.evotor.sales_screen.BACKGROUND_COLOR" android:value="@color/world_sales_view_launcher_color"/>
    </service>

  </application>

</manifest>
```

{% include note.html content="В секции application, требуется указать элемент meta-data, который содержит идентификатор приложения строка в формате uuid4. Вы найдёте идентификатор приложения в адресной строке браузера, кодга выберете приложение на сайте [dev.evotor.ru](https://dev.evotor.ru)." %}

#### Команды

Пример:

```java
new OpenSellReceiptCommand(positionAddList, extra).process(context, callback);
```

Таблица ниже содержит команды и их описание.

<table>
<tr>
<td>Команда открытия чека продажи</td>
<td>evo.v2.receipt.sell.openReceipt</td>
<td><a href="https://github.com/evotor/integration-library/blob/develop/app/src/main/java/ru/evotor/framework/core/action/command/open_receipt_command/OpenSellReceiptCommand.java">OpenSellReceiptCommand</a></td>
<td>new OpenSellReceiptCommand(positionAddList, extra).process(context, callback);</td>
</tr>
<tr><td>Команда открытия чека возврата</td>
<td>evo.v2.receipt.payback.openReceipt</td>
<td><a href="https://github.com/evotor/integration-library/blob/develop/app/src/main/java/ru/evotor/framework/core/action/command/open_receipt_command/OpenPaybackReceiptCommand.java">OpenPaybackReceiptCommand </a></td>
<td>new OpenPaybackReceiptCommand(positionAddList, extra).process(context, callback);</td>
</tr>
</table>


#### Приёмники широковещательных сообщений

Пример:

```java
public class MyBroadcastReceiver extends BroadcastReceiver {
    @Override
 public void onReceive(Context context, Intent intent) {
        CashDrawerOpenEvent event = CashDrawerOpenEvent.create(intent.getExtras());
        // TODO insert your code here
 }
}
```

Таблица ниже содержит события, на которые можно подписать приёмники широковещательных сообщений.

<table>
<tr>
<td>Событие открытия денежного ящика</td>
<td>evotor.intent.action.cashDrawer.OPEN</td>
<td><a href="https://github.com/evotor/integration-library/blob/develop/app/src/main/java/ru/evotor/framework/core/action/event/cash_drawer/CashDrawerOpenEvent.java">CashDrawerOpenEvent.java</a></td>
</tr>
<tr><td>Внесение денег</td>
<td>evotor.intent.action.cashOperation.CASH_IN</td>
<td><a href="https://github.com/evotor/integration-library/blob/develop/app/src/main/java/ru/evotor/framework/core/action/event/cash_operations/CashInEvent.java">CashInEvent.java</a></td>
</tr>
<tr><td>Выплата денег</td>
<td>evotor.intent.action.cashOperation.CASH_OUT</td>
<td><a href="https://github.com/evotor/integration-library/blob/develop/app/src/main/java/ru/evotor/framework/core/action/event/cash_operations/CashOutEvent.java">CashOutEvent.java </a></td>
</tr>
<tr><td>Открытие карточки товара\товарной группы</td>
<td>evotor.intent.action.inventory.CARD_OPEN</td>
<td><a href="https://github.com/evotor/integration-library/blob/develop/app/src/main/java/ru/evotor/framework/core/action/event/inventory/ProductCardOpenedEvent.java">ProductCardOpenedEvent.java</a></td>
</tr>
<tr><td>Позиция была отредактирована в чеке продажи</td>
<td>evotor.intent.action.receipt.sell.POSITION_EDITED</td>
<td><a href="https://github.com/evotor/integration-library/blob/develop/app/src/main/java/ru/evotor/framework/core/action/event/receipt/position_edited/PositionEditedEvent.java">PositionEditedEvent.java</a></td>
</tr>
<tr><td>Позиция была отредактирована в чеке возврата</td>
<td>evotor.intent.action.receipt.payback.POSITION_EDITED</td>
<td><a href="https://github.com/evotor/integration-library/blob/develop/app/src/main/java/ru/evotor/framework/core/action/event/receipt/position_edited/PositionEditedEvent.java">PositionEditedEvent.java </a></td>
</tr>
<tr><td>Позиция была добавлена в чек продажи</td>
<td>evotor.intent.action.receipt.sell.POSITION_ADDED</td>
<td><a href="https://github.com/evotor/integration-library/blob/develop/app/src/main/java/ru/evotor/framework/core/action/event/receipt/position_edited/PositionAddedEvent.java">PositionAddedEvent.java </a></td>
</tr>
<tr><td>Позиция была добавлена в чек возврата</td>
<td>evotor.intent.action.receipt.payback.POSITION_ADDED</td>
<td><a href="https://github.com/evotor/integration-library/blob/develop/app/src/main/java/ru/evotor/framework/core/action/event/receipt/position_edited/PositionAddedEvent.java">PositionAddedEvent.java </a></td>
</tr>
<tr><td>Позиция была удалена из чека продажи</td>
<td>evotor.intent.action.receipt.sell.POSITION_REMOVED</td>
<td><a href="https://github.com/evotor/integration-library/blob/develop/app/src/main/java/ru/evotor/framework/core/action/event/receipt/position_edited/PositionRemovedEvent.java">PositionRemovedEvent.java </a></td>
</tr>
<tr><td>Позиция была удалена из чека возврата</td>
<td>evotor.intent.action.receipt.payback.POSITION_REMOVED</td>
<td><a href="https://github.com/evotor/integration-library/blob/develop/app/src/main/java/ru/evotor/framework/core/action/event/receipt/position_edited/PositionRemovedEvent.java">PositionRemovedEvent.java </a></td>
</tr>
<tr><td>Чек продажи был очищен</td>
<td>evotor.intent.action.receipt.sell.CLEARED</td>
<td><a href="https://github.com/evotor/integration-library/blob/develop/app/src/main/java/ru/evotor/framework/core/action/event/receipt/receipt_edited/ReceiptClearedEvent.java">ReceiptClearedEvent.java</a></td>
</tr>
<tr><td>Чек возврата был очищен</td>
<td>evotor.intent.action.receipt.payback.CLEARED</td>
<td><a href="https://github.com/evotor/integration-library/blob/develop/app/src/main/java/ru/evotor/framework/core/action/event/receipt/receipt_edited/ReceiptClearedEvent.java">ReceiptClearedEvent.java </a></td>
</tr>
<tr><td>Чек продажи был успешно закрыт</td>
<td>evotor.intent.action.receipt.sell.RECEIPT_CLOSED</td>
<td><a href="https://github.com/evotor/integration-library/blob/develop/app/src/main/java/ru/evotor/framework/core/action/event/receipt/receipt_edited/ReceiptClosedEvent.java">ReceiptClosedEvent.java</a></td>
</tr>
<tr><td>Чек возврата был успешно закрыт</td>
<td>evotor.intent.action.receipt.payback.RECEIPT_CLOSED</td>
<td><a href="https://github.com/evotor/integration-library/blob/develop/app/src/main/java/ru/evotor/framework/core/action/event/receipt/receipt_edited/ReceiptClosedEvent.java">ReceiptClosedEvent.java </a></td>
</tr>
<tr><td>Чек продажи был успешно открыт</td>
<td>evotor.intent.action.receipt.sell.OPENED</td>
<td><a href="https://github.com/evotor/integration-library/blob/develop/app/src/main/java/ru/evotor/framework/core/action/event/receipt/receipt_edited/ReceiptOpenedEvent.java">ReceiptOpenedEvent.java</a></td>
</tr>
<tr><td>Чек возврата был успешно открыт</td>
<td>evotor.intent.action.receipt.payback.OPENED</td>
<td><a href="https://github.com/evotor/integration-library/blob/develop/app/src/main/java/ru/evotor/framework/core/action/event/receipt/receipt_edited/ReceiptOpenedEvent.java">ReceiptOpenedEvent.java </a></td>
</tr>
<tr><td>Печатные группы были изменены для чека продажи</td>
<td>evotor.intent.action.receipt.sell.printGroup.EDITED</td>
<td><a href="https://github.com/evotor/integration-library/blob/develop/app/src/main/java/ru/evotor/framework/core/action/event/receipt/receipt_edited/ReceiptPrintGroupEditedEvent.java">ReceiptPrintGroupEditedEvent.java</a></td>
</tr>
<tr><td>Печатные группы были изменены для чека врзврата</td>
<td>evotor.intent.action.receipt.payback.printGroup.EDITED</td>
<td><a href="https://github.com/evotor/integration-library/blob/develop/app/src/main/java/ru/evotor/framework/core/action/event/receipt/receipt_edited/ReceiptPrintGroupEditedEvent.java">ReceiptPrintGroupEditedEvent.java </a></td>
</tr>
<tr><td>Оплаты по чеку продажи были разделены</td>
<td>evotor.intent.action.receipt.sell.paymentParts.EDITED</td>
<td><a href="https://github.com/evotor/integration-library/blob/develop/app/src/main/java/ru/evotor/framework/core/action/event/receipt/receipt_edited/ReceiptPaymentPartsEditedEvent.java">ReceiptPaymentPartsEditedEvent.java</a></td>
</tr>
<tr><td>Оплаты по чеку возврата были разделены</td>
<td>evotor.intent.action.receipt.payback.paymentParts.EDITED</td>
<td><a href="https://github.com/evotor/integration-library/blob/develop/app/src/main/java/ru/evotor/framework/core/action/event/receipt/receipt_edited/ReceiptPaymentPartsEditedEvent.java">ReceiptPaymentPartsEditedEvent.java</a></td>
</tr>
</table>
