---
title: Весы
keywords: sample
summary:
sidebar: evotordoc_sidebar
permalink: doc_scales.html
tags: [Java, Терминал, Оборудование]
folder: smart_terminal_SDK
---

### Работа весами

1. В колбэке `onCreate()` или при запуске операции (`activity`) инициализируйте класс `ru.evotor.devices.commons.DeviceServiceConnector`:

    `DeviceServiceConnector.startInitConnections(getApplicationContext());`

    Класс инициализируется асинхронно, чтобы не препятствовать вызывающему потоку

    {% include tip.html content="Воспользуйтесь методом `addConnectionWrapper`, чтобы получить событие об успешном подключении. Используйте это событие, если необходимо выполнить какой-либо код сразу после установки соединения." %}

2. Вызовите метод `DeviceServiceConnector.getScalesService()`.

    Метод не может быть `null` и в случае успеха возвращает объект `ru.evotor.devices.commons.IScalesServiceWrapper`.

    Метод может вернуть следующие исключения (`exception`):
    * `ru.evotor.devices.commons.exception.ServiceNotConnectedException` возвращается в результате серии неудачных попыток подключиться к весам.
    * `ru.evotor.devices.commons.exception.DeviceServiceException` – наследованое исключение.

3. С помощью метода `Weight getWeight(int deviceId)`, объекта `ru.evotor.devices.commons.IScalesService`, вы можете получить вес товара `Weight`.

    Где:

    `deviceId` – указывает устройство, для которого вызывается метод.

    {% include important.html content="В настоящий момент приложения не могут получить список номеров подключённых устройств, поэтому вместо номера устройства всегда следует передавать константу `ru.evotor.devices.commons.Constants.DEFAULT_DEVICE_INDEX`. Будет использовано устройство, заданное по умолчанию." %}

    `Weight` – вес товара, заданный в виде:

   ```java
   private final BigDecimal weightInGrams;//вес товара в граммах, возвращённый весами.
   // поддерживали ли весы флаг стабильности при последнем взвешивании
   private final boolean supportStable;//Указывает был установлен флаг стабильности при последнем взвешивании или нет.
   private final boolean stable;//Указывает стабильность последнего взвешивания.
   ```

Метод может вернуть наследованное исключение `ru.evotor.devices.commons.exception.DeviceServiceException`.
