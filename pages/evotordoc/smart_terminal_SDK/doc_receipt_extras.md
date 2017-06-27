---
title: Создание дополнительных полей в чеке
keywords: sample
summary: Раздел содержит информацию о том, как и когда вы можете добавлять дополнительные поля в чеки.
sidebar: evotordoc_sidebar
permalink: doc_receipt_extras.html
tags: [Терминал, Java, Чеки]
folder: smart_terminal_SDK
---

Приложения могут записывать дополнительные данные в чеки, как продажи, так и возврата.

JSONObject object = new JSONObject();
                object.put("key", "value");
                SetExtra extra = new SetExtra(object);

Вы можете добавить дополнительные поля при открытии чека, применении скидки и изменении позиций в чеке.
