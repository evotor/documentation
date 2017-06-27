---
title: Inventory API
keywords: sample
summary: "Раздел содержит описание Inventory API смарт-терминала."
sidebar: evotordoc_sidebar
permalink: doc_smart_terminal_inventory_api.html
tags: [Терминал, Java, Товары]
folder: smart_terminal_SDK
published: true
---

### Inventory API смарт-терминала

С помощью Inventory API вы можете получать как основную, так и дополнительную информацию о товарах, в том числе список всех штрихкодов товара.

Inventory API смарт-терминала включает в себя:

* URI контента `val BASE_URI = Uri.parse("content://ru.evotor.evotorpos.inventory")`:

    Данные хранятся локально и синхронизируются с облаком Эвотор каждые четыре часа.

* Таблицу данных товара `ProductTable`:

  ```java
  object ProductTable {
      val URI = Uri.withAppendedPath(InventoryApi.BASE_URI, "Commodity")

      const val ROW_UUID = "UUID"
      const val ROW_CODE = "CODE"
      const val ROW_TYPE = "TYPE"
      const val ROW_PARENT_UUID = "PARENT_UUID"
      const val ROW_IS_GROUP = "IS_GROUP"
      const val ROW_NAME = "NAME"
      const val ROW_DESCRIPTION = "DESCRIPTION"
      const val ROW_PRICE_OUT = "PRICE_OUT"
      const val ROW_QUANTITY = "QUANTITY"
      const val ROW_MEASURE_NAME = "MEASURE_NAME"
      const val ROW_MEASURE_PRECISION = "MEASURE_PRECISION"
      const val ROW_ALCOHOL_BY_VOLUME = "ALCOHOL_BY_VOLUME"
      const val ROW_ALCOHOL_PRODUCT_KIND_CODE = "ALCOHOL_PRODUCT_KIND_CODE"
      const val ROW_TARE_VOLUME = "TARE_VOLUME"
      const val ROW_TAX_NUMBER = "TAX_NUMBER"
  }
  ```

* Таблицу дополнительных полей `ProductsFieldTable`:

  ```java
  object FieldTable {
      val URI = Uri.withAppendedPath(InventoryApi.BASE_URI, "Field")

      const val ROW_NAME = "NAME"
      const val ROW_FIELD_UUID = "FIELD_UUID"
      const val ROW_TITLE = "TITLE"
      const val ROW_TYPE = "TYPE"
      const val ROW_SPECIFIC_DATA = "SPECIFIC_DATA"

      const val TYPE_TEXT_FIELD = 1
      const val TYPE_DICTIONARY = 2
  }
  ```

* Таблицу значений дополнительных полей товаров `ProductsExtraTable`:

  ```java
  object ProductExtraTable {
      @JvmField val URI = Uri.withAppendedPath(InventoryApi.BASE_URI, "CommodityExtra")

      const val ROW_UUID = "UUID"
      const val ROW_NAME = "NAME"
      const val ROW_PRODUCT_UUID = "COMMODITY_UUID"
      const val ROW_FIELD_UUID = "FIELD_UUID"
      const val ROW_FIELD_VALUE = "FIELD_VALUE"
      const val ROW_DATA = "DATA"
  }
  ```

Схема отношения данных в таблицах.

![](images/TablesInventoryAPI.png "Схема отношения данных")

### Примеры запросов к Inventory API

Получить все штрихкоды товара:

```java
fun getAllBarcodesForProduct(context: Context, productUuid: String): List<String>
```

Получить данные товара:


```java
fun getProductByUuid(context: Context, uuid: String): ProductItem?
```

Где ProductItem – абстракция над товарами и товарными группами.

товар и группа имеют одинаковые поля

uuid: String,
parentUuid: String?,
code: String?, – код товара из 1С, если нет, то null
name: String – наименование товара или группы
taxNumber – налоговая ставка



Поля специфические товаров:


            val type: ProductType, – тип товара: NORMAL, ALCOHOL_MARKED, ALKOHOL_NOT_MARKED.
            val price: BigDecimal, цена
            val quantity: BigDecimal, количество
            val description: String?, описание
            val measureName: String, единицы измерения
            val measurePrecision: Int, точность измерения
            val alcoholByVolume: BigDecimal?, крепость алкоголя, если не алкоголь то налл
            val alcoholProductKindCode: Long?, код юида алкогольной продкуции
            val tareVolume: BigDecimal? объём тары


Получить возможные дополнительные поля:

```java
fun getField(context: Context, fieldUuid: String): Field?
```
де context - контекст приложения
productUuid - uuid товара
в качетсве результата будет возвращен объект Field, который может быть двух типов TextField и DictionaryField.
Они имеют общие поля:
val name: String?, – имя полня
 val fieldUUID: String, – идентификатор поля в
 val title: String?, – заголовок, который отображается в интерфейсе смарт-терминала
 val type: Type – тип поля: TEXT_FIELD или DICTIONARY_FIELD.

Поля специфические для TEXT_FIELD:
* data – Валидный JSON-объект, который содержит данные, отображаемые с помощью JavaScript в интерфейсе смарт-терминала.

Поля специфические для DICTIONARY_FIELD:
multiple	Включает или выключает возможность выбора нескольких значений
items массив возможных значений: title (заголовок элемента управления, который отображается пользоваетелю), value (идентификатор элемента управления).




Получить значения дополнительных полей товара:

```java
fun getProductExtras(context: Context, productUuid: String): List<ProductExtra>
```
где context - контекст приложения
productUuid - uuid товара
в качетсве результата будет возвращен список значений дополнительных полей товара

объект ProductExtra содержит в себе следующие данные:
uuid - uuid значения дополнительного поля товара
name - имя дополнительного поля товара
fieldUUID - uuid дополнительного поля товара
fieldValue - строка содержащая значение дополнительного поля в определенном формате:
  для текстового поля - строка обрамленная кавычками ("785af1da-4053-4214-abd6-71c9cd4b5800")
  для поля из словаря - массив uuid элементов (["61bff019-5040-40cd-bedf-d854ac935f6c","b993bd2a-8f6a-4fbc-b916-2d9786cd5def"])
 data - дополнительные данные от интеграции
)
