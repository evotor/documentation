---
title: Получить данные сформированного чека
keywords: чек, методы, интерфейс, заголовки, ReceiptApi, штрихкод, позиция, платеж
summary: "Раздел содержит описание методов интерфейса, с помощью которого можно получить данные сформированного чека."
sidebar: evotordoc_sidebar
permalink: doc_java_get_receipt.html
tags: [terminal, java, receipts]
folder: java_SDK
---
## Методы

Классы [`ReceiptApi`](https://github.com/evotor/integration-library/blob/master/app/src/main/java/ru/evotor/framework/receipt/ReceiptApi.kt) и [`Receipt`](https://github.com/evotor/integration-library/blob/master/app/src/main/java/ru/evotor/framework/receipt/Receipt.kt) содержат описанные ниже методы.

### Получить текущий открытый чек

```java
fun getReceipt(context: Context, type: Receipt.Type): Receipt?
```

Где:

* `context` – контекст приложения.
* `type` – тип чека: продажи (`SELL`) или возврата (`PAYBACK`).
* `Receipt` – текущий открытый чек.

Метод возвращает чек или `null`, если чек закрыт.

### Получить чек по идентификатору

```java
fun getReceipt(context: Context, uuid: String): Receipt?
```

Где:

* `context` – контекст приложения.
* `uuid` – идентификатор чека в формате `uuid4`.
* `Receipt` – чек.

Метод возвращает чек или `null`, если чек не найден.

### Получить по штрихкоду позицию для добавления в чек:

```java
fun getPositionsByBarcode(context: Context, barcode: String): List<Position>
```

Где:

* `context` – контекст приложения.
* `barcode` – штрихкод товара.
* `List<Position>` – список позиций

### Получить позиции чека

```java
fun getPositions(): List<Position> {
    return printDocuments
            .flatMap { it.positions }
            .toList()
}
```

Где:

* `List<Position>` – список позиций чека

### Получить список платежей чека

```java
fun getPayments(): List<Payment> {
    return printDocuments
            .map { it.payments }
            .flatMap { it.keys }
            .distinct()
}
```

Где:

* `List<Payment>` – список платежей чека

### Получить список заголовков чека

```java
fun getReceiptHeaders(context: Context, type: Receipt.Type? = null): ru.evotor.framework.Cursor<Receipt.Header?>?
```

Где:

* `context` – контекст приложения.
* `type` – тип чека: продажи (`SELL`) или возврата (`PAYBACK`).
* `ru.evotor.framework.Cursor<Receipt.Header?>` – курсор с заголовками чека.

Метод возвращает заголовки созданных чеков, которые хранятся на терминале.

## Пример

Получить список позиций открытого чека:

``` java
List<Position> positions = ReceiptApi.getReceipt(context, Receipt.Type.SELL).getPositions();
```
