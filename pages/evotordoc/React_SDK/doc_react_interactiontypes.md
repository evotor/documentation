---
title: Типы взаиможействия со смарт-терминалом
keywords:
summary:
sidebar: evotordoc_sidebar
permalink: doc_react_interactiontypes.html
tags: [terminal, react]
folder: react_SDK
published: true
---

## Получение данных {#getter}

Приложения получают данные от смарт-терминала с помощью методов `get*`.
Методы `get*` представлены в классах:

* [`UserAPI`](./react_reference_userapi.html) – с помощью методов класса приложения получают данные пользователей смарт-терминала.
* [`InventoryAPI`](./react_reference_inventoryapi.html) – с помощью методов класса приложения получают данные товаров, которые хранятся в базе смарт-терминала.
* [`ReceiptAPI`](./react_reference_receiptapi.html) – с помощью методов класса приложения получают данные о позициях для добавления в чек, получать чеки по `uuid`, а также получать заголовки чеков.
* [`Printer`](./react_reference_devicesprinter.html) – с помощью методов класса приложения получают допустимую длину строки для печати в символах или пикселях.
* [`Scales`](./react_reference_devicescales.html) – с помощью методов класса приложения получают вес товара, взвешиваемого на весах, подключённых к смарт-терминалу.

{% include note.html content="Данные получаются асинхронно, поэтому все методы `get*` содержат в качестве параметра функцию `getter`, в которую передаётся результат вызова метода." %}

## Команды {#commands}

Команды – методы с помощью которых ваше приложение может передавать данные в смарт-терминал.

Команды представлены в классах:

* [`ReceiptAPI`](./react_reference_receiptapi.html) – с помощью методов класса приложения могут передавать чек для оплаты в смарт-терминале и отправить чек на email или телефон.
* [`Printer`](./react_reference_devicesprinter.html) – с помощью методов класса приложения могут передавать данные для печати на принтере, встроенном в смарт-терминал.

## Колбеки {#callbacks}

Колбеки, с помощью которых вы можете изменять данные, например, применять скидку к созданным чекам, представлены в классе [IntegrationCallback](react_reference_integrationapi.html).

## Подписка на события {#eventsubscription}

Вы можете подписать приложение на прослушивание событий. Для этого добавьте один или несколько слушателей с помощью метода:

```js
static addEventListener(type: *тип события*, listener: *тип слушателя*, isGlobal: boolean = true): void
```

Чтобы удалить слушатель, используйте метод:

```js
static removeEventListener(type: *тип события*, listener?: *тип слушателя*): boolean
```

{% include tip.html content="Чтобы удалить все слушатели события не передавайте параметр `listener`." %}

Методы представлены в классах:

* [`IntegrationServices`](./react_reference_integrationapi.html)
* [`BroadcastReceiver`](./react_reference_broadcastreceivers.html)
* [`DeviceServiceConnector`](./react_reference_devicesconnection.html)
* [`Scanner`](./react_reference_devicescanner.html)
* [`NavigationAPI`](./react_reference_navigationapi.html)

### Широковещательные сообщения {#broadcastreceiver}

Частным случаем подписки на события является [подписка на широковещательные сообщения](./react_reference_broadcastreceivers.html). Широковещательные сообщения – сообщения, которые смарт-терминал рассылает на все приложения.
