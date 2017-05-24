---
title: Сканер штрихкодов
keywords: sample
summary: "Раздел содержит инструкцию о том, как подготовить приложение для получения данных от сканера штрихкодов."
sidebar: evotordoc_sidebar
permalink: doc_barcode_scanner.html
folder: evotordoc/smart_terminal_SDK
---

Чтобы ваше приложение получало данные от сканера штрихкодов, подключённого к смарт-терминалу, реализуйте интерфейс `BarcodeBroadcastReceiver`.

Для этого:
1. В манифесте приложения укажите следующий элемент:
    `<uses-permission android:name="ru.evotor.devices.SCANNER_RECEIVER" />`

2. Объявите класс `BarcodeBroadcastReceiver`:

    {% highlight java %}
    BarcodeBroadcastReceiver mBarcodeBroadcastReceiver = new BarcodeBroadcastReceiver() {

        @Override
        public void onReceiveBarcode(String barcode) {
            // Переменная barcode содержит считанный штрихкод.
        }
    };
    {% endhighlight %}

3. В операции (`Activity`) или фрагменте (`Fragment`) запускайте и останавливайте подписку `BarcodeBroadcastReceiver` :

    {% highlight java %}
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
    {% endhighlight %}
