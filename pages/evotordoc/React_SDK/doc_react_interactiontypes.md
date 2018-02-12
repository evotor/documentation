---
title: Типы взаимодействия со смарт-терминалом
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

Данные получаются асинхронно, поэтому все методы `get*` возвращают обещание (`Promise`).

Пример использования метода, возвращающего обещание:

```js
let users, product;
const workflow = async () => {
    users = await UserAPI.getAllUsers();
    product = await InventoryAPI.getProductByUuid("58e11d31-b2d8-40a0-a1b0-cbd44620a9ec");
};
workflow();
```

Методы этого типа представлены в классах:

* [`UserAPI`](./react_reference_userapi.html);
* [`InventoryAPI`](./react_reference_inventoryapi.html);
* [`ReceiptAPI`](./react_reference_receiptapi.html);
* [`Printer`](./react_reference_devicesprinter.html);
* [`Scales`](./react_reference_devicescales.html).


## Команды {#commands}

Команды – методы, которые инициируют действия на смарт-терминале.

Методы этого типа представлены в классах:

* [`ReceiptAPI`](./react_reference_receiptapi.html);
* [`Printer`](./react_reference_devicesprinter.html).

## Коллбэки {#callbacks}

Коллбэки – методы обратного вызова, с помощью которых вы можете изменять данные чека в процессе его формирования, например, применять к нему скидку.

Методы этого типа представлены в классах:

* [IntegrationCallback](./react_reference_integrationapi.html);
* [NavigationAPI](./react_reference_navigationapi.html).

## Подписка на события {#eventsubscription}

Вы можете подписать приложение на прослушивание событий. Для этого добавьте один или несколько слушателей с помощью метода:

```js
static addEventListener(type: *тип события*, listener: *тип слушателя*, isGlobal: boolean = true): void
```

где `isGlobal` указывает глобальную доступность слушателя: если `true` – приложение получает события независимо от того, запущено оно или нет; если `false` – слушатель выполняется только при открытом приложении. По умолчанию – `true`.

Чтобы удалить слушатель, используйте метод:

```js
static removeEventListener(type: *тип события*, listener?: *тип слушателя*): boolean
```

Метод возвращает `true`, если слушатель удалён успешно, или `false`, если удалить слушатель не удалось.

Чтобы удалить все слушатели события и отменить подписку, не передавайте параметр `listener`.

Пример добавления слушателя:

```js
const listener = (event) => {
    console.log("Sell receipt opened " + event.receiptUuid);
};
BroadcastReceiver.addEventListener(ReceiptEventType.SELL_RECEIPT_OPENED, listener);
```

Методы этого типа представлены в классах:

* [`IntegrationServices`](./react_reference_integrationapi.html)
* [`BroadcastReceiver`](./react_reference_broadcastreceivers.html)
* [`DeviceServiceConnector`](./react_reference_devicesconnection.html)
* [`Scanner`](./react_reference_devicescanner.html)
* [`NavigationAPI`](./react_reference_navigationapi.html)
