---
title: Модули
keywords: обмен, сообщения, HTTP, сторонний, сервис, проксирование
summary:
sidebar: evotordoc_sidebar
permalink: doc_js_modules.html
tags: [terminal, JavaScript]
folder: js_SDK
---

Для доступа к функциям смарт-терминала, JS-приложение может использовать различные модули.

Подключайте модули с помощью функции `require('<модуль>')`. Методы каждого из модулей описаны в соответствующих разделах.

## Модули для доступа к функциям смарт-терминала

Доступные модули:

* `storage` – модуль для работы с [хранилищем данных на смарт-терминале](./doc_js_storage_api.html).
* `logger` – модулю для записи [логов](./doc_app_logging.html).
* `devices` – модуль для работы с подключаемыми устройствами, например, [весами](./doc_js_devices.html).
* `http` – модуль для [обмена сообщениями со сторонним сервисом](./doc_js_third_party_service_communication.html).
* `navigation` – модуль для взаимодействия с view.html.
* `inventory` – модуль для работы с [номенклатурой](./doc_js_inventory.html).


"storage" -> return Storage(ctxt, jsContext)
"logger" -> return Logger(ctxt, jsContext)
"devices" -> return Devices(ctxt, jsContext)
"http" -> return Http(jsContext)
"navigation" -> return Navigation(ctxt, jsContext)
"inventory" -> return Inventory(ctxt, jsContext)
