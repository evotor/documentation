---
title: Работа с позициями чека
keywords: sample
summary: Раздел содержит информацию о том, как приложение может взаимодействовать с позициями чека.
sidebar: evotordoc_sidebar
permalink: doc_receipt_interactions.html
tags: [Терминал, Java, Чеки]
folder: smart_terminal_SDK
---


Приложение может добавлять, удалять и изменять позиции в чеке, а так же получать информацию о том, что чек был изменён:

* Если вы хотите работать с позициями в чеке используйте службу, чтобы получать события о намерении изменения чека. В этом случае, смарт-терминал ждёт ответа от приложения. События приходят как при продаже, так и при возврате товара.

* Если вы хотите получать сообщения об изменении чека или обновлении базы продуктов, например, для логирования и оповещения пользователей, используйте приёмник широковещательных сообщений. В этом случае смарт-терминал не ждёт ответа от приложения. События приходят как при продаже, так и при возврате товара.

### Использование службы и получение событий о намерении изменения чека

1. Создайте службу, например `MyIntegrationService`, которая наследует класс `IntegrationService`. В колбэке `onCreate` службы, зарегистрируйте процессор `BeforePositionsEditedEventProcessor` (процессор наследует класс `ActionProcessor`).

   ```java
   public class MyIntegrationService extends IntegrationService {
    @Nullable
    @Override
    protected Map<String, ActionProcessor> createProcessors() {
        Map<String, ActionProcessor> map = new HashMap<>();
        map.put(BeforePositionsEditedEvent.NAME_SELL_RECEIPT, new BeforePositionsEditedEventProcessor() {
            @Override
            public void call(@NonNull String action, @NonNull BeforePositionsEditedEvent event, @NonNull Callback callback){

            }
        });
        return map;
       }
   }
   ```

2. Объявите службу в манифесте приложения:

   ```xml
   <service
           android:name=".MyIntegrationService"
           android:enabled="true"
           android:exported="true">
           <intent-filter>
               <category android:name="android.intent.category.DEFAULT" />
               <action android:name="evo.v2.receipt.sell.beforePositionsEdited" />
           </intent-filter>
   </service>
   ```

В метод `call` процессора приходит событие `beforePositionsEditedEvent` и объект для возврата результата `callback`.



В ответ приложение возвращает результат со списком возможных изменений:

```java
public BeforePositionsEditedEventResult(
        @Nullable List<IPositionChange> changes,
        @Nullable SetExtra extra
)
```

Чтобы вернуть результат, используйте метод:

```java
callback.onResult(beforePositionsEditedEventResult)
```


Если приложению для возврата результата необходимо взаимодействие с пользователем, запустите операцию (`Activity`), которая наследует класс `IntegrationActivity`:

```java
callback.startActivity(new Intent(context, MainActivity.class));
```

Ваша операция должна вызвать метод `setIntegrationResult`.

Например:

```java
setIntegrationResult(new BeforePositionsEditedEventResult(changes, null));
```

Где вместо null вы можете передать `new SetExtra(extra)`, команду для [создания дополнительных полей в чеке](./doc_receipt_extras.html).



#### Описание события `BeforePositionsEditedEvent`

О намерении изменения чека сообщает событие `beforePositionsEditedEvent`:

```java
public class BeforePositionsEditedEvent implements IBundlable {
    private static final String TAG = "PositionsEditedEvent";

    public static final String NAME_SELL_RECEIPT = "evo.v2.receipt.sell.beforePositionsEdited";
    public static final String NAME_PAYBACK_RECEIPT = "evo.v2.receipt.payback.beforePositionsEdited";

    private static final String KEY_RECEIPT_UUID = "receiptUuid";
    private static final String KEY_CHANGES = "changes";

    @NonNull
    private final String receiptUuid;
    @NonNull
    private final List<IPositionChange> changes;

    public BeforePositionsEditedEvent(
            @NonNull String receiptUuid,
            @NonNull List<IPositionChange> changes
    ) {
        this.receiptUuid = receiptUuid;
        this.changes = changes;
    }

    @Nullable
    public static BeforePositionsEditedEvent create(@Nullable Bundle bundle) {
        if (bundle == null) {
            return null;
        }

        String receiptUuid = bundle.getString(KEY_RECEIPT_UUID, null);

        return new BeforePositionsEditedEvent(
                receiptUuid,
                Utils.filterByClass(
                        ChangesMapper.INSTANCE.create(bundle.getParcelableArray(KEY_CHANGES)),
                        IPositionChange.class
                )
        );
    }

    @Override
    @NonNull
    public Bundle toBundle() {
        Bundle result = new Bundle();
        result.putString(KEY_RECEIPT_UUID, receiptUuid);
        Parcelable[] changesParcelable = new Parcelable[changes.size()];
        for (int i = 0; i < changesParcelable.length; i++) {
            IChange change = changes.get(i);
            changesParcelable[i] = ChangesMapper.INSTANCE.toBundle(change);
        }
        result.putParcelableArray(KEY_CHANGES, changesParcelable);
        return result;
    }

    @NonNull
    public String getReceiptUuid() {
        return receiptUuid;
    }

    @NonNull
    public List<IPositionChange> getChanges() {
        return changes;
    }
}
```

#### Добавление, изменение и удаление позиций {#PositionAltering}

Чтобы добавить позицию:

* В Java-приложении используйте метод:

  ```java
  data class PositionAdd(val position: Position) : IPositionChange {

      override fun toBundle(): Bundle {
          return Bundle().apply {
              putBundle(
                      PositionMapper.KEY_POSITION,
                      PositionMapper.toBundle(position)
              )
          }
      }

      override fun getPositionUuid(): String? {
          return position.uuid
      }

      override fun getType(): IChange.Type {
          return IChange.Type.POSITION_ADD
      }

      companion object {
          @JvmStatic
          fun from(bundle: Bundle?): PositionAdd? {
              bundle ?: return null

              return PositionAdd(
                      PositionMapper.from(
                              bundle.getBundle(PositionMapper.KEY_POSITION)
                      ) ?: return null
              )
          }
      }
  }
  ```

* В JS-приложении используйте метод:

  ```javascript
  function processBeforePositionsEdited(actionData) {
  var position = {
      "uuid" : "8e0ffg-lk3e-e93bnk-v0p41",
      "productUuid" : "trb44-i32lev-9833jf",
      "productCode" : "1024",
      "productType" : "NORMAL",
      "name" : "myLittlePosition",
      "measureName" : "kg",
      "measurePrecision" : 0,
      "price" : "100",
      "quantity" : "1"
  }
      receipt.addPosition(JSON.stringify(position));
  }
  ```

Чтобы изменить позицию, используйте следующий метод:

```java
data class PositionEdit(val position: Position) : IPositionChange {

    override fun toBundle(): Bundle {
        return Bundle().apply {
            putBundle(
                    PositionMapper.KEY_POSITION,
                    PositionMapper.toBundle(position)
            )
        }
    }

    override fun getPositionUuid(): String? {
        return position.uuid
    }

    override fun getType(): IChange.Type {
        return IChange.Type.POSITION_EDIT
    }

    companion object {
        @JvmStatic
        fun from(bundle: Bundle?): PositionEdit? {
            bundle ?: return null

            return PositionEdit(
                    PositionMapper.from(bundle.getBundle(PositionMapper.KEY_POSITION)) ?: return null
            )
        }
    }
}
```

Чтобы удалить позицию, используйте следующий метод:

```java
data class PositionRemove(
        private val positionUuid: String
) : IPositionChange {

    override fun toBundle(): Bundle {
        return Bundle().apply {
            putString(
                    KEY_POSITION_UUID,
                    positionUuid
            )
        }
    }

    override fun getPositionUuid(): String? {
        return positionUuid
    }

    override fun getType(): IChange.Type {
        return IChange.Type.POSITION_REMOVE
    }

    companion object {
        const val KEY_POSITION_UUID = "positionUuid"

        @JvmStatic
        fun from(bundle: Bundle?): PositionRemove? {
            bundle ?: return null

            return PositionRemove(
                    bundle.getString(KEY_POSITION_UUID) ?: return null
            )
        }
    }
}
```

#### Описание позиций {#Position}

Вы можете добавить в чек как позицию соответствующую товару в базе терминала, так и задать свободную позицию.

Пример позиции чека, соответствующей товару в терминале (у позиции есть `uuid` товара):

```java
val positionFromProduct = Position.Builder.newInstance(
                UUID.randomUUID().toString(),
                product.uuid,
                product.name,
                product.measureName,
                product.measurePrecision,
                product.price,
                BigDecimal.ONE
        )
        .setExtraKeys(extraKeys)
        .build()
```

Где:

* `UUID` – идентификатор позиции в формате uuid4.
* `product.uuid` – идентификатор товара в формате uuid4, полученный из локальной базы товаров смарт-терминала.
* `product.name` – наименование товара из локальной базы товаров смарт-терминала.
* `product.measureName` – единицы измерения товара, полученные из локальной базы товаров смарт-терминала..
* `product.measurePrecision` – точность измерения единиц товара, выраженная в количестве знаков после запятой.
* `product.price` – цена продукта, полученная из локальной базы товаров смарт-терминала.
* `BigDecimal.ONE` – количество добавленного товара.
* `setExtraKeys()` – метод, который позволяет добавлять к позиции в чеке дополнительные ключи (идентификаторы). Каждый ключ имеет описание (`description`), которое отображается в интерфейсе и печатается на чеке (можно передавать `null`), идентификатор (`identity`) и хранит данные о приложении, создавшем ключ (`appId`).
  {% include note.html content="Приложение записывает дополнительные ключи в чек только под своим идентификатором." %}

Пример позиции чека с подпозицией (у позиции и подпозиции есть `uuid` товара):

```java
val positionFromProduct = Position.Builder.newInstance(
                UUID.randomUUID().toString(),
                product.uuid,
                product.name,
                product.measureName,
                product.measurePrecision,
                product.price,
                BigDecimal.ONE
        ).build()

        positionFromProduct.subPosition.add(
                Position.Builder.newInstance(
                                UUID.randomUUID().toString(),
                                product.uuid,
                                product.name,
                                product.measureName,
                                product.measurePrecision,
                                product.price,
                                BigDecimal.ONE
                        ).build()
                )
```

Вы можете использовать подпозиции `subPosition` для добавления опций к товару.
Например, к товару "Кофе" можно добавить подпозицию "Молоко". Подпозиция удаляется вместе с основной позицией товара.


Пример свободно заданной позиции (`uuid` товара – `null`):

```java
val freeProductPosition = Position.Builder.newInstance(
                UUID.randomUUID().toString(),
                null,
                "Товар",
                "шт",
                0,
                BigDecimal(100),
                BigDecimal(100)
        ).build()
```

### Получение событий об открытии чека, обновлении базы продуктов или результате изменения чека

Смарт терминал не ждёт ответ от приложения на широковещательные сообщения. Чтобы получать сообщения о результате изменения позиций в чеке зарегистрируйте приёмник широковещательных сообщений:

```java
package ru.evotor.consumer.consumer;

import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;
import android.widget.Toast;

import ru.evotor.framework.core.action.event.receipt.position_edited.PositionAddedEvent;

public class AddPositionBroadcastReceiver extends BroadcastReceiver {

    @Override
    public void onReceive(Context context, Intent intent) {
        Toast.makeText(context, "UUID: " + new PositionAddedEvent(intent.getExtras()).getReceiptUuid(), Toast.LENGTH_LONG).show();
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

#### Сообщения о результатах изменения чека

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

При [очистке чека](./doc_receipt_creation.html) приходит сообщение:

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
