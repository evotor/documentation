---
title: Поиск товара по штрихкоду
keywords:
summary: "Раздел содержит описание Receipt API смарт-терминала."
sidebar: evotordoc_sidebar
permalink: doc_java_receipt_api.html
tags: [Java, Терминал, Чеки]
folder: java_SDK
---

### Класс

Для работы используйте класс `ReceiptApi`.

### Методы

#### Получить по штрихкоду позицию для добавления в чек:

```java
fun getPositionsByBarcode(context: Context, barcode: String): List<Position>
```

Где:

* `context` – контекст приложения.
* `barcode` – штрихкод товара.
* `List<Position>` – список позиций
