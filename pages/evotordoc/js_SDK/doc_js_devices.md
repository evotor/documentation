---
title: Получение данных с подключённого оборудования
keywords: сканер, штрихкоды, весы, устройства, разрешения, devices
summary:
sidebar: evotordoc_sidebar
permalink: doc_js_devices.html
tags: [Terminal, JavaScript, Equipment]
folder: js_SDK
---

Ваше приложение может получать данные от сканера штрихкодов и весов, подключённых к смарт-терминалу.

## Получить вес товара {#Scales}

Убедитесь, что список `capabilities`, в файле `client.yaml`, содержит разрешение для работы с подключёнными устройствами:

```yaml
capabilities:
    - devices
```

Чтобы приложение взаимодействовало с весами подключите модуль:

```javascript
var devices = require('devices')
```

Чтобы получить вес товара используйте метод:

```javascript
devices.getWeight()
```

Метод возвращает данные, полученные от весов.

Метод можно реализовать как в демоне, так и во view.html

## Получить штрихкод товара {#BarcodeScanner}

Убедитесь, что список `capabilities`, в файле `client.yaml`, содержит разрешение для работы со сканером штрихкодов:

```yaml
capabilities:
    - barcode-scanner
```

Чтобы получить отсканированный штрихкод используйте метод:

```javascript
barcodeScanned(scanneddata)
```

Метод возвращает данные, полученные от сканера штрихкодов.

{% include important.html content="Приложение может получать данные от сканера штрихкодов только во view.html. В плагине или демоне данные от сканера штрихкодов получить нельзя." %}
