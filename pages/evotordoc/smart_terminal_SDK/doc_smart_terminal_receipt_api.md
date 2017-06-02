---
title: Receipt API
keywords: sample
summary: "Раздел содержит описание Receipt API смарт-терминала."
sidebar: evotordoc_sidebar
permalink: doc_smart_terminal_receipt_api.html
folder: smart_terminal_SDK
published: true
---

### Receipt API смарт-терминала

Используйте Receipt API чтобы с помощью штрихкода получать информацию о позициях для добавления в чек.

Receipt API смарт-терминала включает в себя:

* URI контента `val BASE_URI = Uri.parse("content://ru.evotor.receipt")`:

    Данные хранятся локально и синхронизируются с облаком Эвотор каждые четыре часа.

* Таблицу позиций, которые можно добавить в чек `PositionTable`:

    ``` java
    object PositionTable {
        val URI = Uri.withAppendedPath(ReceiptApi.BASE_URI, "Position")

        const val ROW_PRODUCT_UUID = "PRODUCT_UUID"
        const val ROW_PRODUCT_CODE = "PRODUCT_CODE"
        const val ROW_PRODUCT_TYPE = "PRODUCT_TYPE"
        const val ROW_NAME = "NAME"
        const val ROW_MEASURE_NAME = "MEASURE_NAME"
        const val ROW_MEASURE_PRECISION = "MEASURE_PRECISION"
        const val ROW_PRICE = "PRICE"
        const val ROW_BARCODE = "BARCODE"
        const val ROW_QUANTITY = "QUANTITY"
        const val ROW_ALCOHOL_BY_VOLUME = "ALCOHOL_BY_VOLUME"
        const val ROW_ALCOHOL_PRODUCT_KIND_CODE = "ALCOHOL_PRODUCT_KIND_CODE"
        const val ROW_TARE_VOLUME = "TARE_VOLUME"
    }
    ```

### Примеры запросов к Receipt API

Получить по штрихкоду позицию для добавления в чек:


``` java
fun getPositionsByBarcode(context: Context, barcode: String): List<Position> {
        val positionsList = ArrayList<Position>()

        val cursor: Cursor? = context.contentResolver.query(
                Uri.withAppendedPath(PositionTable.URI, barcode),
                null, null, null, null)

        if (cursor != null) {
            if (cursor.moveToFirst()) {
                do {
                    val position: Position = Position(
                            null,
                            cursor.getString(cursor.getColumnIndex(PositionTable.ROW_PRODUCT_UUID)),
                            cursor.getString(cursor.getColumnIndex(PositionTable.ROW_PRODUCT_CODE)),
                            ProductType.valueOf(cursor.getString(cursor.getColumnIndex(PositionTable.ROW_PRODUCT_TYPE))),
                            cursor.getString(cursor.getColumnIndex(PositionTable.ROW_NAME)),
                            cursor.getString(cursor.getColumnIndex(PositionTable.ROW_MEASURE_NAME)),
                            cursor.getInt(cursor.getColumnIndex(PositionTable.ROW_MEASURE_PRECISION)),
                            BigDecimal(cursor.getLong(cursor.getColumnIndex(PositionTable.ROW_PRICE))).divide(BigDecimal(100)),
                            BigDecimal(cursor.getLong(cursor.getColumnIndex(PositionTable.ROW_PRICE))).divide(BigDecimal(100)),
                            BigDecimal(cursor.getLong(cursor.getColumnIndex(PositionTable.ROW_QUANTITY))).divide(BigDecimal(1000)),
                            cursor.getString(cursor.getColumnIndex(PositionTable.ROW_BARCODE)),
                            null,
                            BigDecimal(cursor.getLong(cursor.getColumnIndex(PositionTable.ROW_ALCOHOL_BY_VOLUME))).divide(BigDecimal(1000)),
                            cursor.getLong(cursor.getColumnIndex(PositionTable.ROW_ALCOHOL_PRODUCT_KIND_CODE)),
                            BigDecimal(cursor.getString(cursor.getColumnIndex(PositionTable.ROW_TARE_VOLUME))).divide(BigDecimal(1000)),
                            null,
                            null
                    )
                    positionsList.add(position)
                } while (cursor.moveToNext())
            }
        }

        return positionsList
    }
```
