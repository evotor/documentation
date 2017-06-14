---
title: Inventory API
keywords: sample
summary: "Раздел содержит описание Inventory API смарт-терминала."
sidebar: evotordoc_sidebar
permalink: doc_smart_terminal_inventory_api.html
folder: smart_terminal_SDK
published: true
---

### Inventory API смарт-терминала

С помощью Inventory API вы можете получать как основную, так и дополнительную информацию о товарах, в том числе список всех штрихкодов товара.

Inventory API смарт-терминала включает в себя:

* URI контента `val BASE_URI = Uri.parse("content://ru.evotor.evotorpos.inventory")`:

    Данные хранятся локально и синхронизируются с облаком Эвотор каждые четыре часа.

* Таблицу данных товара `ProductTable`:

    {% highlight java %}
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
    {% endhighlight %}

* Таблицу дополнительных полей `ProductsFieldTable`:

    {% highlight java %}
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
    {% endhighlight %}

* Таблицу значений дополнительных полей товаров `ProductsExtraTable`:

    {% highlight java %}
    object ProductExtraTable {
        @JvmField val URI = Uri.withAppendedPath(InventoryApi.BASE_URI, "CommodityExtra")

        const val ROW_UUID = "UUID"
        const val ROW_NAME = "NAME"
        const val ROW_PRODUCT_UUID = "COMMODITY_UUID"
        const val ROW_FIELD_UUID = "FIELD_UUID"
        const val ROW_FIELD_VALUE = "FIELD_VALUE"
        const val ROW_DATA = "DATA"
    }
    {% endhighlight %}

Схема отношения данных в таблицах.

![](images/TablesInventoryAPI.png "Схема отношения данных")

### Примеры запросов к Inventory API

Получить все штрихкоды товара:

{% highlight java %}
fun getAllBarcodesForProduct(context: Context, productUuid: String): List<String> {
    val barcodesList = ArrayList<String>()
    val cursor: Cursor? = context.contentResolver.query(
            Uri.withAppendedPath(BarcodeTable.URI, productUuid),
            null, null, null, null)
    if (cursor != null) {
        if (cursor.moveToFirst()) {
            do {
                val barcode: String = cursor.getString(cursor.getColumnIndex(BarcodeTable.ROW_BARCODE))
                barcodesList.add(barcode)
            } while (cursor.moveToNext())
        }
    }
    return barcodesList
}
{% endhighlight %}

Получить данные товара:


{% highlight java %}
fun getProductByUuid(context: Context, uuid: String): ProductItem? {
  context.contentResolver
      .query(Uri.withAppendedPath(ProductTable.URI, uuid), null, null, null, null)
          ?.let { cursor ->
              try {
                  if (cursor.moveToFirst()) {
                      if (cursor.getInt(cursor.getColumnIndex(ProductTable.ROW_IS_GROUP)) > 0) {
                          return ProductItem.ProductGroup(
                              uuid = cursor.getString(cursor.getColumnIndex(ProductTable.ROW_UUID)),
                                  parentUuid = cursor.getString(cursor.getColumnIndex(ProductTable.ROW_PARENT_UUID)),
                                  code = cursor.getString(cursor.getColumnIndex(ProductTable.ROW_CODE)),
                                  name = cursor.getString(cursor.getColumnIndex(ProductTable.ROW_NAME)),
                                  taxNumber = Utils.safeValueOf(TaxNumber::class.java, cursor.getString(cursor.getColumnIndex(ProductTable.ROW_TAX_NUMBER)), TaxNumber.NO_VAT)
                          )
                      } else {
                          return ProductItem.Product(
                              uuid = cursor.getString(cursor.getColumnIndex(ProductTable.ROW_UUID)),
                                  parentUuid = cursor.getString(cursor.getColumnIndex(ProductTable.ROW_PARENT_UUID)),
                                  code = cursor.getString(cursor.getColumnIndex(ProductTable.ROW_CODE)),
                                  type = Utils.safeValueOf(ProductType::class.java, cursor.getString(cursor.getColumnIndex(ProductTable.ROW_TYPE)), ProductType.NORMAL),
                                  name = cursor.getString(cursor.getColumnIndex(ProductTable.ROW_NAME)),
                                  description = cursor.getString(cursor.getColumnIndex(ProductTable.ROW_DESCRIPTION)),
                                  price = BigDecimal(cursor.getLong(cursor.getColumnIndex(ProductTable.ROW_PRICE_OUT))).divide(BigDecimal(100)),
                                  quantity = BigDecimal(cursor.getLong(cursor.getColumnIndex(ProductTable.ROW_QUANTITY))).divide(BigDecimal(1000)),
                                  measureName = cursor.getString(cursor.getColumnIndex(ProductTable.ROW_MEASURE_NAME)),
                                  measurePrecision = cursor.getInt(cursor.getColumnIndex(ProductTable.ROW_MEASURE_PRECISION)),
                                  alcoholByVolume = cursor.getLong(cursor.getColumnIndex(ProductTable.ROW_ALCOHOL_BY_VOLUME)).let { BigDecimal(it).divide(BigDecimal(1000)) },
                                  alcoholProductKindCode = cursor.getLong(cursor.getColumnIndex(ProductTable.ROW_ALCOHOL_PRODUCT_KIND_CODE)),
                                  tareVolume = cursor.getLong(cursor.getColumnIndex(ProductTable.ROW_TARE_VOLUME)).let { BigDecimal(it).divide(BigDecimal(1000)) },
                                  taxNumber = Utils.safeValueOf(TaxNumber::class.java, cursor.getString(cursor.getColumnIndex(ProductTable.ROW_TAX_NUMBER)), TaxNumber.NO_VAT)
                          )
                      }
                  }
              } catch (e: Exception) {
                  e.printStackTrace()
              } finally {
                  cursor.close()
              }
          }
  return null
}
{% endhighlight %}

Получить возможные дополнительные поля:

{% highlight java %}
fun getField(context: Context, fieldUuid: String): Field? {
    context.contentResolver
            .query(FieldTable.URI, null, "${FieldTable.ROW_FIELD_UUID} = ?", arrayOf(fieldUuid), null)
            ?.let { cursor ->
                try {
                    if (cursor.moveToFirst()) {
                        return createField(cursor)
                    } else {
                        return null
                    }
                } catch (e: Exception) {
                    e.printStackTrace()
                } finally {
                    cursor.close()
                }
            }

    return null
}
{% endhighlight %}

Получить значения дополнительных полей товара:

{% highlight java %}
fun getProductExtras(context: Context, productUuid: String): List<ProductExtra> {
    val result = ArrayList<ProductExtra>()
    context.contentResolver
            .query(ProductExtraTable.URI, null, "${ProductExtraTable.ROW_PRODUCT_UUID} = ?", arrayOf(productUuid), null)
            ?.let { cursor ->
                try {
                    if (cursor.moveToFirst()) {
                        do {
                            result.add(createProductExtra(cursor))
                        } while (cursor.moveToNext());
                    }
                } catch (e: Exception) {
                    e.printStackTrace()
                } finally {
                    cursor.close()
                }
            }
    return result
}
{% endhighlight %}
