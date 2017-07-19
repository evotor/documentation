---
title: События смарт-терминала
keywords: sample
summary: Этот раздел содержит информацию о событиях которые рассылает смарт-терминал. При получении различных событий приложение выполняет соответствующие функции, например, сохраняет логи, редактирует чек, начисляет скидки и т.д..
sidebar: evotordoc_sidebar
permalink: doc_events.html
tags: [Терминал, Java, JavaScript, События]
folder: smart_terminal_SDK
published: true
---

Смарт-терминал рассылает два вида событий, на которые можно подписать приложение:

* События, которые не требуют ответа. Такие события в основном используются для ведения статистики и записи логов.
* События, которые требуют ответ. Такие события необходимы для интеграции функций приложения в процесс работы смарт-терминала, например, для редактирования позиций или начисления скидки при создании чека.

### События, которые не требуют ответа

Чтобы подписать java-приложение на такие события укажите их в приёмнике широковещательных сообщений (BroadcastReceiver).

Пример приёмника с нескольких сообщений.

```xml
<receiver
        android:name=".AddPositionBroadcastReceiver"
        android:enabled="true"
        android:exported="true">
        <intent-filter>
            <action android:name="evotor.intent.action.receipt.sell.POSITION_ADDED" />
            <action android:name="evotor.intent.action.receipt.sell.POSITION_EDITED" />
            <action android:name="evotor.intent.action.receipt.sell.POSITION_REMOVED" />
            <category android:name="android.intent.category.DEFAULT" />
        </intent-filter>
    </receiver>
```

{% include note.html content="Вы можете указать несколько сообщений в одном приёмнике или использовать отдельный приёмник для каждого сообщения." %}

Чтобы подписать JS-приложение на получение таких событий, укажите их в списке daemons в [манифесте приложения](./ссылка на топик с js-манифестом). Каждое событие вызывает соответствующий метод, в аргументе которого передаются данные о событии.

```yaml
daemons:
  - name: daemon1
    events:
      - evotor.intent.action.receipt.sell.CLEARED
      - evotor.intent.action.receipt.sell.OPENED
    behavior: daemon1.js
  - name: daemon2
    events:
      - evotor.intent.action.receipt.sell.POSITION_ADDED
      - evotor.intent.action.receipt.sell.POSITION_EDITED
      - evotor.intent.action.receipt.sell.POSITION_REMOVED
    behavior: daemon2.js
```

Таблица ниже содержит список всех событий, которые не требуют ответа.

| Пакет                                 | Событие          | Описание                         |
|---------------------------------------|------------------|----------------------------------|
| evotor.intent.action.receipt.sell.    | CLEARED          | Чек продажи очищен               |
|                                       | OPENED           | Чек продажи открыт               |
|                                       | POSITION_ADDED   | В чек продажи добавлена позиция  |
|                                       | POSITION_EDITED  | В чеке продажи изменена позиция  |
|                                       | POSITION_REMOVED | Из чека продажи удалена позиция  |
|                                       | RECEIPT_CLOSED   | Чек продажи закрыт               |
| evotor.intent.action.receipt.payback. | CLEARED          | Чек возврата очищен              |
|                                       | OPENED           | Чек возврата открыт              |
|                                       | POSITION_ADDED   | В чек возврата добавлена позиция |
|                                       | POSITION_EDITED  | В чеке возврата изменена позиция |
|                                       | POSITION_REMOVED | Из чека возврата удалена позиция |
|                                       | RECEIPT_CLOSED   | Чек возврата закрыт              |
| evotor.intent.action.cashOperation.   | CASH_OUT         | Выдача наличных из кассы         |
|                                       | IN               | Внесение наличных в кассу        |
| evotor.intent.action.inventory.       | CARD_OPEN        | Открыта карточка товара          |
|                                       | PRODUCTS_UPDATED | База товаров обновлена           |
| evotor.intent.action.cashDrawer.      | OPEN             | Открыт денежный ящик             |

{% include note.html content="Получение данных от сканера штрихкодов описано в соответствующих разделах для [java-](./doc_barcode_scanner.html) и [JS-приложения](./doc_JS_barcode_scanner.html)" %}

### События, которые требуют ответа

События, которые требуют ответа являются *точками интеграции* приложения в процесс работы смарт-терминал. При получении таких событий приложение может реализовать свою логику и, например, редактировать чек, начислять скидки и т.д.

Информацию о функциях приложения в зависимости от события, а так же о том, как подписать приложение на событие, которое требует ответа, вы найдёте в [соответствующих разделах](./ссылка на архив тегов).

Схема ниже показывает процесс обмена событием, которое требует ответа. Первое приложение, которому смарт-терминал передаёт данные, выбирается случайным образом.

![](./images/EventSequenceDiagram.png)
