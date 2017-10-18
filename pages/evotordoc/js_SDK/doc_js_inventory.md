---
title: Поиск товара по идентификатору
keywords: номенклатура, товар, inventory
summary:
sidebar: evotordoc_sidebar
permalink: doc_js_inventory.html
tags: [terminal, javascript, products]
folder: js_SDK
---

## Подготовка к работе

*Чтобы использовать методы для работы с номенклатурой:*

1. Убедитесь, что в файле `client.yaml`, в списке `capabilities`, указано разрешение для работы с номенклатурой:

   ```yaml
    capabilities:
        - inventory
   ```

2. В плагине, демоне или `view.html` подключите модуль `inventory`:

   ```javascript
   var inventory = require('inventory')
   ```

## Методы для работы номенклатурой

### Метод для поиска товаров по идентификатору

```javascript
inventory.getProduct(uuid)
```

В аргументе функции требуется передать строку с идентификатором товара в формате `uuid4`.

Функция возвращает JSON-объект с данными требуемого товара.
