---
title: Разделение чека
keywords:
summary: "Раздел содержит описание интерфейса, с помощью которого приложения могут делить чек на несколько платежей или на несколько чеков (печатных групп), например, для отдельной печати фискального и ЕНВД чека."
sidebar: evotordoc_sidebar
permalink: doc_java_receipt_division.html
tags: [Терминал, Java]
folder: java_SDK
---

### Требования

Чтобы служба получала необходимые сообщения, в манифесте приложения требуется задать intent-filter соответствующей службе:

```xml
<action android:name="evo.v2.receipt.sell.payment.SELECTED" />
<action android:name="evo.v2.receipt.sell.printGroup.REQUIRED" />
```

Где:

* `evo.v2.receipt.sell.payment.SELECTED` – сообщает о разделении платежей.
* `evo.v2.receipt.sell.printGroup.REQUIRED` – сообщает о разделении чека на несколько печатных групп.

### Разделение чека

Схема разделения чека выглядит следующим образом:

![](./images/ReceiptDivision.png)

Процесс разделения чека:

1. Пользователь выбирает тип оплаты **Банковская карта**.
2. Смарт-терминал передаёт событие `PaymentSelectedEvent` и ожидает ответа от приложений.

    {% include note.html content="Событие возникает только если пользователь выбрал безналичный расчёт." %}

3. [Приложение может разделить чек на несколько платежей](./doc_receipt_division.html#severalPayments) в счёт одного или нескольких юридических лиц.

    Приложение возвращает данные о соответствии счетов и платежей в объекте `PaymentSelectedEventResult` и указывает разделение платежей в объекте `PaymentPurpose`.

    Каждый из платежей, указанных в `PaymentPurpose` содержит:

    * собственный идентификатор объекта PaymentPurpose, который можно использовать для сопоставления платежа и печатной группы;
    * сумму платежа;
    * идентификаторы платёжной системы и счёта в ней;
    * текст, который отображается пользователю при проведении данного платежа.

    В данный момент поддерживается разделение только в рамках той системы оплаты, которую выбрал пользователь. Разделение на различные системы оплаты (комбинированная оплата) не поддерживается.

    Чтобы получить список счетов, доступных на данном смарт-терминале, [воспользуйтесь методом](./doc_receipt_division.html#PaymentSystemApiMethods) `getPaymentSystems`, класса `PaymentSystemApi`.

    Используйте команду `SetExtra`, чтобы добавить к чеку [дополнительные поля](./doc_java_receipt_extras.html).

4. На основе данных, полученных от приложения, смарт-терминал совершает платежи и начинает печать чека. Перед печатью чека EvoPOS передаёт событие `PrintGroupRequiredEvent` и ожидает ответа от приложений.

5. [Приложение может напечатать несколько разных печатных документов](./doc_receipt_division.html#severalPintGroups) и разделить платежи на между ними.

    Приложение передаёт данные о печатных документах, закреплённых за ними позициях и соответствующих платежах в объекте `PrintGroupRequiredEventResult`, которому соответствует список объектов `SetPrintGroup`.

    Для каждого объекта `SetPrintGroup` приложение указывает:

    * печатную группу (`PrintGroup`);
    * список идентификаторов платежей (`paymentPurposeIds`);
    * список иденификаторов позиций в формате uuid4 (`positionUuids`)

    В печатной группе приложение указывает:

    * идентификатор печатной группы;
    * тип чека (фискальный, ЕНВД, квитанция);

      И квитанция и ЕНВД чек задаются в виде строк, в отличие от фискального чека, который набирается с помощью команд ККМ. ЕНВД чек отличается от квитанции тем, что квитанция не содержит информации о способе оплаты и на распечатанном чеке явно указывается, что это квитанция.

    * систему налогообложения;
    * реквизиты организации (название, ИНН, адрес).

    Используйте команду `SetExtra`, чтобы добавить к чеку [дополнительные поля](./doc_java_receipt_extras.html).

6. EvoPOS печатает чек в соответствии с полученными печатными группами.

### Методы PaymentSystem API {#PaymentSystemApiMethods}

Используйте класс `PaymentSystemApi`.

Получить список платёжных систем, а также их учётных записей, доступных на смарт-терминале:

```java
fun getPaymentSystems(context: Context): List<Pair<PaymentSystem, List<PaymentAccount>>>
```

Метод возвращает список доступных на терминале платёжных систем (`PaymentSystem`) и соответствующих им счетов (`PaymentAccount`). Счета можно получить у приложений, которые реализуют различные способы оплаты.

Объекты `PaymentSystem` содержат:

* тип платёжной системы (наличные, электронные платежи, другие);
* название, которое можно отобразить пользователю;
* постоянный идентификатор платёжной системы в терминале.

Объекты `PaymentAccount` содержат:

* идентификатор счёта в рамках платёжной системы;
* название счёта, которое можно отобразить пользователю.

### Примеры

#### Разделение платежей в чеке {#severalPayments}

```java
        processorMap.put(
                PaymentSelectedEvent.NAME_SELL_RECEIPT,
                new PaymentSelectedEventProcessor() {
                    @Override
                    public void call(@NonNull String s, @NonNull PaymentSelectedEvent
                            paymentSelectedEvent, @NonNull Callback callback) {
                        List<PaymentPurpose> paymentParts = new ArrayList<PaymentPurpose>();
                        String psId = paymentSelectedEvent.getPaymentSystem().getPaymentSystemId();
                        paymentParts.add(new PaymentPurpose("-1-", psId, new BigDecimal(3), "0", "платёж клиента 1"));
                        paymentParts.add(new PaymentPurpose("-2-", psId, new BigDecimal(5), "0", "платёж клиента 2"));
                        paymentParts.add(new PaymentPurpose("-3-", psId, new BigDecimal(2), "0", "платёж клиента 3"));
                        paymentParts.add(new PaymentPurpose("-4-", psId, new BigDecimal(10), "0", "платёж клиента 4"));

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

#### Разделение чека на несколько печатных групп {#severalPrintGroups}

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
                                "ООО \"Пример\"",
                                "012345678901",
                                "г. Москва",
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
