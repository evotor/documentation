---
title: Получение данных с подключённого оборудования
keywords:
summary:
sidebar: evotordoc_sidebar
permalink: doc_js_devices_interactions.html
tags: [Терминал, JS]
folder: js_SDK
---

Ваше приложение может получать данные от сканера штрихкодов и весов, подключённых к смарт-терминалу.

### Подготовка

Перед тем как ваше приложение сможет получать данные от устройств, вам потребуется [подключить к проекту библиотеку integration-library](/doc_java_integration_library_connection.html).

### Получение данных от подключённых устройств

#### Получить штрихкод товара

```javascript
barcodeScanned()

```

<!-- Функция возвращает... -->

#### Получить вес товара

```javascript
getWeight(): JSValue
```

<!-- Функция возвращает... -->
