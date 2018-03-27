---
title: Обработка событий смарт-терминала
keywords: позиция, чек, события
summary: Приложение может добавлять, удалять и изменять позиции в чеке. Если вы хотите получать события изменения чека или обновления базы продуктов, например, для логирования и оповещения пользователей, используйте приёмник широковещательных сообщений. В этом случае смарт-терминал не ждёт ответа от приложения. События приходят как при продаже, так и при возврате товара.
sidebar: evotordoc_sidebar
permalink: doc_java_st_events.html
tags: [terminal, java, Receipts]
folder: java_SDK
published: true
---

## Получение событий об открытии чека, обновлении базы товаров или результате изменения чека

Смарт-терминал не ждёт ответ от приложения на широковещательные сообщения. Чтобы получать сообщения о результате изменения позиций в чеке, зарегистрируйте приёмник широковещательных сообщений:

```java
package ru.evotor.consumer.consumer;

import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;
import android.widget.Toast;

import ru.evotor.framework.core.action.event.receipt.position_edited.PositionAddedEvent;

public class AddPositionBroadcastReceiver extends BroadcastReceiver {

    @Override
    public void onReceive(Context context, Intent intent)
        { Toast.makeText(context, "UUID: " + PositionAddedEvent.create(intent.getExtras()).getReceiptUuid(), Toast.LENGTH_LONG).show(); }
    }
}
```

Объявите приёмник в манифесте приложения:

```xml
<receiver
        android:name=".AddPositionBroadcastReceiver"
        android:enabled="true"
        android:exported="true">
        <intent-filter>
            <action android:name="evotor.intent.action.receipt.sell.POSITION_ADDED" />
            <category android:name="android.intent.category.DEFAULT" />
        </intent-filter>
    </receiver>
```

## Сообщения о результатах изменения чека

### Событие открытия чека

При открытии чека (продажи или возврата) приходит сообщение:

```java
public interface ReceiptOpenedEvent {
    String BROADCAST_ACTION_SELL_RECEIPT = "evotor.intent.action.receipt.sell.OPENED";
    String BROADCAST_ACTION_PAYBACK_RECEIPT = "evotor.intent.action.receipt.payback.OPENED";
    String KEY_UUID = "uuid";
}
```

### Событие добавления позиции в чек

При добавлении позиции приходит сообщение:

```java
public class PositionAddedEvent extends PositionEvent {
    public static final String BROADCAST_ACTION_SELL_RECEIPT = "evotor.intent.action.receipt.sell.POSITION_ADDED";
    public static final String BROADCAST_ACTION_PAYBACK_RECEIPT = "evotor.intent.action.receipt.payback.POSITION_ADDED";

    public PositionAddedEvent(Bundle extras) {
        super(extras);
    }

    public PositionAddedEvent(String receiptUuid, Position position) {
        super(receiptUuid, position);
    }
}
```

### Событие изменения позиции в чеке

При изменении позиции приходит сообщение:

```java
public class PositionEditedEvent extends PositionEvent {
    public static final String BROADCAST_ACTION_SELL_RECEIPT = "evotor.intent.action.receipt.sell.POSITION_EDITED";
    public static final String BROADCAST_ACTION_PAYBACK_RECEIPT = "evotor.intent.action.receipt.payback.POSITION_EDITED";

    public PositionEditedEvent(Bundle extras) {
        super(extras);
    }

    public PositionEditedEvent(String receiptUuid, Position position) {
        super(receiptUuid, position);
    }
}
```

### Событие удаления позиции из чека

При удалении позиции приходит сообщение:

```java
public class PositionRemovedEvent extends PositionEvent {
    public static final String BROADCAST_ACTION_SELL_RECEIPT = "evotor.intent.action.receipt.sell.POSITION_REMOVED";
    public static final String BROADCAST_ACTION_PAYBACK_RECEIPT = "evotor.intent.action.receipt.payback.POSITION_REMOVED";

    public PositionRemovedEvent(Bundle extras) {
        super(extras);
    }

    public PositionRemovedEvent(String receiptUuid, Position position) {
        super(receiptUuid, position);
    }
}
```

### Событие обновления базы товаров

При обновлении базы товаров приходит сообщение:

```java
public class PositionRemovedEvent extends PositionEvent {
    public static final String BROADCAST_ACTION_PRODUCTS_UPDATED = "evotor.intent.action.inventory.PRODUCTS_UPDATED";

    public ProductsUpdatedEvent(Bundle extras) {
        super(extras);
    }

    public ProductsUpdatedEvent(String receiptUuid, Position position) {
        super(receiptUuid, position);
    }
}
```

### Событие очистки чека

При [очистке чека](./doc_java_receipt_creation.html) приходит сообщение:

```java
public class ReceiptClearedEvent extends ReceiptEvent {
    public static final String BROADCAST_ACTION_SELL_RECEIPT_CLEARED = "evotor.intent.action.receipt.sell.CLEARED";
    public static final String BROADCAST_ACTION_PAYBACK_RECEIPT_CLEARED = "evotor.intent.action.receipt.payback.CLEARED";

    public ReceiptClearedEvent(@NonNull String receiptUuid) {
        super(receiptUuid);
    }

    @Nullable
    public static ReceiptClearedEvent create(@Nullable Bundle bundle) {
        if (bundle == null) {
            return null;
        }
        String receiptUuid = getReceiptUuid(bundle);
        if (receiptUuid == null) {
            return null;
        }
        return new ReceiptClearedEvent(receiptUuid);
    }
}
```

## Логирование различных событий смарт-терминала

Ниже представлен пример логирования событий, которые может распространять смарт-терминал. Для обработки таких событий также требуется создавать приёмник широковещательных сообщений.

```java
public class MyReceiver extends BroadcastReceiver {

    @Override
    public void onReceive(Context context, Intent intent) {
        String action = intent.getAction();
        Bundle bundle = intent.getExtras();
        Log.e("TAG", action);
        if (action.equals("evotor.intent.action.cashDrawer.OPEN")) {
            CashDrawerOpenEvent.create(bundle);//Открытие денежного ящика.
        } else if (action.equals("evotor.intent.action.cashOperation.CASH_IN")) {
            Log.e("TAG", "total" + CashInEvent.create(bundle).getTotal().toPlainString());//Внесение наличных.
            Log.e("TAG", "uuid" + CashInEvent.create(bundle).getDocumentUuid());
        } else if (action.equals("evotor.intent.action.cashOperation.CASH_OUT")) {
            Log.e("TAG", "total" + CashOutEvent.create(bundle).getTotal().toPlainString());//Изъятие наличных.
            Log.e("TAG", "uuid" + CashOutEvent.create(bundle).getDocumentUuid());
        } else if (action.equals("evotor.intent.action.inventory.CARD_OPEN")) {
            Log.e("TAG", "uuid" + ProductCardOpenedEvent.create(bundle).getProductUuid());//Открытие карточки товара.
        } else if (action.equals("evotor.intent.action.receipt.sell.CLEARED")) {
            Log.e("TAG", "uuid" + ReceiptClearedEvent.create(bundle).getReceiptUuid());//Очистка чека продажи (создание нового чека).
        } else if (action.equals("evotor.intent.action.receipt.payback.CLEARED")) {
            Log.e("TAG", "uuid" + ReceiptClearedEvent.create(bundle).getReceiptUuid());//Очистка чека возврата (создание нового чека).
        } else if (action.equals("evotor.intent.action.receipt.sell.RECEIPT_CLOSED")) {
            Log.e("TAG", "uuid" + ReceiptClosedEvent.create(bundle).getReceiptUuid());//Закрытие чека продажи.
        } else if (action.equals("evotor.intent.action.receipt.payback.RECEIPT_CLOSED")) {
            Log.e("TAG", "uuid" + ReceiptClosedEvent.create(bundle).getReceiptUuid());//Закрытие чека возврата.
        } else if (action.equals("evotor.intent.action.receipt.sell.OPENED")) {
            Log.e("TAG", "uuid" + ReceiptOpenedEvent.create(bundle).getReceiptUuid());//Открытие чека продажи.
        } else if (action.equals("evotor.intent.action.receipt.payback.OPENED")) {
            Log.e("TAG", "uuid" + ReceiptOpenedEvent.create(bundle).getReceiptUuid());//Открытие чека возврата.
        }

    }
}
```
