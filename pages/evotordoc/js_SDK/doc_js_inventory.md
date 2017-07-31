---
title: Поиск товара по идентификатору
keywords:
summary:
sidebar: evotordoc_sidebar
permalink: doc_js_inventory.html
tags: [Терминал, JS]
folder: js_SDK
---

### Подготовка к работе

Убедитесь, что в файле `client.yaml`, в списке `capabilities`, указан модуль для работы с номенклатурой:

```yaml
capabilities:
    - inventory
```

### Методы для работы номенклатурой

#### Подключение модуля

*Чтобы использовать методы для работы с номенклатурой подключите модуль:*

```javascript
var inventory = require('inventory')
```

#### Метод для поиска товаров по идентификатору

```javascript
inventory.getProduct(uuid)
```

В аргументе функции требуется передать строку с идентификатором товара в формате `uuid4`.

Функция возвращает JSON-объект с данными требуемого товара.
