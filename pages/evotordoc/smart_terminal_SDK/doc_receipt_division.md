---
title: Разделение чека
keywords: sample
summary: "Раздел содержит описание интерфейса, с помощью которого приложения могут делить чек на несколько платежей или на несколько чеков (печатных групп), например, для отдельной печати фискального и ЕНВД чека."
sidebar: evotordoc_sidebar
permalink: doc_receipt_division.html
tags: [Терминал, Java]
folder: evotordoc/smart_terminal_SDK
published: true
---

### Требования

Чтобы служба получала необходимые сообщения, в манифесте приложения требуется задать intent-filter соответствующей службе:

```xml
<action android:name="evo.v2.receipt.sell.payment.SELECTED" />
<action android:name="evo.v2.receipt.sell.printGroup.REQUIRED" />
```

### Разделение чека

Схема разделения чека выглядит следующим образом:

![](./images/ReceiptDivision.png)

1. Пользователь выбирает тип оплаты **Банковская карта**.
2. EvoPOS передаёт событие `PaymentSelectedEvent` и ожидает ответа от приложений.
3. Приложение может разделить чек на несколько платежей в счёт одного или нескольких юридических лиц. Данные о соответствии платежей и счетов приложение возвращает в результате `PaymentSelectedEventResult`. Данные описаны в классе `PaymentPurpose`.

    Чтобы получить список счетов, доступных на данном смарт-терминале, [воспользуйтесь методом](./doc_receipt_division.html#PaymentApiMethods) `getPaymentSystems`, класса `PaymentApi`.

    Используйте команду `SetExtra`, чтобы добавить к чеку [дополнительные поля](./doc_receipt_extras.html).

4. На основе данных, полученных от приложения, EvoPOS совершает платёж и начинает печать чека. При этом, EvoPOS передаёт событие `PrintGroupRequiredEvent` и ожидает ответа от приложений.

5. Приложение может напечатать несколько разных платежей в рамках одного чека или разделить платежи на несколько чеков. Данные о платежах и соответствующих чеках приложение передаёт в *печатных группах*. Приложение задаёт печатные группы с помощью команды `SetPrintGroup` и возвращает в результате `PrintGroupRequiredEventResult`.

    Используйте команду `SetExtra`, чтобы добавить к чеку [дополнительные поля](./doc_receipt_extras.html).

    Класс `PrintGroup` содержит описание полей, которые соответствуют печатной группе.

6. EvoPOS печатает чек в соответствии с полученными печатными группами.

### Методы Payment API {#PaymentApiMethods}

Используйте класс `PaymentApi`.

Получить список доступных на смарт-терминале получателей платежа:

```java
fun getPaymentSystems(context: Context): MutableList<Pair<PaymentSystem, MutableList<PaymentAccount>>>
```

Где:

* `context` – контекст приложения.
* `PaymentSystem` – тип платёжной системы. В данный момент, для разеделения чека доступен один тип – безналичный расчёт (`ELECTRON`). Содержит описание (`userDescription`) и тип оплаты (`paymentType`) в формате `string`. Оба атрибута могут принимать значение `null`.
* `PaymentAccount` – счёт получателя платежа. Содержит описание (`userDescription`) и идентификатор счёта (`accountId`) в формате `string`. Оба атрибута могут принимать значение `null`.

### Примеры

####Разделение чека на несколько печатных групп

```java
processorMap.put(
                PrintGroupRequiredEvent.NAME_SELL_RECEIPT,
                new PrintGroupRequiredEventProcessor() {
                    @Override
                    public void call(@NonNull String s, @NonNull PrintGroupRequiredEvent printGroupRequiredEvent, @NonNull Callback callback) {
                        List<SetPrintGroup> setPrintGroups = new ArrayList<SetPrintGroup>();
                        PrintGroup printGroup = new PrintGroup(
                                UUID.randomUUID().toString(),
                                PrintGroup.Type.INVOICE,
                                "ООО \"Р&К\"",
                                "098765432123",
                                "г. Москва, пл. Манежная 1",
                                TaxationSystem.PATENT
                        );
                        List<String> paymentPurposeIds = new ArrayList<String>();
                        paymentPurposeIds.add("-1-");
                        paymentPurposeIds.add("-3-");
                        List<String> positionUuids = new ArrayList<String>();
                        if (lastPosition != null) {
                            positionUuids.add(lastPosition.getUuid());
                        }
                        setPrintGroups.add(new SetPrintGroup(
                                printGroup,
                                paymentPurposeIds,
                                positionUuids
                        ));
                        try {
                            callback.onResult(
                                    new PrintGroupRequiredEventResult(
                                            null,
                                            setPrintGroups
                                    )
                            );
                        } catch (RemoteException exc) {
                            exc.printStackTrace();
                        }
                    }
                }
        );
```

#### Разделение платежей в чеке

```java
        processorMap.put(
                PaymentSelectedEvent.NAME_SELL_RECEIPT,
                new PaymentSelectedEventProcessor() {
                    @Override
                    public void call(@NonNull String s, @NonNull PaymentSelectedEvent
                            paymentSelectedEvent, @NonNull Callback callback) {
                        List<PaymentPurpose> paymentParts = new ArrayList<PaymentPurpose>();

                        paymentParts.add(new PaymentPurpose("-1-", new BigDecimal(3), "0", "платёж клиента 1"));
                        paymentParts.add(new PaymentPurpose("-2-", new BigDecimal(5), "0", "платёж клиента 2"));
                        paymentParts.add(new PaymentPurpose("-3-", new BigDecimal(2), "0", "платёж клиента 3"));
                        paymentParts.add(new PaymentPurpose("-4-", new BigDecimal(10), "0", "платёж клиента 4"));

                        try {
                            callback.onResult(
                                    new PaymentSelectedEventResult(
                                            null,
                                            paymentParts
                                    ).toBundle()
                            );
                        } catch (RemoteException exc) {
                            exc.printStackTrace();
                        }
                    }
                }
        );
```
