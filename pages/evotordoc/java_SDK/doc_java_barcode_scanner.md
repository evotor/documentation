---
title: Сканер штрихкодов
keywords:
summary: "Раздел содержит инструкцию о том, как подготовить приложение для получения данных от сканера штрихкодов."
sidebar: evotordoc_sidebar
permalink: doc_java_barcode_scanner.html
tags: [Терминал, Java, Оборудование]
folder: java_SDK
---

Чтобы ваше приложение получало данные от сканера штрихкодов, подключённого к смарт-терминалу, реализуйте интерфейс `BarcodeBroadcastReceiver`.

Для этого:

1. В манифесте приложения укажите следующий элемент:
    `<uses-permission android:name="ru.evotor.devices.SCANNER_RECEIVER" />`

2. Объявите класс `BarcodeBroadcastReceiver`:

   ```java
   BarcodeBroadcastReceiver mBarcodeBroadcastReceiver = new BarcodeBroadcastReceiver() {

       @Override
       public void onReceiveBarcode(String barcode) {
           // Переменная barcode содержит считанный штрихкод.
       }
   };
   ```

3. В операции (`Activity`) или фрагменте (`Fragment`) запускайте и останавливайте подписку `BarcodeBroadcastReceiver` :

   ```java
       @Override
       protected void onPause() {
           super.onPause();
           unregisterReceiver(mBarcodeBroadcastReceiver);
       }
       @Override
       protected void onResume() {
           super.onResume();
           registerReceiver(mBarcodeBroadcastReceiver, BarcodeBroadcastReceiver.BARCODE_INTENT_FILTER, BarcodeBroadcastReceiver.SENDER_PERMISSION, null);
       }
   }
   ```
