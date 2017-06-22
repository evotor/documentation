---
title: Скидки
keywords: sample
summary:
sidebar: evotordoc_sidebar
permalink: doc_discounts.html
tags: [Терминал, Java, Чеки]
folder: smart_terminal_SDK
---

### Скидки

Эвотор позволяет рассчитывать и передавать скидки.
Для этого:
1. Подпишитесь на событие `ReceiptDiscountEvent`.
2. Получите результат, которое сообщает о возможности начисления скидки.

#### Подписка на событие

`ReceiptDiscountEvent`сообщает о возможности начислить скидку.

1. Создайте службу, которая наследует класс `IntegrationService`, например `MyDiscountService`.
2. Зарегистрируйте процессор `ReceiptDiscountEventProcessor` в методе `onCreate` службы `MyDiscountService`.

   ```java
   public class MyDiscountService extends IntegrationService {

       @Override
       public void onCreate() {
           super.onCreate();

           registerProcessor(
                   new ReceiptDiscountEventProcessor() {
                       @Override
                       public void call(ReceiptDiscountEvent positionsDiscountEvent, Callback callback) {

                       }
                   });
       }
   }
   ```

где:
`call` - метод получения событий и объектов.
`positionsDiscountEvent` -  событие N. //уточнить
`callback`- объект возврата результата.


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



#### Получение результата

Запрашиваем результат `ReceiptDiscountEventResult` и //BigDecimal уточнить

```java
try {callback.onResult(
        new ReceiptDiscountEventResult(
        ReceiptDiscountEventResult.Result.OK,
        new BigDecimal(0.5)
        ).toBundle())
    }
        catch (RemoteException exc) {
                exc.printStackTrace();
            }

```
