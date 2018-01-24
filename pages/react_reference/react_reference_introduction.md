---
title: Введение
keywords: react, справка
sidebar: evotordoc_sidebar
toc: true
permalink: react_reference_introduction.html
folder: react_reference
---

{% include note.html content="Создание приложения для смарт-терминала на основе React Native SDK описано в разделе [*Подготовка среды для разработки на React Native*](./doc_react_getting_started.html)." %}

## Взаимодействие со смарт-терминалом

Используя React Native SDK приложения могут:

##### Получать данные {#getter}

Приложения получают данные от смарт-терминала с помощью методов `get*`.
Методы `get*` представлены в классах:

* [`UserAPI`](./react_reference_userapi.html) – с помощью методов класса приложения получают данные пользователей смарт-терминала.
* [`InventoryAPI`](./react_reference_inventoryapi.html) – с помощью методов класса приложения получают данные товаров, которые хранятся в базе смарт-терминала.
<!-- * [`Navigation API`](./react_reference_navigationapi.html) – с помощью методов интерфейса приложения могут получать намерения платежей или изменения чеков продажи и возврата. -->
* [`ReceiptAPI`](./react_reference_receiptapi.html) – с помощью методов класса приложения получают данные о позициях для добавления в чек, получать чеки по `uuid`, а также получать заголовки чеков.
* [`Printer`](./react_reference_devicesprinter.html) – с помощью методов класса приложения получают допустимую длину строки для печати в символах или пикселях.
* [`Scales`](./react_reference_devicesscales.html) – с помощью методов класса приложения получают вес товара, взвешиваемого на весах, подключённых к смарт-терминалу.

{% include note.html content="Получение данных происходит асинхронно, поэтому все методы `get*` содержат в качестве параметра функцию `getter`, в которую передаётся результат вызова метода." %}

##### Передавать данные

Методы, с помощью которых приложения передают данные для обработки в смарт-терминале, представлены в классах:

<!-- * [`Navigation API`](./react_reference_navigationapi.html) – с помощью методов интерфейса приложения могут -->
* [`ReceiptAPI`](./react_reference_receiptapi.html) – с помощью методов класса приложения могут передавать чек для оплаты в смарт-терминале и отправить чек на email или телефон.
* [`Printer`](./react_reference_devicesprinter.html) – с помощью методов класса приложения могут передавать данные для печати на принтере, встроенном в смарт-терминал.

##### Изменять данные

Приложения могут изменять данные, например применять скидку для уже созданных чеков с помощью [интеграционных служб](./react_reference_integrationapi.html).

## Навигация

Для навигации и взаимодействия с приложениями смарт-терминала используйте класс [NavigationAPI](./react_reference_navigationapi.html).

## Работа с устройствами

Также с помощью React Native SDK вы можете [подключать устройтсва к смарт-терминалу](./react_reference_devicesconnection.html) и взаимодействовать с ними.

Для работы с устройствами используйте классы:

* [`Printer`](./react_reference_devicesprinter.html) – с помощью методов класса приложения могут работать с принтером чеков.
* [`Scales`](./react_reference_devicescales.html) – с помощью методов класса приложения могут работать с весами.
* [`Scanner`](./react_reference_devicescanner.html) – с помощью методов класса приложения могут работать со сканером штрихкодов.

## Подписка на события {#eventslistening}

Вы можете подписать приложение на прослушивание событий. Для этого добавьте один или несколько слушателей с помощью метода:

```js
static addEventListener(type: *тип события*, listener: *тип слушателя*, isGlobal: boolean = true): void
```

Чтобы удалить слушатель, используйте метод:

```js
static removeEventListener(type: *тип события*, listener: *тип слушателя*): boolean
```

Чтобы удалить все слушатели события не передавайте параметр `listener`.

Методы представлены в классах:

* [`IntegrationServices`](./react_reference_integrationapi.html)
* [`BroadcastReceiver`](./react_reference_broadcastreceivers.html)
* [`DeviceServiceConnector`](./react_reference_devicesconnection.html)
* [`Scanner`](./react_reference_devices.html)
* [`NavigationAPI`](./react_reference_navigationapi.html)
