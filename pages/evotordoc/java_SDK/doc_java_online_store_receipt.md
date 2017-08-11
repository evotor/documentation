---
title: Передача чеков на email и номер телефона
keywords:
summary:
sidebar: evotordoc_sidebar
permalink: doc_online_store_receipt.html
tags: [Терминал, Java]
folder: java_SDK
---

Приложение может создавать чеки и передавать их для оформления в смарт-терминал. Созданные чеки смарт-терминал может автоматически передавать созданные чеки на указанный адрес электронной почты (email) и / или номер телефона. Передача чеков актуальна, например, для интернет-магазинов.

С помощью отдельной [команды](./doc_app_integration_points.html#Commands) приложение может напечатать созданный чек.

### Передача чека на email и номер телефона

Смарт-терминал передаёт чеки если указан email и / или номер телефона. Касса не печатает чек, если указаны поля email и / или номер телефона.

{% include note.html content="Только кассы нового образца могут не печатать чеки. Кассы старого образца печатают чек независимо от того указан email или номер телефона." %}

Чтобы передавать чек на email и номер телефона:

1. В [манифесте приложения](./doc_java_app_manifest.html) укажите права для приложения:

   ```xml
   <uses-permission android:name="ru.evotor.permission.receipt.print.INTERNET_RECEIPT" />
   ```

2. Составьте список позиций, который требуется добавить в чек, наполните список

   ```java
   public void openReceipt() {
           List<PositionAdd> positionAddList = new ArrayList<>();

           JSONObject extra = new JSONObject();
   ```

   Где:

   `List<PositionAdd> positionAddList = new ArrayList<>()`– список позиций. Как добавить позицию в чек смотрите в разделе [Добавление, изменение и удаление позиций](doc_java_receipt_interactions.html#PositionAltering).

   `JSONObject extra = new JSONObject();`– добавляет дополнительные данные к чеку. Данные доступны только вашему приложению. Не создавайте этот объект, если приложение не добавляет дополнительные поля к чеку.

3. Укажите способ оплаты:

   ```java
   List<Payment> payments = new ArrayList<>();
   Payment payment = new Payment(
           UUID.randomUUID().toString(),
           new BigDecimal(9000),
           new PaymentSystem(PaymentType.ELECTRON, "Card", "Cashless"),
           null,
           null,
           null
   );
   ```

   Где:

   * `PaymentType` – задаёт [способ оплаты](https://github.com/evotor/integration-library/blob/develop/app/src/main/java/ru/evotor/framework/payment/PaymentType.java).

4. Создайте команду для передачи чека и вызовите метод `.process`:

   ```java
   PrintSellReceiptCommand command = new PrintSellReceiptCommand(positions, payments, null, "example@example.com");
   command.process(MainActivity.this, new IntegrationManagerCallback() {
       @Override
       public void run(IntegrationManagerFuture future) {
           IntegrationManagerFuture.Result result = null;
           try {
               result = future.getResult();
               switch (result.getType()) {
                   case OK:
                       PrintReceiptCommandResult printSellReceiptResult = PrintReceiptCommandResult.create(result.getData());
                       Toast.makeText(MainActivity.this, "OK", Toast.LENGTH_LONG).show();
                       break;
                   case ERROR:
                       Error error = result.getError();
                       Toast.makeText(MainActivity.this, error.getMessage(), Toast.LENGTH_LONG).show();
                       break;
               }
           } catch (IntegrationException e) {
               e.printStackTrace();
           }
       }
   });
   ```

    Где:

    * `positions` – список позиций чека.
    * `payments` – информация о способе оплаты.
    * `clientPhone` – номер телефона клиента в формате строки. Может быть `null`. Смарт-терминал передаёт чек на указанный номер телефона.
    * `clientEmail` – email клиента в формате строки. Может быть `null`. Смарт-терминал передаёт чек на указанный адрес электронной почты.

    {% include note.html content="Если поля `clientPhone` и `clientEmail` не указаны, смарт-терминал печатает чек и не передаёт его." %}


### Пример

Существует также более детальный способ создания и передачи чека:

```java
List<Position> list = new ArrayList<>();
list.add(
        Position.Builder.newInstance(
                UUID.randomUUID().toString(),
                null,
                "1234",
                "12",
                0,
                new BigDecimal(1000),
                BigDecimal.TEN
        ).build()
);
list.add(
        Position.Builder.newInstance(
                UUID.randomUUID().toString(),
                null,
                "1234",
                "12",
                0,
                new BigDecimal(500),
                BigDecimal.ONE
        ).setPriceWithDiscountPosition(new BigDecimal(300)).build()
);
final Receipt.PrintReceipt printReceipt = new Receipt.PrintReceipt(
        null,
        list,
        new HashMap<Payment, BigDecimal>() {{
            put(new Payment(
                    UUID.randomUUID().toString(),
                    new BigDecimal(9300),
                    new PaymentSystem(PaymentType.ELECTRON, "Internet", "12424"),
                    null,
                    null,
                    null
            ), new BigDecimal(9300));
        }},
        new HashMap<Payment, BigDecimal>()
);

ArrayList<Receipt.PrintReceipt> listDocs = new ArrayList<>();
listDocs.add(printReceipt);
BigDecimal receiptDiscount = new BigDecimal(1000);
new PrintSellReceiptCommand(listDocs, null, null, "example@example.com", receiptDiscount).process(MainActivity.this, new IntegrationManagerCallback() {
    @Override
    public void run(IntegrationManagerFuture integrationManagerFuture) {
        try {
            IntegrationManagerFuture.Result result = integrationManagerFuture.getResult();
            if (result.getType() == IntegrationManagerFuture.Result.Type.OK) {
                Toast.makeText(MainActivity.this, "Result OK", Toast.LENGTH_SHORT).show();
            }
        } catch (IntegrationException e) {
            e.printStackTrace();
        }
    }
});
```