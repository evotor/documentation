---
title: Открытие чека в приложении
keywords:
summary: Раздел содержит информацию о том, как приложение может передать сформированный чек в смарт-терминал для оплаты.
sidebar: evotordoc_sidebar
permalink: doc_java_receipt_creation.html
tags: [Терминал, Java, Чеки]
folder: smart_terminal_SDK
---

Чтобы открыть чек в смарт-терминале:

1. Составьте список позиций, который требуется добавить в чек, наполните список

   ```java
   public void openReceipt() {
           List<PositionAdd> positionAddList = new ArrayList<>();

           JSONObject extra = new JSONObject();
   ```

   Где:

   `List<PositionAdd> positionAddList = new ArrayList<>()`– список позиций. Как добавить позицию в чек смотрите в разделе [Добавление, изменение и удаление позиций](doc_java_receipt_interactions.html#PositionAltering).

   `JSONObject extra = new JSONObject();`– добавляет дополнительные данные к чеку. Данные доступны только вашему приложению. Не создавайте этот объект, если приложение не добавляет дополнительные поля к чеку.

2. Создайте команду открытия чека и вызовите метод `.process`

   ```java
   new OpenSellReceiptCommand(positionAddList, null).process(
                           activity,
                           new IntegrationManagerCallback() {
                               @Override
                               public void run(IntegrationManagerFuture integrationManagerFuture) {
                                   try {
                                       IntegrationManagerFuture.Result result = integrationManagerFuture.getResult();
                                       if (result.getType() == IntegrationManagerFuture.Result.Type.OK) {
                                           startActivity(new Intent("evotor.intent.action.payment.SELL"));
                                       }
                                   } catch (IOException e) {
                                       e.printStackTrace();
                                   } catch (IntegrationException e) {
                                       e.printStackTrace();
                                   }
                               }
                           });
   ```

   Где вместо null вы можете передать `new SetExtra(extra)`, команду для [создания дополнительных полей в чеке](./doc_java_receipt_extras.html).

   {% include note.html content="При создании нового чека, происходит автоматическая очистка существующего открытого чека." %}
