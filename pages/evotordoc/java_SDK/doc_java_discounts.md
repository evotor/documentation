---
title: Скидки
keywords:
summary:
sidebar: evotordoc_sidebar
permalink: doc_java_discounts.html
tags: [Терминал, Java, Чеки]
folder: java_SDK
---

Вы можете добавлять скидку как на [каждую позицию отдельно](/doc_java_discounts.html#discountPosition), так и на весь чек.

### Скидка на чек

Приложение не может автоматически применять скидку, перед этим его требуется вручную вызвать с помощью [иконки на экране оплаты смарт-терминала](./doc_java_app_icon.html).

Для расчёта и назначения скидки:

1. Подпишитесь на событие `ReceiptDiscountEvent`.
2. Получите результат, который сообщает о возможности начисления скидки.

*Чтобы добавить скидку на весь чек:*

`ReceiptDiscountEvent`сообщает о возможности начислить скидку.

1. Подпишитесь на событие:

    1. Создайте службу, которая наследует класс `IntegrationService`, например `MyDiscountService`.
    2. Переопределите метод `createProcessors` службы `MyDiscountService` и создайте в нём процессор `ReceiptDiscountEventProcessor` .

       ```java
      public class MyDiscountService extends IntegrationService {
        @Nullable
        @Override
        protected Map<String, ActionProcessor> createProcessors() {
            Map<String, ActionProcessor> map = new HashMap<>();
            map.put(ReceiptDiscountEvent.NAME_SELL_RECEIPT, new ReceiptDiscountEventProcessor() {
                @Override
                public void call(@NonNull String action, @NonNull ReceiptDiscountEvent event, @NonNull Callback callback){

                }
            });
            return map;
        }
    }
       ```

       где:

       * `call` – метод получения событий и объектов.
       * `action` – действие при событии.
       * `event` –  событие.
       * `callback`– объект возврата результата.


    3. Объявите службу в манифесте приложения:

       ```xml
       <service
               android:name="MyDiscountService"
               android:enabled="true"
               android:exported="true">
               <intent-filter>
                   <action android:name="evo.v2.receipt.sell.receiptDiscount" />
               </intent-filter>
       </service>
       ```

2. Запросите результат `ReceiptDiscountEventResult`.

```java
try {callback.onResult(
  new ReceiptDiscountEventResult(
      discount,
      new SetExtra(extra),
      changes
))
    }
        catch (RemoteException exc) {
                exc.printStackTrace();
            }

```

Где:

* `discount` – значение скидки в валюте.
* `new SetExtra(extra)` – команда для [создания дополнительных полей в чеке](./doc_java_receipt_extras.html). Если дополнительные поля создавать не требуется вы можете передать `null`.
* `changes` – список изменений по позициям.

### Скидка на позицию {#discountPosition}

Чтобы добавить скидку на позицию, вам потребуется передать значение цены с учётом скидки в поле `priceWithDiscountPosition`. Если скидки на позицию нет, передавайте `null`. Список полей позиции описан в классе `position.java`.

Передать поле можно в любой момент, когда доступно редактирование существующих или добавление новых позиций в чек:

* [При создании чека в приложении](./doc_java_receipt_creation.html).
* [В списке изменений changes, при работе с чеком](./doc_java_receipt_interactions.html).
* В списке изменений по позициям (см. выше)
