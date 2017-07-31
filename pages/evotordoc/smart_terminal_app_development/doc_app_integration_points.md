---
title: Точки интеграции
keywords:
summary:
sidebar: evotordoc_sidebar
permalink: doc_app_integration_points.html
tags: [Терминал, JS, Java]
folder: smart_terminal_app_development
---

*Точки интеграции* необходимы для взаимодействия приложения и смарт-терминала. Точки интеграции представляют собой события, которые распространяет смарт-терминал и [команды](./doc_java_app_integration_points.html#Commands), которые может передавать приложение. В ответ на события смарт-терминал [может ожидать](./doc_java_app_integration_points.html#Callbacks) (в этом случае на событие требуется подписать службу) или [не ожидать ответа](./doc_java_app_integration_points.html#Events) от приложения (на такие события требуется подписывать приёмники широковещательных сообщений). События, требующие ответа, похожи на команды, но передаёт их терминал.

{% include note.html content="О том, что представляют из себя службы и приёмники сообщений вы можете [узнать в документации для Android ОС](https://developer.android.com/guide/index.html)." %}

Схема ниже показывает процесс обмена событием, которое требует ответа. Первое приложение, которому смарт-терминал передаёт данные, выбирается случайным образом.

![](./images/EventSequenceDiagram.png)

### Подготовка манифеста приложения
В зависимости от типа точки интеграции вам потребуется образом изменить [манифест приложения](./doc_about_manifest.html). Так если вы используете службы или приёмники сообщений вам необходимо соответствующим образом объявить их в манифесте приложения.

{% include note.html content="Если ваше приложение передаёт в смарт-терминал команды, манифест изменять не требуется." %}

#### Объявление службы в манифесте java-приложения

```xml
<service
            android:name=".YourService"
            android:enabled="true"
            android:exported="true">
            <intent-filter>
                <category android:name="android.intent.category.DEFAULT" />
                <action android:name="<Событие, которое требуют ответа>" />
            </intent-filter>
        </service>
```

#### Объявление приёмника широковещательных сообщений в манифесте java-приложения

```xml
<receiver
 android:name=".YourBroadcastReceiver"
 android:enabled="true"
 android:exported="true">
    <intent-filter>
        <action android:name="<Событие, которое не требует ответа>" />
        <category android:name="android.intent.category.DEFAULT" />
    </intent-filter>
</receiver>
```

#### Объявление плагина (службы) в манифесте js-приложения

```yaml
plugins:
  - name: plugin1
    moments:
      - <Событие, которое требует ответа>
    behavior: plugin1.js
```

#### Объявление демона (приёмника широковещательных сообщений) в манифесте js-приложения

```yaml
daemons:
  - name: daemon1
    events:
      - <Событие, которое не требует ответа>
    behavior: daemon1.js
```


### Список точек интеграции

Ниже приведены таблицы с описанием всех точек интеграции приложения и смарт-терминала.

#### Команды приложения {#Commands}

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

#### События, которые не требуют ответа {#Events}

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
<tr><td>Обновление базы товаров</td>
<td>evotor.intent.action.inventory.PRODUCTS_UPDATED</td>
<td><a href="https://github.com/evotor/integration-library/blob/develop/app/src/main/java/ru/evotor/framework/inventory/InventoryApi.kt">InventoryApi.kt</a></td>
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
<tr>
<td>Позиция была удалена из чека возврата</td>
<td>evotor.intent.action.receipt.payback.POSITION_REMOVED</td>
<td><a href="https://github.com/evotor/integration-library/blob/develop/app/src/main/java/ru/evotor/framework/core/action/event/receipt/position_edited/PositionRemovedEvent.java">PositionRemovedEvent.java </a></td>
</tr>
<tr>
<td>Чек продажи был очищен</td>
<td>evotor.intent.action.receipt.sell.CLEARED</td>
<td><a href="https://github.com/evotor/integration-library/blob/develop/app/src/main/java/ru/evotor/framework/core/action/event/receipt/receipt_edited/ReceiptClearedEvent.java">ReceiptClearedEvent.java</a></td>
</tr>
<tr>
<td>Чек возврата был очищен</td>
<td>evotor.intent.action.receipt.payback.CLEARED</td>
<td><a href="https://github.com/evotor/integration-library/blob/develop/app/src/main/java/ru/evotor/framework/core/action/event/receipt/receipt_edited/ReceiptClearedEvent.java">ReceiptClearedEvent.java </a></td>
</tr>
<tr>
<td>Чек продажи был успешно закрыт</td>
<td>evotor.intent.action.receipt.sell.RECEIPT_CLOSED</td>
<td><a href="https://github.com/evotor/integration-library/blob/develop/app/src/main/java/ru/evotor/framework/core/action/event/receipt/receipt_edited/ReceiptClosedEvent.java">ReceiptClosedEvent.java</a></td>
</tr>
<tr>
<td>Чек возврата был успешно закрыт</td>
<td>evotor.intent.action.receipt.payback.RECEIPT_CLOSED</td>
<td><a href="https://github.com/evotor/integration-library/blob/develop/app/src/main/java/ru/evotor/framework/core/action/event/receipt/receipt_edited/ReceiptClosedEvent.java">ReceiptClosedEvent.java </a></td>
</tr>
<tr>
<td>Чек продажи был успешно открыт</td>
<td>evotor.intent.action.receipt.sell.OPENED</td>
<td><a href="https://github.com/evotor/integration-library/blob/develop/app/src/main/java/ru/evotor/framework/core/action/event/receipt/receipt_edited/ReceiptOpenedEvent.java">ReceiptOpenedEvent.java</a></td>
</tr>
<tr>
<td>Чек возврата был успешно открыт</td>
<td>evotor.intent.action.receipt.payback.OPENED</td>
<td><a href="https://github.com/evotor/integration-library/blob/develop/app/src/main/java/ru/evotor/framework/core/action/event/receipt/receipt_edited/ReceiptOpenedEvent.java">ReceiptOpenedEvent.java </a></td>
</tr>
<tr>
<td>Печатные группы были изменены для чека продажи</td>
<td>evotor.intent.action.receipt.sell.printGroup.EDITED</td>
<td><a href="https://github.com/evotor/integration-library/blob/develop/app/src/main/java/ru/evotor/framework/core/action/event/receipt/receipt_edited/ReceiptPrintGroupEditedEvent.java">ReceiptPrintGroupEditedEvent.java</a></td>
</tr>
<tr>
<td>Печатные группы были изменены для чека врзврата</td>
<td>evotor.intent.action.receipt.payback.printGroup.EDITED</td>
<td><a href="https://github.com/evotor/integration-library/blob/develop/app/src/main/java/ru/evotor/framework/core/action/event/receipt/receipt_edited/ReceiptPrintGroupEditedEvent.java">ReceiptPrintGroupEditedEvent.java </a></td>
</tr>
<tr>
<td>Оплаты по чеку продажи были разделены</td>
<td>evotor.intent.action.receipt.sell.paymentParts.EDITED</td>
<td><a href="https://github.com/evotor/integration-library/blob/develop/app/src/main/java/ru/evotor/framework/core/action/event/receipt/receipt_edited/ReceiptPaymentPartsEditedEvent.java">ReceiptPaymentPartsEditedEvent.java</a></td>
</tr>
<tr>
<td>Оплаты по чеку возврата были разделены</td>
<td>evotor.intent.action.receipt.payback.paymentParts.EDITED</td>
<td><a href="https://github.com/evotor/integration-library/blob/develop/app/src/main/java/ru/evotor/framework/core/action/event/receipt/receipt_edited/ReceiptPaymentPartsEditedEvent.java">ReceiptPaymentPartsEditedEvent.java</a></td>
</tr>
</table>



#### События, которые требуют ответа {#Callbacks}

<table>
<tr>
<td><a href="https://developer.evotor.ru/docs/doc_java_receipt_interactions.html">Намерение изменить позицию в чеке продажи</a></td>
<td>evo.v2.receipt.sell.beforePositionsEdited</td>
<td><a href="https://github.com/evotor/integration-library/blob/develop/app/src/main/java/ru/evotor/framework/core/action/event/receipt/before_positions_edited/BeforePositionsEditedEvent.java">BeforePositionsEditedEvent.java</a></td>
</tr>
<tr>
<td><a href="https://developer.evotor.ru/docs/doc_java_receipt_interactions.html">Намерение изменить позицию в чеке возврата</a></td>
<td>evo.v2.receipt.payback.beforePositionsEdited</td>
<td><a href="https://github.com/evotor/integration-library/blob/develop/app/src/main/java/ru/evotor/framework/core/action/event/receipt/before_positions_edited/BeforePositionsEditedEvent.java">BeforePositionsEditedEvent.java</a></td>
</tr>
<tr>
<td><a href="https://developer.evotor.ru/docs/doc_java_receipt_division.html">Разделение платежей в чеке продажи</a></td>
<td>evo.v2.receipt.sell.payment.SELECTED</td>
<td><a href="https://github.com/evotor/integration-library/blob/develop/app/src/main/java/ru/evotor/framework/core/action/event/receipt/payment/PaymentSelectedEvent.java">PaymentSelectedEvent.java</a></td>
</tr>
<tr>
<td><a href="https://developer.evotor.ru/docs/doc_java_receipt_division.html">Разделение чека продажи на несколько печатных групп</a></td>
<td>evo.v2.receipt.sell.printGroup.REQUIRED</td>
<td><a href="https://github.com/evotor/integration-library/blob/develop/app/src/main/java/ru/evotor/framework/core/action/event/receipt/print_group/PrintGroupRequiredEvent.java">PrintGroupRequiredEvent.java</a></td>
</tr>
<tr>
<td><a href="https://developer.evotor.ru/docs/doc_java_discounts.html">Начисление скидки на чек продажи</a></td>
<td>evo.v2.receipt.sell.receiptDiscount</td>
<td><a href="https://github.com/evotor/integration-library/blob/develop/app/src/main/java/ru/evotor/framework/core/action/event/receipt/discount/ReceiptDiscountEvent.java">ReceiptDiscountEvent.java</a></td>
</tr>
<tr>
<td><a href="https://developer.evotor.ru/docs/doc_java_discounts.html">Начисление скидки на чек возврата</a></td>
<td>evo.v2.receipt.payback.receiptDiscount</td>
<td><a href="https://github.com/evotor/integration-library/blob/develop/app/src/main/java/ru/evotor/framework/core/action/event/receipt/discount/ReceiptDiscountEvent.java">ReceiptDiscountEvent.java</a></td>
</tr>
</table>
