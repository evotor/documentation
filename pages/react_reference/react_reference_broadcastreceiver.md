---
title: BroadcastReceiver
keywords: react
sidebar: react_reference_sidebar
toc: true
permalink: react_reference_broadcastreceivers.html
folder: react_reference
---

## Описание

## Методы

### addEventListener

```js
static addEventListener(type: BroadcastReceiverEventType, listener: BroadcastReceiverListener, isGlobal: boolean = true): void
```

**Описание**

Метод для [подписки приложения на события](./react_reference_introduction.html#eventslistening).

**Параметры**

* `type` – тип события. Для получения широковещательных сообщений указывайте тип `BroadcastReceiverEventType`.
* `listener` – тип слушателя. Для получения широковещательных сообщений указывайте тип `BroadcastReceiverListener`.
* `isGlobal` – указывает глобальную доступность метода. По умолчанию `true`.`

**Возвращает**

### removeEventListener

```js
static removeEventListener(type: BroadcastReceiverEventType, listener?: BroadcastReceiveListener): boolean
```

**Описание**

Метод для отмены подписки на события.

**Параметры**

* `type` – тип события. Для отмены получения широковещательных сообщений указывайте тип `BroadcastReceiverEventType`.
* `listener` – тип слушателя. Для отмены получения широковещательных сообщений указывайте тип `BroadcastReceiveListener`. Не передавайте параметр если хотите удалить все слушатели.

**Возвращает**

* `true` – если слушатель удалён.
* `false` – если слушатель не удалён.
