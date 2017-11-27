---
title: Обработка событий смарт-терминала
keywords: позиция, чек, события, открыть, добавить, изменить
summary: "Раздел содержит информацию о том, как приложение может взаимодействовать с позициями чека."
sidebar: evotordoc_sidebar
permalink: doc_java_receipt_interactions.html
tags: [terminal, java, Receipts]
folder: java_SDK
published: false
---

## Получение событий об открытии чека, обновлении базы товаров или результате изменения чека

Смарт-терминал не ждёт ответ от приложения на широковещательные сообщения. Чтобы получать сообщения о результате изменения позиций в чеке зарегистрируйте приёмник широковещательных сообщений:

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

При открытии чека (продажи или возврата) приходит сообщение:

```java
public interface ReceiptOpenedEvent {
    String BROADCAST_ACTION_SELL_RECEIPT = "evotor.intent.action.receipt.sell.OPENED";
    String BROADCAST_ACTION_PAYBACK_RECEIPT = "evotor.intent.action.receipt.payback.OPENED";
    String KEY_UUID = "uuid";
}
```

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

Прочие уведомления:

```java
public class MyReceiver extends BroadcastReceiver {

    @Override
    public void onReceive(Context context, Intent intent) {
        String action = intent.getAction();
        Bundle bundle = intent.getExtras();
        Log.e("QWEASD", action);
        if (action.equals("evotor.intent.action.cashDrawer.OPEN")) {
            CashDrawerOpenEvent.create(bundle);
        } else if (action.equals("evotor.intent.action.cashOperation.IN")) {
            Log.e("QWEASD", "total" + CashInEvent.create(bundle).getTotal().toPlainString());
            Log.e("QWEASD", "uuid" + CashInEvent.create(bundle).getDocumentUuid());
        } else if (action.equals("evotor.intent.action.cashOperation.CASH_OUT")) {
            Log.e("QWEASD", "total" + CashOutEvent.create(bundle).getTotal().toPlainString());
            Log.e("QWEASD", "uuid" + CashOutEvent.create(bundle).getDocumentUuid());
        } else if (action.equals("evotor.intent.action.inventory.CARD_OPEN")) {
            Log.e("QWEASD", "uuid" + ProductCardOpenedEvent.create(bundle).getProductUuid());
        } else if (action.equals("evotor.intent.action.receipt.sell.CLEARED")) {
            Log.e("QWEASD", "uuid" + ReceiptClearedEvent.create(bundle).getReceiptUuid());
        } else if (action.equals("evotor.intent.action.receipt.payback.CLEARED")) {
            Log.e("QWEASD", "uuid" + ReceiptClearedEvent.create(bundle).getReceiptUuid());
        } else if (action.equals("evotor.intent.action.receipt.sell.RECEIPT_CLOSED")) {
            Log.e("QWEASD", "uuid" + ReceiptClosedEvent.create(bundle).getReceiptUuid());
        } else if (action.equals("evotor.intent.action.receipt.payback.RECEIPT_CLOSED")) {
            Log.e("QWEASD", "uuid" + ReceiptClosedEvent.create(bundle).getReceiptUuid());
        } else if (action.equals("evotor.intent.action.receipt.sell.OPENED")) {
            Log.e("QWEASD", "uuid" + ReceiptOpenedEvent.create(bundle).getReceiptUuid());
        } else if (action.equals("evotor.intent.action.receipt.payback.OPENED")) {
            Log.e("QWEASD", "uuid" + ReceiptOpenedEvent.create(bundle).getReceiptUuid());
        }

    }
}
```

Где:
`CashInEvent` - внесение наличных.
`CashDrawerOpenEvent` - открытие денежного ящика.
`CashOutEvent` - выдача наличных.
`ReceiptClosedEvent` - закрытие чека.
