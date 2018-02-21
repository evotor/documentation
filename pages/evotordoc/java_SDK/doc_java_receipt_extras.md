---
title: Создание дополнительных полей в чеке
keywords: чеки, extras, дополнительные
summary: Раздел содержит информацию о том, как и когда вы можете добавлять дополнительные поля в чеки.
sidebar: evotordoc_sidebar
permalink: doc_java_receipt_extras.html
tags: [terminal, java, receipts]
folder: java_SDK
---

Приложения могут записывать дополнительные поля в чеки продажи и возврата.

Дополнительные поля помогут вам хранить и отображать информацию, которая не предусмотрена стандартной моделью чека [продажи](https://github.com/evotor/documentation-api/blob/master/pos-docs/02-SELL.json) или [возврата](https://github.com/evotor/documentation-api/blob/master/pos-docs/03-PAYBACK.json).

Например, системы лояльности могут хранить в дополнительных полях информацию о карте лояльности пользователя.

Дополнительные поля должны представлять валидный JSON-объект:

```java
JSONObject object = new JSONObject();
                object.put("key", "value");
                SetExtra extra = new SetExtra(object);
```

Вы можете создавать дополнительные поля в чеках в следующих случаях:

* [при открытии чека](./doc_java_receipt_creation.html);
* [при применении скидки](./doc_java_discounts.html);
* [при изменении позиций в чеке](./doc_java_receipt_interactions.html).
