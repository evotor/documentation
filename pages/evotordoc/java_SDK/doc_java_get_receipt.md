---
title: Получить данные сформированного чека
keywords:
summary: "Раздел содержит описание интерфейса, с помощью которого можно получить данные сформированного чека."
sidebar: evotordoc_sidebar
permalink: doc_java_get_receipt.html
tags: [Терминал, Java]
folder: java_SDK
---

### Класс

Для работы используйте класс `ReceiptApi`.

### Методы

#### Получить текущий открытый чек

```java
fun getReceipt(context: Context, type: Receipt.Type): Receipt?
```

Где:

* `context` – контекст приложения.
* `type` – тип чека: продажи (`SELL`) или возврата (`PAYBACK`).
* `Receipt` – текущий открытый чек.

Метод возвращает чек или `null`, если чек отсутствует.

#### Получить чек по идентификатору

```java
fun getReceipt(context: Context, uuid: String): Receipt?
```

Где:

* `context` – контекст приложения.
* `uuid` – идентификатор чека в формате `uuid4`.
* `Receipt` – чек.

Метод возвращает чек или `null`, если чек отсутствует.

#### Получить список заголовков чека

```java
fun getReceiptHeaders(context: Context, type: Receipt.Type? = null): ru.evotor.framework.Cursor<Receipt.Header?>?
```

Где:

* `context` – контекст приложения.
* `type` – тип чека: продажи (`SELL`) или возврата (`PAYBACK`).
* `ru.evotor.framework.Cursor<Receipt.Header?>` – курсор с заголовками чека.

### Пример

Получить список позиций открытого чека:

``` java
List<Position> positions = ReceiptApi.getReceipt(context, Receipt.Type.SELL).getPositions();
```
