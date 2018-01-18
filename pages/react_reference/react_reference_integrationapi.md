---
title: IntegrationServices
keywords: react
sidebar: react_reference_sidebar
toc: true
permalink: react_reference_integrationapi.html
folder: react_reference
---

## Описание

## Методы

### addEventListener

```js
static addEventListener(type: IntegrationEventType, listener: IntegrationEventListener, isGlobal: boolean = true): void
```

**Описание**

Метод для [подписки приложения на события](./react_reference_introduction.html#eventslistening).

**Параметры**

* `type` – тип события. Для получения данных от интеграционных служб указывайте тип `IntegrationEventType`.
* `listener` – тип слушателя. Для получения данных от интеграционных служб указывайте тип `IntegrationEventListener`.
* `isGlobal` – указывает глобальную доступность метода. По умолчанию `true`.

**Возвращает**

### removeEventListener

```js
static removeEventListener(type: IntegrationEventType, listener: IntegrationEventListener): boolean
```

**Описание**

Метод для отмены подписки на события.

**Параметры**

* `type` – тип события. Для отмены получения данных от интеграционных служб указывайте тип `IntegrationEventType`.
* `listener` – тип слушателя. Для отмены получения данных от интеграционных служб указывайте тип `IntegrationEventListener`. Не передавайте параметр если хотите удалить все слушатели.

**Возвращает**

* `true` – если слушатель удалён.
* `false` – если слушатель не удалён.
