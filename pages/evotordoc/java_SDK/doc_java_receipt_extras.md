---
title: Создание дополнительных полей в чеке
keywords:
summary: Раздел содержит информацию о том, как и когда вы можете добавлять дополнительные поля в чеки.
sidebar: evotordoc_sidebar
permalink: doc_java_receipt_extras.html
tags: [Терминал, Java]
folder: java_SDK
---

Приложения могут записывать дополнительные данные в чеки, как продажи, так и возврата.

Дополнительные данные должны представлять валидный JSON-объект:

```java
JSONObject object = new JSONObject();
                object.put("key", "value");
                SetExtra extra = new SetExtra(object);
```

Вы можете создавать дополнительные поля в чеках в следующих случаях:

* [при открытии чека](./doc_java_receipt_creation.html);
* [при применении скидки](./doc_java_discounts.html);
* [при изменении позиций в чеке](./doc_java_receipt_interactions.html).
