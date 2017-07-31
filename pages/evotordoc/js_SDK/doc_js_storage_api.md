---
title: Хранение данных на смарт-терминале
keywords:
summary:
sidebar: evotordoc_sidebar
permalink: doc_js_storage_api.html
tags: [Терминал, JS]
folder: js_SDK
---

### Подготовка к работе

Убедитесь, что в файле `client.yaml`, в списке `capabilities`, указан модуль для работы с хранилищем данных на смарт-терминале:

```yaml
capabilities:
    - storage
```

### Методы для работы с хранилищем данных

#### Подключение модуля

Чтобы использовать методы для работы с хранилищем данных подключите модуль:

```javascript
var storage = require('storage')
```

#### Сохранение данных

```javascript
storage.set(<ключ>, <значение>)
```

Содержит строковые переменные `<ключ>` и `<значение>`.

Возвращает `true` или `false`, в зависимости от успешности сохранения.

{% include note.html content="Одна пара <ключ>-<значение> не может занимать более 600 Кбайт." %}

#### Получение данных

```javascript
storage.get(<ключ>)
```

Содержит строковую переменную `<ключ>`.

Возвращает ранее записанную строковую переменную или `null`, если значение не найдено.

#### Удаление данных

```javascript
storage.clear()
```

Удаляет все записанные ранее данные.