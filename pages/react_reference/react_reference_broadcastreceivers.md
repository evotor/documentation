---
title: BroadcastReceiver
keywords: react
sidebar: evotordoc_sidebar
toc: true
permalink: react_reference_broadcastreceivers.html
folder: react_reference
---

## Описание

## Методы

### addEventListener

```js
static addEventListener(type: BroadcastReceiverEventType, listener: BroadcastReceiveListener, isGlobal: boolean = true): void
```

**Описание**

Регистрирует широковещательный слушатель и [подписывает приложение на события](./doc_react_interactiontypes.html#eventsubscription).

**Параметры**

* `type` – тип события. Для получения широковещательных сообщений указывайте тип [`BroadcastReceiverEventType`](./react_reference_broadcastreceivers.html#BroadcastReceiverEventType).
* `listener` – тип слушателя. Для получения широковещательных сообщений указывайте тип `BroadcastReceiveListener`.
* `isGlobal` – указывает глобальную доступность метода. По умолчанию `true`.

**Возвращает**

### removeEventListener

```js
static removeEventListener(type: BroadcastReceiverEventType, listener?: BroadcastReceiveListener): boolean
```

**Описание**

Удаляет широковещательный слушатель и отменяет [подписку на события](./doc_react_interactiontypes.html#eventsubscription).

**Параметры**

* `type` – тип события. Для отмены получения широковещательных сообщений указывайте тип [`BroadcastReceiverEventType`](./react_reference_broadcastreceivers.html#BroadcastReceiverEventType).
* `listener` – тип слушателя. Для отмены получения широковещательных сообщений указывайте тип `BroadcastReceiveListener`. Не передавайте параметр если хотите удалить все слушатели.

**Возвращает**

* `true` – если слушатель удалён.
* `false` – если слушатель не удалён.

## Параметры

### Класс BroadcastEvent

```js
export class BroadcastEvent {
    constructor(action: string, total: string | null, uuid: string | null) {}
}
```

### Тип BroadcastReceiverEventType {#BroadcastReceiverEventType}

```js
export enum BroadcastReceiverEventType {
    EVENT_RECEIVED = "EVENT_RECEIVED"
}
```
