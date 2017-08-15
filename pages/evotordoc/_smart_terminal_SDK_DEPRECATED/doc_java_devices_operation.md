---
title: Иконка JS-приложения в интерфейсе смарт-терминала
keywords: sample
summary: "Раздел содержит требования к плитке приложения, а также информацию о том как добавить плитку в интерфейс смарт-терминала."
sidebar: evotordoc_sidebar
permalink: doc_smart_terminal_app_tile.html
tags: [Терминал, Java, JavaScript]
folder: smart_terminal_SDK
---

### Получение данных о товаре

*Чтобы приложение получало данные от весов:*

Используйте функцию `getProduct()`:

   ```
   fun getProduct(commodityUuid: String): JSValue
   ```
   Весы передают данные в параметры функции.


### Взвешивание товара

*Чтобы приложение получало данные от весов:*

1. В [манифесте приложения](./doc_js_app_manifest.html) укажите соответствующие права:

   ```yaml
   ```

2. Используйте функцию `getWeight()`:

   ```
   override fun getWeight(): JSValue {
       try {
           val weight = DeviceServiceConnector.getScalesService().getWeight(ru.evotor.devices.commons.Constants.DEFAULT_DEVICE_INDEX)
           return JSValue(jsContext, weight?.weightInGrams.toString())
       } catch (exc: DeviceServiceException) {
           exc.printStackTrace()
           return JSValue(jsContext, null)
       }
   }
   ```
   Весы передают данные в параметры функции.

### Сканирование штрихкодов

*Чтобы приложение получало данные от сканера штрихкодов:*

1. В [манифесте приложения](./doc_js_app_manifest.html) укажите соответствующие права:

   ```yaml
   ```

2. Используйте функцию `barcodeScanned()`.

   Сканер штрихкодов передаёт данные в параметры функции.
