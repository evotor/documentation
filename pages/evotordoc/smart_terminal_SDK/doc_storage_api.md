---
title: Storage API
keywords: sample
summary:
sidebar: evotordoc_sidebar
permalink: doc_storage_api.html
folder: smart_terminal_SDK
---

Если Java-приложения могут хранить данные на смарт-терминале в любом виде, то JS-приложения для хранения данных между запусками используют специальный объект `storage`.

### Подготовка к работе

В файле `client.yaml` укажите:

{% highlight yaml %}
capabilities:
    - storage
{% endhighlight %}

### Функции для работы со Storage API

#### Вызов объекта для работы с API.

{% highlight javascript %}
var storage = require('storage')
{% endhighlight %}

#### Сохранение данных

{% highlight javascript %}
storage.set(<ключ>, <значение>)
{% endhighlight %}
Содержит строковые переменные `<ключ>` и `<значение>`.

Возвращает `true` или `false`, в зависимости от успешности сохранения.

{% include note.html content="Одна пара <ключ>-<значение> не может занимать более 600 Кбайт." %}

#### Получение данных

{% highlight javascript %}
storage.get(<ключ>)
{% endhighlight %}

Содержит строковую переменную `<ключ>`.

Возвращает ранее записанную строковую переменную или `null`, если значение не найдено.
