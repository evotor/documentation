---
title: Разделение чека
keywords: sample
summary: "Раздел содержит описание API, с помощью которого приложения могут разделить чек на несколько групп, например, для печати фискального и ЕНВД чека."
sidebar: evotordoc_sidebar
permalink: doc_receipt_division.html
tags: [Терминал, Java]
folder: evotordoc/smart_terminal_SDK
published: true
---

Схема разделения чека выглядит следующим образом:

![](./images/ReceiptDivision.png)


### Процесс разделения чека

1. Пользователь выбирает тип оплаты **Банковская карта**.
2. EvoPOS передаёт событие `PaymentSelectedEvent` и ожидает ответа от приложений.
3. Приложение возвращает результат `PaymentSelectedEventResult` с данными о соответствии сумм и их получателей. Данные описаны в классе `PaymentPurpose`.

    Перед тем как сопоставлять суммы и получателей, приложению требуется получить список получателей платежей, доступных на данном смарт-терминале. Список можно получить с помощью метода `getPaymentSystems`, класса `PaymentApi`. [Подробное описание метода](./doc_receipt_division.html#PaymentApiMethods).

4. На основе данных, полученных от приложения, EvoPOS совершает платёж  и передаёт событие `PrintGroupRequiredEvent`, после чего ожидает ответа от приложений.

5. Приложение возвращает результат `PrintGroupRequiredEventResult`, в котором, с помощью команды `SetPrintGroup`, задаёт *печатные группы*. Печатные группы содержат данные о соответствии позиций чека и получателей платежей.

    В результате приложение так же может записывать [дополнительные поля чека](./doc_receipt_extras.html). Используйте для этого команду `SetExtra`.

    Поля которые содержит печатная группа описаны в классе `PrintGroup`.

6. EvoPOS печатает чек в соответствии с полученными печатными группами.

### Методы Payment API {#PaymentApiMethods}

Используйте класс `PaymentApi`.

Получить список доступных на смарт-терминале получателей платежа:

```java
fun getPaymentSystems(context: Context): MutableList<Pair<PaymentSystem, MutableList<PaymentAccount>>>
```

Где:

* `context` – контекст приложения.
* `PaymentSystem` – возможный получатель платежа.
* `PaymentAccount` – уникальный счёт получателя платежа.
