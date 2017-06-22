---
title: Storage API
keywords: sample
summary:
sidebar: evotordoc_sidebar
permalink: doc_storage_api.html
tags: [Java, JavaScript, Терминал]
folder: smart_terminal_SDK
---

Если Java-приложения могут хранить данные на смарт-терминале в любом виде, то JS-приложения для хранения данных между запусками используют специальный объект `storage`.

### Подготовка к работе

Убедитесь, чтоб файл `client.yaml` содержит:

```yaml
capabilities:
    - storage
```

### Функции для работы со Storage API

#### Вызов объекта для работы с API.

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
