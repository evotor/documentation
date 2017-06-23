---
title: Работа с чеком
keywords: sample
summary: Раздел содержит информацию о том, какие события может использовать приложение, чтобы работать с чеком, например, добавлять или удалять позиции из чека.
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
       @Override
       public void onCreate() {
           registerProcessor(new BeforePositionsEditedEventProcessor() {
               @Override
               public void call(BeforePositionsEditedEvent beforePositionsEditedEvent, Callback callback)
           });
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
public class BeforePositionsEditedEventResult {

    private static final String KEY_RESULT = "result";
    private static final String KEY_CHANGES = "changes";

    public static BeforePositionsEditedEventResult create(Bundle bundle) {
        String resultName = bundle.getString(KEY_RESULT);
        Parcelable[] changesParcelable = bundle.getParcelableArray(KEY_CHANGES);
        List<IChange> changes = ChangesMapper.INSTANCE.create(changesParcelable);
        List<IPositionChange> positionChanges = new ArrayList<>();
        for (IChange change : changes) {
            if (change instanceof IPositionChange) {
                positionChanges.add((IPositionChange) change);
            }
        }
        return new BeforePositionsEditedEventResult(
                Utils.safeValueOf(Result.class, resultName, Result.UNKNOWN),
                positionChanges
        );
    }

    private final Result result;
    private final List<IPositionChange> changes;

    public BeforePositionsEditedEventResult(Result result, List<IPositionChange> changes) {
        this.result = result;
        this.changes = changes;
    }

    public Bundle toBundle() {
        Bundle bundle = new Bundle();
        bundle.putString(KEY_RESULT, result.name());
        Parcelable[] changesParcelable = new Parcelable[changes.size()];
        for (int i = 0; i < changesParcelable.length; i++) {
            IChange change = changes.get(i);
            changesParcelable[i] = ChangesMapper.INSTANCE.toBundle(change);
        }
        bundle.putParcelableArray(KEY_CHANGES, changesParcelable);
        return bundle;
    }

    public Result getResult() {
        return result;
    }

    public List<IPositionChange> getChanges() {
        return changes;
    }

    public enum Result {
        OK,
        UNKNOWN;
    }
}
```

Чтобы вернуть результат, используйте метод:

```java
callback.onResult(beforePositionsEditedEventResult.toBundle())
```


Если приложению для возврата результата необходимо взаимодействие с пользователем, запустите операцию (`Activity`), которая наследует класс `BeforePositionsEditedEventActivity`:

```java
callback.startActivity(new Intent(MyIntegrationService.this, MainActivity.class));
```

Ваша операция должна вызвать метод `setIntegrationResult`.

Например:

```java
setIntegrationResult(new BeforePositionsEditedEventResult(BeforePositionsEditedEventResult.Result.OK, changes));
```

Класс `BeforePositionsEditedEventActivity` задан как:

```java
public class BeforePositionsEditedEventActivity extends IntegrationActivity {
    public void setIntegrationResult(BeforePositionsEditedEventResult result) {
        setIntegrationResult(result == null ? null : result.toBundle());
    }

    public BeforePositionsEditedEvent getEvent() {
        return BeforePositionsEditedEvent.create(getSourceBundle());
    }
}
```

#### Описание события `BeforePositionsEditedEvent`

О намерении изменения чека сообщает событие `beforePositionsEditedEvent`:

```java
public class BeforePositionsEditedEvent {
    private static final String TAG = "PositionsEditedEvent";

    public static final String NAME_SELL_RECEIPT = "evo.v2.receipt.sell.beforePositionsEdited";
    public static final String NAME_PAYBACK_RECEIPT = "evo.v2.receipt.payback.beforePositionsEdited";

    private static final String KEY_RECEIPT_UUID = "receiptUuid";
    private static final String KEY_CHANGES = "changes";


    private final String receiptUuid;
    private final List<IPositionChange> changes;

    public BeforePositionsEditedEvent(
            String receiptUuid,
            List<IPositionChange> changes
    ) {
        this.receiptUuid = receiptUuid;
        this.changes = changes;
    }

    public BeforePositionsEditedEvent(Bundle bundle) {
        this(
                bundle.getString(KEY_RECEIPT_UUID, null),
                Utils.filterByClass(
                        ChangesMapper.INSTANCE.create(bundle.getParcelableArray(KEY_CHANGES)),
                        IPositionChange.class
                )
        );
    }

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

    public String getReceiptUuid() {
        return receiptUuid;
    }

    public List<IPositionChange> getChanges() {
        return changes;
    }
}
```

#### Добавление, изменение и удаление позиций

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

Чтобы добавить позицию, используйте следующий метод:

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

#### Описание позиций

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
        ).build()
```

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
        ).build()positionFromProduct.subPosition.add(
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
