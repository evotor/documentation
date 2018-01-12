---
title: Сканер штрихкодов
keywords: react
sidebar: react_reference_sidebar
toc: true
permalink: react_reference_devices.html
folder: react_reference
---

## Описание

## Методы

### addEventListener

[Прослушивание событий]

Тип события: ScannerEventType
Тип ckeifntkz: ScannerEventListener

```js
static addEventListener(type: ScannerEventType, listener: ScannerEventListener, isGlobal: boolean = true): void
```

**Описание**

**Параметры**

* `type`
* `listener`
* `isGlobal`

**Возвращает**

### removeEventListener

```js
static removeEventListener(type: ScannerEventType, listener?: ScannerEventListener): boolean
```

**Описание**

**Параметры**

* `type`
* `listener`
Параметр, кототрый отвечает за то, какие сообщения будут приниматься. Принимает значения в зависимости от того, какие сообщения буду приниматься:


**Возвращает**

* `true` – если `listener` удалён.
* `false` – если `listener` не удалён.
