---
title: Товароучёт
keywords: sample
summary: "Раздел содержит описание Inventory API смарт-терминала."
sidebar: evotordoc_sidebar
permalink: doc_smart_terminal_inventory_api.html
tags: [Терминал, Java, Товары]
folder: smart_terminal_SDK
published: true
---

### Класс

Для работы используйте класс `InventoryApi`.

### Методы Inventory API

#### Получить все штрихкоды товара:

```java
fun getAllBarcodesForProduct(context: Context, productUuid: String): List<String>
```

Где:

* `context` – контекст приложения.
* `productUuid` – идентификатор товара в формате `uuid4`.
* `List<String>` – список всех штрихкодов товара.

#### Получить данные товара:

```java
fun getProductByUuid(context: Context, uuid: String): ProductItem?
```

Где:

* `context` – контекст приложения.
* `productUuid` – идентификатор товара в формате `uuid4`
* `ProductItem` – абстракция над товарами и товарными группами.

Поля, одинаковые для товара и группы:

* `uuid` – идентификатор товара или группы в формате `uuid4`.
* `parentUuid` – идентификатор родительской группы в формате `uuid4`.
* `code` – код товара из 1С, если нет, то null.
* `name` – наименование товара или группы.
* `taxNumber` – налоговая ставка.

Поля, уникальные для товаров:

* `type` – тип товара. Допустимые значения: NORMAL (обычный товар), ALCOHOL_MARKED (маркированный алкоголь) и ALKOHOL_NOT_MARKED (не маркированный алкоголь).
* `price` – цена товара.
* `quantity` – количество товара.
* `description` – описание товара.
* `measureName` – единицы измерения товара.
* `measurePrecision` – точность измерения.
* `alcoholByVolume` – крепость алкоголя. Если указан обычный товар, используется значение null.
* `alcoholProductKindCode` – идентификатор алкогольной продукции в формате uuid4.
* `tareVolume` – объём тары алкогольной продукции.

#### Получить возможные дополнительные поля:

```java
fun getField(context: Context, fieldUuid: String): Field?
```

Где:

* `context` - контекст приложения
* `productUuid` - uuid товара
* `Field` – результат. Может быть одного из двух типов: TextField и DictionaryField.

  Независимо от типа, содержит поля:
   `name` – имя поля.
   `fieldUUID` – идентификатор поля в формате `uuid4`.
   `title` – заголовок, который отображается в интерфейсе смарт-терминала.
   `type` – тип поля: TEXT_FIELD или DICTIONARY_FIELD.

   Поля, уникальные типа TEXT_FIELD:

   * `data` – Валидный JSON-объект, который содержит данные, отображаемые с помощью JavaScript в интерфейсе смарт-терминала.

   Поля, уникальные для типа DICTIONARY_FIELD:

   * `multiple` –	dключает или выключает возможность выбора нескольких значений.
   * `items` – массив возможных значений. Массив содержит поля `title` – заголовок элемента управления, который отображается пользоваетелю и `value` – идентификатор элемента управления.

#### Получить значения дополнительных полей товара:

```java
fun getProductExtras(context: Context, productUuid: String): List<ProductExtra>
```
Где:

* `context` - контекст приложения
* `productUuid` - uuid товара
* `List<ProductExtra>` – в качетсве результата будет возвращен список значений дополнительных полей товара

Объект `ProductExtra` содержит в себе следующие данные:

* `uuid` – uuid значения дополнительного поля товара.
* `name` – имя дополнительного поля товара.
* `fieldUUID` – uuid дополнительного поля товара.
* `fieldValue` – строка содержащая значение дополнительного поля в определенном формате:

    * для текстового поля – строка обрамленная кавычками ("785af1da-4053-4214-abd6-71c9cd4b5800").
    * для поля из словаря – массив uuid элементов (["61bff019-5040-40cd-bedf-d854ac935f6c","b993bd2a-8f6a-4fbc-b916-2d9786cd5def"]).

* `data` - дополнительные данные от приложения.
