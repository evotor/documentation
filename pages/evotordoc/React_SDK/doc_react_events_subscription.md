---
title: Подкписка на события
keywords:
summary:
sidebar: evotordoc_sidebar
permalink: doc_react_events_subscription.html
tags: [terminal, react]
folder: react_SDK
published: false
---

Вы можете подписать приложение на прослушивание событий. Для этого добавьте один или несколько слушателей с помощью метода:

```js
static addEventListener(type: *тип события*, listener: *тип слушателя*, isGlobal: boolean = true): void
```

Чтобы удалить слушатель, используйте метод:

```js
static removeEventListener(type: *тип события*, listener: *тип слушателя*): boolean
```

{% include tip.html content="Чтобы удалить все слушатели события не передавайте параметр `listener`." %}

Методы представлены в классах:

* [`IntegrationServices`](./react_reference_integrationapi.html)
* [`BroadcastReceiver`](./react_reference_broadcastreceivers.html)
* [`DeviceServiceConnector`](./react_reference_devicesconnection.html)
* [`Scanner`](./react_reference_devices.html)
* [`NavigationAPI`](./react_reference_navigationapi.html)
