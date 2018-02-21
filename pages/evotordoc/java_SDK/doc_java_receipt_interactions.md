---
title: Работа с позициями чека
keywords: позиция, чек, события, открыть, добавить, изменить
summary: Приложение может добавлять, удалять и изменять позиции в чеке. Если вы хотите работать с позициями в чеке используйте службу, чтобы получать события о намерении изменения чека. В этом случае, смарт-терминал ждёт ответа от приложения. События приходят как при продаже, так и при возврате товара.
sidebar: evotordoc_sidebar
permalink: doc_java_receipt_interactions.html
tags: [terminal, java, Receipts]
folder: java_SDK
---

## Использование службы и получение событий о намерении изменения чека

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

Где вместо null вы можете передать `new SetExtra(extra)`, команду для [создания дополнительных полей в чеке](./doc_java_receipt_extras.html).



### Описание события `BeforePositionsEditedEvent`

О намерении изменения чека сообщает событие [`beforePositionsEditedEvent`](https://github.com/evotor/integration-library/blob/master/app/src/main/java/ru/evotor/framework/core/action/event/receipt/before_positions_edited/BeforePositionsEditedEvent.java):

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

## Описание позиции {#Position}

Вы можете добавить в чек как позицию соответствующую товару в базе терминала, так и задать свободную позицию.

Конструкторы позиций описаны  в классе [`Position.java`](https://github.com/evotor/integration-library/blob/master/app/src/main/java/ru/evotor/framework/receipt/Position.java).

Пример конструктора позиции чека, соответствующей товару в терминале (у позиции есть `uuid` товара):

```java
public Position(
        String uuid,
        String productUuid,
        String productCode,
        ProductType productType,
        String name,
        String measureName,
        int measurePrecision,
        TaxNumber taxNumber,
        BigDecimal price,
        BigDecimal priceWithDiscountPosition,
        BigDecimal quantity,
        String barcode,
        String mark,
        BigDecimal alcoholByVolume,
        Long alcoholProductKindCode,
        BigDecimal tareVolume,
        Set<ExtraKey> extraKeys,
        List<Position> subPositions
)
```

Где:

* `uuid` – идентификатор позиции в формате uuid4.
* `productUuid` – идентификатор товара в формате uuid4, полученный из локальной базы товаров смарт-терминала.
* `productCode` – Код товара. Может быть `null`.
* `productType` – Вид товара.
* `name` – наименование товара из локальной базы товаров смарт-терминала.
* `measureName` – единицы измерения товара, полученные из локальной базы товаров смарт-терминала.
* `measurePrecision` – точность измерения единиц товара, выраженная в количестве знаков после запятой.
* `taxNumber` – налоговая ставка. Может быть `null`. Доступные значения описаны в классе [`TaxNumber.java`](https://github.com/evotor/integration-library/blob/master/app/src/main/java/ru/evotor/framework/receipt/TaxNumber.java). Если поле не задано, смарт-терминал обращается за налоговой ставкой в Облако. Если в Облаке нет информации о налоговой ставке для позиции, смарт-терминал использует значение, заданное в настройках.
* `price` – цена продукта, полученная из локальной базы товаров смарт-терминала.
* `priceWithDiscountPosition` – цена позиции с учётом скидки.
* `quantity` – количество добавленного товара.
* `barcode` – штрихкод, по которому найден товар. Может быть `null`.
* `mark` – алкогольная марка.
* `alcoholByVolume` – крепость алкогольной продукции. Может быть `null`.
* `alcoholProductKindCode` – код вида продукции ФСРАР. Может быть `null`.
* `tareVolume` – объём тары. Может быть `null`.
* `extraKeys` – дополнительные ключи (идентификаторы). Каждый ключ имеет описание (`description`), которое отображается в интерфейсе и печатается на чеке (можно передавать `null`), идентификатор (`identity`) и хранит данные о приложении, создавшем ключ (`appId`).

  {% include note.html content="Приложение записывает дополнительные ключи в чек только под своим идентификатором." %}

* `subPositions` – список подпозиций.

### Позиция с подпозицией

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

### Свободно заданная позиция

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

## Добавление, изменение и удаление позиций {#PositionAltering}

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
