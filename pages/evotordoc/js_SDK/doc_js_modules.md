---
title: Модули
keywords: обмен, сообщения, HTTP, сторонний, сервис, проксирование
summary:
sidebar: evotordoc_sidebar
permalink: doc_js_modules.html
tags: [Терминал, Java]
folder: java_SDK
---

Для доступа к функциям смарт-терминала, JS-приложение может использовать различные модули.

Подключайте модули с помощью функции `require('<модуль>')`. Методы каждого из модулей описаны в соответствующих разделах.

## Модули для доступа к функциям смарт-терминала

Доступные модули:

* `storage` –
* `inventory` –
* `logger` –
* `navigation` –
* `receiptControl` – 


"storage" -> return Storage(ctxt, jsContext)
                "inventory" -> return Inventory(ctxt, jsContext)
                "logger" -> return Logger(jsContext)
                "navigation" -> return getNavigation()
                "receiptControl" -> return ReceiptControl(ctxt, jsContext)
